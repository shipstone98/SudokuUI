//
//  ContentViewModel.swift
//  SudokuUI
//
//  Created by Christopher Shipstone on 31/03/2026.
//

import Sudoku
import SwiftUI

@Observable
internal final class ContentViewModel {
    private var _selection: (row: Int, column: Int)?
    
    internal var selection: (row: Int, column: Int)? {
        get {
            self._selection
        } set {
            guard var sudoku = self.sudoku else {
                return
            }
            
            guard let newValue else {
                self._selection = nil
                return
            }
            
            if let value = self.state.value {
                if self.state.isNotesSelected {
                    sudoku.toggleNote(newValue.row, newValue.column, value)
                } else if sudoku[newValue.row, newValue.column] == value {
                    sudoku[newValue.row, newValue.column] = 0
                } else {
                    sudoku[newValue.row, newValue.column] = value
                }
                
                self.sudoku = sudoku
            } else if self.state.isClearSelected {
                sudoku.clear(newValue.row, newValue.column)
                self.sudoku = sudoku
            } else {
                if let oldValue = self._selection {
                    guard !(
                        oldValue.row == newValue.row
                        && oldValue.column == newValue.column
                    ) else {
                        self._selection = nil
                        return
                    }
                }
                
                self._selection = newValue
            }
        }
    }
    
    internal private(set) var state: ControlState
    internal private(set) var sudoku: ArraySudokuPuzzle?
    
    internal init() {
        self._selection = nil
        self.state = .init()
        self.sudoku = nil
    }
    
    internal func load<R>(
        _ repository: R,
        for difficulty: SudokuPuzzleDifficulty
    ) async throws where R : Repository {
        guard let seed = try await repository.retrieve(for: difficulty) else {
            return
        }
        
        self._selection = nil
        self.state = .init()
        self.sudoku = .init(seed)
    }
    
    internal func setControlClear() {
        guard var sudoku = self.sudoku else {
            return
        }
        
        if let selection = self._selection {
            sudoku.clear(selection.row, selection.column)
            self.sudoku = sudoku
        } else {
            self._state.isClearSelected.toggle()
        }
    }
    
    internal func setControlNotes() {
        guard sudoku != nil else {
            return
        }
        
        self.state.isNotesSelected.toggle()
    }
    
    internal func setControlValue(_ value: Int) {
        guard var sudoku = self.sudoku else {
            return
        }
        
        if let selection = self._selection {
            if self.state.isNotesSelected {
                sudoku.toggleNote(selection.row, selection.column, value)
            } else if sudoku[selection.row, selection.column] == value {
                sudoku[selection.row, selection.column] = 0
            } else {
                sudoku[selection.row, selection.column] = value
            }
            
            self.sudoku = sudoku
        } else if self.state.value == value {
            self.state.value = nil
        } else {
            self.state.value = value
        }
    }
    
    internal func undo() {
        guard var sudoku else {
            return
        }
        
        sudoku.undo()
        self.sudoku = sudoku
    }
}

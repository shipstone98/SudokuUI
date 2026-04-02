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
            if let oldValue = self._selection, let newValue {
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
        self.state.isClearSelected.toggle()
    }
    
    internal func setControlNotes() {
        self.state.isNotesSelected.toggle()
    }
    
    internal func setControlValue(_ value: Int) {
        if self.state.value == value {
            self.state.value = nil
        } else {
            self.state.value = value
        }
    }
    
    internal func undo() {
        self.sudoku?.undo()
    }
}

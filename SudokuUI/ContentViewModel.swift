//
//  ContentViewModel.swift
//  SudokuUI
//
//  Created by Christopher Shipstone on 03/03/2026.
//

import Sudoku
import SwiftUI

@Observable
internal final class ContentViewModel {
    private var _control: Control
    private var _selection: (row: Int, column: Int)?
    
    internal var control: Control {
        get {
            self._control
        } set {
            guard !self.isComplete else {
                return
            }
            
            if let newValueNumber = newValue.number {
                if newValue.isNotesSelected != self._control.isNotesSelected {
                    if newValueNumber > 0 {
                        self._control.isNotesSelected.toggle()
                    }
                } else {
                    if let (row, column) = self._selection {
                        guard var sudoku = self.sudoku,
                              !sudoku.isReadOnly(row, column) else {
                            return
                        }
                        
                        if self._control.number == 0 {
                            sudoku.removeAllNotes(row, column)
                            sudoku[row, column] = 0
                        } else if self._control.isNotesSelected {
                            sudoku.toggleNote(row, column, newValueNumber)
                        } else {
                            let value = sudoku[row, column]
                            
                            if value == newValueNumber {
                                sudoku[row, column] = 0
                            } else {
                                sudoku.removeNotes(row, column, newValueNumber)
                                sudoku[row, column] = newValueNumber
                            }
                        }
                        
                        self.sudoku = sudoku
                    } else if self._control.number == newValueNumber {
                        self._control.number = nil
                    } else {
                        if newValueNumber == 0 {
                            self._control.isNotesSelected = false
                        }
                        
                        self._control.number = newValueNumber
                    }
                }
            } else {
                self._control.isNotesSelected.toggle()
            }
        }
    }
    
    private var isComplete: Bool {
        guard let sudoku = self.sudoku else {
            return false
        }
        
        return sudoku.isComplete
    }
    
    internal var selection: (row: Int, column: Int)? {
        get {
            self._selection
        } set {
            guard let (row, column) = newValue,
                  row > -1 && row < 9 && column > -1 && column < 9 else {
                self._selection = nil
                return
            }
            
            if let controlNumber = self.control.number {
                if var sudoku = self.sudoku, !sudoku.isReadOnly(row, column) {
                    if controlNumber == 0 {
                        sudoku.removeAllNotes(row, column)
                        sudoku[row, column] = 0
                    } else if self.control.isNotesSelected {
                        sudoku.toggleNote(row, column, controlNumber)
                    } else {
                        let value = sudoku[row, column]
                        
                        if value == controlNumber {
                            sudoku[row, column] = 0
                        } else {
                            sudoku.removeNotes(row, column, controlNumber)
                            sudoku[row, column] = controlNumber
                        }
                    }
                    
                    self._selection = nil
                    self.sudoku = sudoku
                }
                
                self._selection = nil
            } else {
                if let oldValue = self._selection,
                   let newValue = newValue,
                   oldValue == newValue {
                    self._selection = nil
                } else {
                    self._selection = newValue
                }
            }
        }
    }
    
    internal var sudoku: ArraySudokuPuzzle?
    
    internal init() {
        let seed = ArraySudokuPuzzleSeed()
        self._control = .init()
        self._selection = nil
        self.sudoku = ArraySudokuPuzzle(seed)
    }
    
    internal func undo() {
        guard !self.isComplete, var sudoku = self.sudoku else {
            return
        }
        
        self._control = .init()
        self._selection = sudoku.undo()
        self.sudoku = sudoku
    }
}

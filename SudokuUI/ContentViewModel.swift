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
            if let oldValue = self._selection {
                guard let newValue,
                      !(
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
    
    internal let sudoku: ArraySudokuPuzzle?
    
    internal init() {
        self._selection = nil
        self.sudoku = nil
    }
}

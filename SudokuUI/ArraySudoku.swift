//
//  ArraySudoku.swift
//  SudokuUI
//
//  Created by Christopher Shipstone on 03/03/2026.
//

import Sudoku

internal extension ArraySudoku {
    static func parse(_ cellsString: String) -> ArraySudoku {
        var sudoku = ArraySudoku()
        var row = 0
        var column = 0
        
        for index in cellsString.indices {
            let cellString = String(cellsString[index])
            sudoku[row, column] = Int(cellString)!
            
            column += 1
            
            if column == 9 {
                column = 0
                row += 1
            }
        }
        
        return sudoku
    }
}

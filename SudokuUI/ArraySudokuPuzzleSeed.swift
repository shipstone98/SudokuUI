//
//  ArraySudokuPuzzleSeed.swift
//  SudokuUI
//
//  Created by Christopher Shipstone on 03/03/2026.
//

import Sudoku

internal struct ArraySudokuPuzzleSeed : SudokuPuzzleSeed {
    internal let solutions: ArraySudoku
    internal let values: ArraySudoku
    
    internal init() {
        self.solutions = .parse("913568427687342915254197683479685132162734598538219764345926871726851349891473256")
        self.values = .parse("900508007080302905054000080070680032100004008500219060000906001726001040001470056")
    }
}

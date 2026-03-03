//
//  ArraySudokuPuzzle.swift
//  SudokuUI
//
//  Created by Christopher Shipstone on 03/03/2026.
//

import Sudoku

internal struct ArraySudokuPuzzle : SudokuPuzzle {
    private var cells: [Cell]
    internal private(set) var isComplete: Bool
    
    internal subscript(row: Int, column: Int) -> Int {
        get {
            self.cells[row * 9 + column].value
        } set {
            guard !self.isComplete else {
                return
            }
            
            let index = row * 9 + column
            var cell = self.cells[index]
            
            guard !(cell.isReadOnly || cell.value == newValue) else {
                return
            }
            
            cell.value = newValue
            self.cells[index] = cell
            
            for cell in self.cells {
                guard cell.value == cell.solution else {
                    return
                }
            }
            
            self.isComplete = true
        }
    }
    
    internal init() {
        var cells: [Cell] = []
        let values = "900508007080302905054000080070680032100004008500219060000906001726001040001470056"
        let solutions = "913568427687342915254197683479685132162734598538219764345926871726851349891473256"
        
        for index in values.indices {
            let valueString = String(values[index])
            let solutionString = String(solutions[index])
            let value = Int(valueString)!
            let solution = Int(solutionString)!
            let cell = Cell(value, solution, isReadOnly: value == solution)
            cells.append(cell)
        }
        
        self.cells = cells
        self.isComplete = false
    }
    
    internal func getNotes(_ row: Int, _ column: Int) -> Set<Int> {
        self.cells[row * 9 + column].notes
    }
    
    internal func isCorrect(_ row: Int, _ column: Int) -> Bool {
        guard !self.isComplete else {
            return true
        }
        
        let cell = self.cells[row * 9 + column]
        return cell.value == cell.solution
    }
    
    internal func isReadOnly(_ row: Int, _ column: Int) -> Bool {
        self.cells[row * 9 + column].isReadOnly
    }
    
    internal mutating func removeAllNotes(_ row: Int, _ column: Int) {
        self.cells[row * 9 + column].notes.removeAll()
    }
    
    internal mutating func toggleNote(_ row: Int, _ column: Int, _ value: Int) {
        let index = row * 9 + column
        var cell = self.cells[index]
        let (isInserted, _) = cell.notes.insert(value)
        
        if !isInserted {
            cell.notes.remove(value)
        }
        
        self.cells[index] = cell
    }
    
    private struct Cell {
        fileprivate let isReadOnly: Bool
        fileprivate var notes: Set<Int>
        fileprivate let solution: Int
        fileprivate var value: Int
        
        fileprivate init(_ value: Int, _ solution: Int, isReadOnly: Bool) {
            self.isReadOnly = isReadOnly
            self.notes = [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
            self.solution = solution
            self.value = value
        }
    }
}

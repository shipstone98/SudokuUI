//
//  MemoryRepository.swift
//  SudokuUI
//
//  Created by Christopher Shipstone on 31/03/2026.
//

import Sudoku

internal struct MemoryRepository : Repository {
    internal func retrieve(for difficulty: SudokuPuzzleDifficulty) -> ArraySudokuPuzzleSeed? {
        var generator = SystemRandomNumberGenerator()
        return .init(for: difficulty, using: &generator)
    }
}

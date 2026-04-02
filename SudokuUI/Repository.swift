//
//  Repository.swift
//  SudokuUI
//
//  Created by Christopher Shipstone on 31/03/2026.
//

import Sudoku

internal protocol Repository {
    func retrieve(for difficulty: SudokuPuzzleDifficulty) async throws -> ArraySudokuPuzzleSeed?
}

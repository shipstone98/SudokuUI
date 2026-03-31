//
//  ControlState.swift
//  SudokuUI
//
//  Created by Christopher Shipstone on 31/03/2026.
//

internal struct ControlState {
    internal var isClearSelected: Bool
    internal var isNotesSelected: Bool
    internal var value: Int?
    
    internal init() {
        self.isClearSelected = false
        self.isNotesSelected = false
        self.value = nil
    }
}

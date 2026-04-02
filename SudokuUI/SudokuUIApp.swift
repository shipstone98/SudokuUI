//
//  SudokuUIApp.swift
//  SudokuUI
//
//  Created by Christopher Shipstone on 31/03/2026.
//

import SwiftUI

@main
internal struct SudokuUIApp : App {
    internal var body: some Scene {
        WindowGroup {
            ContentView(self.repository)
        }
    }
    
    private let repository: MemoryRepository
    
    internal init() {
        self.repository = .init()
    }
}

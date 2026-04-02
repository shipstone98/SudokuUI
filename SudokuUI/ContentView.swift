//
//  ContentView.swift
//  SudokuUI
//
//  Created by Christopher Shipstone on 31/03/2026.
//

import Sudoku
import SwiftUI
import SwiftUIUtilities

internal struct ContentView<R> : View where R : Repository {
    internal var body: some View {
        VStack {
            SudokuView(self.viewModel.sudoku, self.$viewModel.selection)
            Spacer()
            ControlView(self.viewModel)
        }
        .padding()
        .task {
            do {
                try await self.viewModel.load(self.repository, for: .admiral)
            } catch { }
        }
    }
    
    private let repository: R
    
    @State
    private var viewModel: ContentViewModel
    
    internal init(_ repository: R) {
        self.repository = repository
        self.viewModel = .init()
    }
}

#Preview {
    ContentView(MemoryRepository())
}

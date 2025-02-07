//
//  ContentView.swift
//  Lab1_Huanbing_Zhang
//
//  Created by Steve Zhang on 2025-02-07.
//

import SwiftUI

struct ContentView: View {
    @State private var number: Int = Int.random(in: 1...100)
    @State private var isPrime: Bool = false
    @State private var showResult: Bool = false
    @State private var isCorrect: Bool = false
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

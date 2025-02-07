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
    @State private var correctAnswers: Int = 0
    @State private var wrongAnswers: Int = 0
    @State private var attempts: Int = 0
    @State private var showAlert: Bool = false
    @State private var timer: Timer?
    var body: some View {
        VStack {
            Text("\(number)")
                .font(.system(size: 60, weight: .bold, design: .default))
                .padding()
        }
    }
    func checkAnswer(isPrimeSelected: Bool) {
        if isPrimeSelected == isPrime {
            isCorrect = true
            correctAnswers += 1
        } else {
            isCorrect = false
            wrongAnswers += 1
        }

        showResult = true
        attempts += 1
    }
}

#Preview {
    ContentView()
}

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
            Button(action: { checkAnswer(isPrimeSelected: true) }) {
                           Text("Prime")
                               .font(.title)
                               .padding()
            }
                       
            Button(action: { checkAnswer(isPrimeSelected: false) }) {
                           Text("Not Prime")
                               .font(.title)
                               .padding()
            }
            if showResult {
                            Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .foregroundColor(isCorrect ? .green : .red)
                                .padding()
            }
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

        if attempts == 10 {
            showAlert = true
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                startNewRound()
            }
        }
    }
    func startNewRound() {
        number = Int.random(in: 1...100)
        isPrime = checkIfPrime(number)
        showResult = false

        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
            wrongAnswers += 1
            attempts += 1

            if attempts == 10 {
                showAlert = true
            } else {
                startNewRound()
            }
        }
    }
    func checkIfPrime(_ num: Int) -> Bool {
           if num < 2 { return false }
           for i in 2..<num {
               if num % i == 0 {
                   return false
               }
           }
           return true
    }
    func resetGame() {
        correctAnswers = 0
        wrongAnswers = 0
        attempts = 0
        startNewRound()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

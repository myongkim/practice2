//
//  ContentView.swift
//  practice2
//
//  Created by Isaac Kim on 4/12/22.
//

import SwiftUI

let name = "Paul"

struct ContentView: View {
    @State private var level = 2
    @State private var score = 0
    @State private var answer = ""
    @State private var randomNumber = 1...25
    @State private var multipleNumber = 1
    @State private var selecttedIndex = 0
    @State private var numberArray = [5,10,15,20]
    
    //game integer
    @State private var multiplier = 1...9
    
    
    @State private var gameOn = false
    
    let range = 2...12
    
    var body: some View {
        VStack {
            Spacer()
            Stepper("Mulplication Level   \(level)", value: $level, in: range)
                .padding()
            
            Text("Choose the number of Game")
            Picker("Number of Game", selection: $selecttedIndex, content: {
                ForEach(numberArray, id: \.self) {
                    Text("\($0)")
                }
                if let random = randomNumber.randomElement() {
                    Text("\(random)")
                    
                }
                
                
                
            })
                .pickerStyle(.automatic)
                
            
            
            
            
            
            Button("Press to Start") {
                // play game button
                playGame()
            }
            
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .font(.subheadline)
            
            Text(gameOn ? "\(level) X \(multipleNumber)" : "" )
                .padding()
                .font(.title)
            
            TextField("Write your answer...", text: $answer)
                .padding()
                .background(Color.gray.opacity(0.3).cornerRadius(10))
                .foregroundColor(.black)
                .font(.headline)
                .keyboardType(.numberPad)
                .submitLabel(.done)
                .onSubmit {
                    // when submit do action
                    answerQuestion()
                    resetQuestion()
                }
            
            
                
            
            
            Spacer()
            Spacer()
            
            
            Text("Score \(score)")
        }
        
    }
    
    func playGame() {
        
        guard let setModifier = multiplier.randomElement() else { return }
        multipleNumber = setModifier
        
        gameOn = true
        
    }
    
    func answerQuestion() {
        
        if answer == "\(level * multipleNumber)" {
            score += 1
        } else {
            score -= 1
        }
    }
    func resetQuestion() {
        guard let setModifier = multiplier.randomElement() else { return }
        multipleNumber = setModifier

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

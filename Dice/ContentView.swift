//
//  ContentView.swift
//  Dice
//
//  Created by emi oiso on 2023/09/30.
//

import SwiftUI

struct ContentView: View {
    @State private var randomeNumner = 1
    @State private var timer: Timer?
    @State private var isRolling = false
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "die.face.\(randomeNumner)")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width/2)
                .padding()
            Spacer()
            Button {
                playDice()
                
            } label: {
                Text("サイコロをふる")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.blue)
                    .cornerRadius(10)
            }
            .disabled(isRolling)
            Spacer()
        }
        .padding()
    }
    private func playDice(){
        print("ボタンが押されたよ")
        isRolling = true
        randomeNumner = Int.random(in: 1...6)
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            randomeNumner = Int.random(in: 1...6)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            timer?.invalidate()
            timer = nil
            isRolling = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  slots-game
//
//  Created by Celil Çağatay Gedik on 7.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State var credits = 1000
    @State var symbols = ["apple", "star", "cherry"]
    @State var numbers = [0 , 1 , 2]
    @State var betAmount = 5
    
    
    var body: some View {
        
        ZStack {
            
            //background
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all
                )
        
        VStack {
            Spacer()
            
            Text("Slots")
                .fontWeight(.bold)
                .scaleEffect(3)
            
                //credits counter
            Spacer()
            Text("Credits: " + String(credits))
                .foregroundColor(.black)
                .padding(.all, 10)
                .background(Color.white.opacity(0.5))
                    .cornerRadius(20)

            Spacer()
            
            //cards
            HStack {
                Spacer()
                Image(symbols[numbers[0]])
                    .resizable().aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.5)).cornerRadius(20)
                Spacer()
                Image(symbols[numbers[1]])
                    .resizable().aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.5)).cornerRadius(20)
                Spacer()
                Image(symbols[numbers[2]])
                    .resizable().aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.5)).cornerRadius(20)
                Spacer()
            }
            Spacer()
            
            
            //spin button
            Button(action: {
                
                //change the image
                self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
                
                self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
                
                self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
                
                //check winnings
                if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                    
                    //winning
                    self.credits += self.betAmount * 10
                }
                else {
                    self.credits -= self.betAmount
                }
                
                
            }, label: {Text("Spin")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.all, 10.0)
                    .frame(width: 150.0)
                    .background(Color.pink)
                    .cornerRadius(20)}
                   )
            Spacer()
        }
        }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

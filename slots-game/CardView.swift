//
//  CardView.swift
//  slots-game
//
//  Created by Celil Çağatay Gedik on 7.09.2022.
//

import SwiftUI

struct CardView: View {
    
    @Binding var symbol:String
    @Binding var background:Color
    
    
    var body: some View {
        Image(symbol)
            .resizable().aspectRatio(1, contentMode: .fit)
            .background(background.opacity(0.5)).cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol: Binding.constant("cherry"), background: Binding.constant(Color.green))
    }
}

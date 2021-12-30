//
//  ContentView.swift
//  Memorize
//
//  Created by Max Nonisa on 12/27/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojis_1 = ["🥶", "😱", "😰", "😶", "😐", "😵‍💫", "😭", "🐻", "😶‍🌫️"]
    @State var emojis_2 = ["🍏", "🍓", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇"]
    @State var emojis_3 = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱"]

    @State var currentEmojis = 1
    
    
    var body: some View {
        VStack{
            Text("Memorize!").font(.largeTitle).padding()
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    if currentEmojis == 1{
                        ForEach (emojis_1[0..<emojis_1.count],
                                id: \.self){ emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                    else if currentEmojis == 2{
                        ForEach(emojis_2[0..<emojis_2.count],
                                id: \.self){ emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                    else if currentEmojis == 3{
                        ForEach(emojis_3[0..<emojis_3.count],
                                id: \.self){ emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack{
                Button(action: {
                    emojis_1.shuffle()
                    currentEmojis = 1
                    
                },
                       label: {
                    VStack{
                        Image(systemName: "face.smiling").font(.largeTitle)
                        Text("Theme 1").font(.footnote)}
                    })
                Spacer()
                Button(action: {
                    emojis_2.shuffle()
                    currentEmojis = 2},
                       label: {
                    VStack{
                        Image(systemName: "staroflife.circle").font(.largeTitle)
                        Text("Theme 2").font(.footnote)}
                    })
                Spacer()
                Button(action: {
                    emojis_3.shuffle()
                    currentEmojis = 3},
                       label: {
                    VStack{
                        Image(systemName: "hand.raised.fill").font(.largeTitle)
                        Text("Theme 3").font(.footnote)}
                    })
            }
            .padding()

        }
        .padding(.horizontal)
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            else{
                shape.fill()
            }
        }
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

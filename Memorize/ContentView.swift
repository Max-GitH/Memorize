//
//  ContentView.swift
//  Memorize
//
//  Created by Max Nonisa on 12/27/21.
//

import SwiftUI

struct ContentView: View {
    
    let emojis_1 = ["🥶", "😱", "😰", "😶", "😐", "😵‍💫", "😭", "🐻"]
    let emojis_2 = ["🍏", "🍓", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇"]
    let emojis_3 = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉"]

    @State var currentEmojis = 1
    
    
    var body: some View {
        VStack{
            Text("Memorize!").font(.largeTitle).padding()
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    
                    ForEach(currentEmojis[0..<currentEmojis.count],
                            id: \.self){ emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack{
                ThemeButton(themeNumber: 1, themePicture: "face.smiling")
                Spacer()
                ThemeButton(themeNumber: 2, themePicture: "face.smiling")
                Spacer()
                ThemeButton(themeNumber: 3, themePicture: "face.smiling")
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    
    var ThemeButton: Button<<#Label: View#>> {
        action:{},
        label{}
        var themeNumber: Int
        var themePicture: String
        
        var body: some View{
            Button(action:{
                if themeNumber == 1{
                    currentEmojis = 1
                }
                else if themeNumber == 2{
                    currentEmojis = 2
                }
                else if themeNumber == 3{
                    currentEmojis = 3
                }
            }, label: {
                VStack{
                    Image(systemName: themePicture).font(.largeTitle)
                    Text("Theme " + String(themeNumber))
                }
            }
            )
        }
    }
    
}

//struct ThemeButton: View {
//    var themeNumber: Int
//    var themePicture: String
//
//    var body: some View{
//        Button(action:{
//            if themeNumber == 1{
//                currentEmojis = 1
//            }
//            else if themeNumber == 2{
//                currentEmojis = 2
//            }
//            else if themeNumber == 3{
//                currentEmojis = 3
//            }
//        }, label: {
//            VStack{
//                Image(systemName: themePicture).font(.largeTitle)
//                Text("Theme " + String(themeNumber))
//            }
//        }
//        )
//    }
//}

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

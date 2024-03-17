//
// ContentView.swift : Assignment1
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct ContentView: View {
    @State private var counters = Array(repeating: 0, count: 50) // 
    
    let emojis = ["😄", "😊", "😅", "😆", "😂"]

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Emoji Counters")
                    .font(.title)
                    .padding()
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(height: geometry.size.height * 0.1) // Adjust height
                
                ScrollView {
                    ForEach(emojis.indices, id: \.self) { index in
                        HStack {
                            Text(emojis[index])
                                .font(.title)
                            Spacer()
                            Button(action: {
                                self.counters[index] += 1
                            }) {
                                Image(systemName: "plus.circle")
                            }
                            .padding(.trailing, 10)
                            Text("\(counters[index])")
                            Button(action: {
                                self.counters[index] -= 1
                            }) {
                                Image(systemName: "minus.circle")
                            }
                        }
                        .padding()
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

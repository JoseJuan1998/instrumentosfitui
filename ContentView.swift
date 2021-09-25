//
//  ContentView.swift
//  instrument
//
//  Created by jose juan alcantara rincon on 25/09/21.
//

import SwiftUI
import AVFoundation

var player: AVAudioPlayer!

struct ContentView: View {
    var body: some View {
        VStack{
            ButtonsView(title: "A", color: Color.red)
            ButtonsView(title: "B", color: Color.pink)
            ButtonsView(title: "C", color: Color.orange)
            ButtonsView(title: "D", color: Color.yellow)
            ButtonsView(title: "E", color: Color.green)
            ButtonsView(title: "F", color: Color.blue)
            ButtonsView(title: "G", color: Color.purple)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonsView: View {
    var title: String
    var color: Color
    var body: some View{
        Button(action:{
            let url = Bundle.main.url(forResource: title, withExtension: "wav")
            
            guard url != nil else{return}
            
            do{
                player = try AVAudioPlayer(contentsOf: url!)
                player?.play()
            } catch{
                print("error")
            }
        }){
            Text(title)
                .padding(30)
                .padding(.horizontal, 100)
                .font(.largeTitle)
                .foregroundColor(.white)
                .background(color)
                .cornerRadius(8)
        }
    }
}

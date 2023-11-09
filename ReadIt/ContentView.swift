//
//  ContentView.swift
//  ReadIt
//
//  Created by Pieter Yoshua Natanael on 07/11/23.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var textToRead = ""
    @State private var isReading = false
    let speechSynthesizer = AVSpeechSynthesizer()

    var body: some View {
        VStack {
            Text("SayIt!")
                .font(.largeTitle)
                .padding()

            TextEditor(text: $textToRead)
                .padding()

            Button(action: {
                if isReading {
                    speechSynthesizer.stopSpeaking(at: .immediate)
                } else {
                    speak(text: textToRead)
                }
                isReading.toggle()
            }) {
                Text(isReading ? "Stop" : "Start")
                    .padding()
                    .foregroundColor(.white)
                    .background(isReading ? Color.red : Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
    }

    func speak(text: String) {
        let speechUtterance = AVSpeechUtterance(string: text)
        speechSynthesizer.speak(speechUtterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  WordScramble
//
//  Created by Ercan Kabali on 10.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false

    var body: some View {
        NavigationStack{
            List{
                Section{
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                Section{
                    ForEach(usedWords,id: \.self){ word in
                        HStack{
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                        
                        
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform:startGame)
            .alert(errorTitle,isPresented: $showingError){
                Button("Okay"){}
            }message: {
                Text(errorMessage)
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button("Change"){
                        startGame()                    }
                })
            }
        }
        
    }
    
    func addNewWord(){
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 3 else {
            wordError(title: "Must be more than 3", message:"You cant type less than 3 letters")
            return
        }
        
        guard isOriginal(word: answer)else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer)else{
            wordError(title: "Word not possible", message: "you cant spell")
            return
        }
        
        guard isReal(word: answer)else {
            wordError(title: "Word not recognized", message: "You cant just make them up,you know!!")
            return
        }
        
        
        withAnimation{
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    
    func startGame(){
        if let startWordsUrl = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startWords = try? String(contentsOf: startWordsUrl){
                if(usedWords.count > 0){
                    withAnimation{
                        usedWords.removeAll()
                    }
                }
                let allWords = startWords.components(separatedBy: "\n")
                
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("Couldnt load start.txt file from bundle!!!")
        
    }
    
    func isOriginal(word:String)-> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word:String) -> Bool {
        var tempWord = rootWord
        
        
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter){
                tempWord.remove(at: pos)
            }else {
                return false
            }
        }
        
        return true
        
    }
    
    func isReal(word:String)->Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title:String, message:String){
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    
    
    
}

#Preview {
    ContentView()
}

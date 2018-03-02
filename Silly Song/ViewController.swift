//
//  ViewController.swift
//  Silly Song
//
//  Created by Thiago Antonio Ramalho on 28/02/18.
//  Copyright © 2018 Tramalho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    
    let bananaFanaTemplate = ["<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
                              "Banana Fana Fo F<SHORT_NAME>",
                              "Me My Mo M<SHORT_NAME>",
                              "<FULL_NAME>"].joined(separator: "\n")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        let name = nameField.text
        if name != nil && (!(name?.isEmpty)!) {
            let result = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: name!)
            lyricsView.text = result
        }
    }
}

func shortNameFromName(name: String) -> String {
    
    var lowercaseName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    
    var firstVowelIdx:Int = -1
    
    for (idx, item) in lowercaseName.enumerated() {
        
        let letter = String(item)
        
        if letter.rangeOfCharacter(from: vowelSet) != nil && firstVowelIdx == -1{
            firstVowelIdx = idx
            break
        }
    }
    
    if firstVowelIdx > 0 {
        let indexToRemove = lowercaseName.index(lowercaseName.startIndex, offsetBy: firstVowelIdx-1)
        lowercaseName.remove(at: indexToRemove)
    }
    
    return lowercaseName
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameFromName(name: fullName)
    let resultString = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return resultString
}


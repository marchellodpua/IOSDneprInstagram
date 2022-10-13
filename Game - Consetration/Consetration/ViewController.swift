//
//  ViewController.swift
//  Consetration
//
//  Created by marchello on 12.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = ConcentrationGame(numberOfPairsOfCards: (buttonCollection.count + 1) / 2)
    
    var touches = 0 {
        didSet{
            touchesLabel.text = "Touches: \(touches)"
        }
    }
    
    var emojiCollection = ["🦊","🐶","🐱","🐰","🐯","🐤","🐨","🐼","🐭","🐹","🐻","🐮"]
    
    
    var emojiDictionary = [Int:String]()
    
    func emojiIdentifier(for card: Card) -> String {
//        if emojiDictionary[card.identifier] != nil {
//           return emojiDictionary[card.identifier]!
//        } else {
//            return "?"
//        }
        
        if emojiDictionary[card.identifier] == nil{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.identifier] = emojiCollection.remove(at:  randomIndex)
        }
        return emojiDictionary[card.identifier] ?? "?"
        
    }
    
    func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            button.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 50)
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 50)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
            } else {
                button.setTitle(" ", for: .normal)
                button.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 50)
                
               
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 0) : #colorLiteral(red: 0, green: 0.4563989639, blue: 0.8881403804, alpha: 1)
            }
            
        }
    }
    
    
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var touchesLabel: UILabel!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender)
        {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
        
    }

    }
    
    
    
    
    



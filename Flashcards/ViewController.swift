//
//  ViewController.swift
//  Flashcards
//
//  Created by Jashan Bhinder on 2/15/20.
//  Copyright © 2020 Jashan Bhinder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet var card: UIView!
    @IBOutlet weak var Flashcards: UIView!
    @IBOutlet weak var OptionOne: UIButton!
    @IBOutlet weak var OptionTwo: UIButton!
    @IBOutlet weak var OptionThree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Flashcards.layer.cornerRadius = 20.0
        Flashcards.layer.shadowRadius = 15.0
        Flashcards.layer.shadowOpacity = 0.2
        Flashcards.clipsToBounds = true
        OptionOne.layer.borderWidth = 3.0
        OptionOne.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        OptionOne.layer.cornerRadius = 20.0
        OptionOne.layer.shadowRadius = 15.0
        OptionOne.layer.shadowOpacity = 0.2
        OptionTwo.layer.borderWidth = 3.0
        OptionTwo.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        OptionTwo.layer.cornerRadius = 20.0
        OptionTwo.layer.shadowRadius = 15.0
        OptionThree.layer.shadowOpacity = 0.2
        OptionThree.layer.borderWidth = 3.0
        OptionThree.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        OptionThree.layer.cornerRadius = 20.0
        OptionThree.layer.shadowRadius = 15.0
        OptionThree.layer.shadowOpacity = 0.2
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsController = self
    }
    
    @IBAction func didTapOptionTwo(_ sender: Any) {
        if((OptionOne.isHidden && OptionThree.isHidden && frontLabel.isHidden == false)  == false){
            OptionOne.isHidden = true
            OptionThree.isHidden = true
            frontLabel.isHidden = true
        }
            
        else if(OptionTwo.isHidden == true && frontLabel.isHidden == true){
            OptionTwo.isHidden = true
            frontLabel.isHidden = false
        }
    }
    func updateFlashcards(question: String, OptionOne: String, Optiontwo: String, Optionthree: String){
    }
    
}


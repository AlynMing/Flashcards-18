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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Flashcards.layer.cornerRadius = 20.0
        Flashcards.layer.shadowRadius = 15.0
        Flashcards.layer.shadowOpacity = 0.2
        Flashcards.clipsToBounds = true
        
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if(frontLabel.isHidden == false){
            frontLabel.isHidden = true
        }
        else if(frontLabel.isHidden == true){
            frontLabel.isHidden = false
        }
    }
}


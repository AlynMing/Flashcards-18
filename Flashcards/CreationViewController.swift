//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Jashan Bhinder on 3/6/20.
//  Copyright © 2020 Jashan Bhinder. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashcardsController: ViewController!

    @IBOutlet weak var QuestionTextField: UITextField!
    @IBOutlet weak var OptionOneTextField: UITextField!
    @IBOutlet weak var OptionTwoTextField: UITextField!
    @IBOutlet weak var OptionThreeTextField: UITextField!
    @IBOutlet weak var AnswerTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText = QuestionTextField.text
        let AnswerText = AnswerTextField.text
        let OptionOneText = OptionOneTextField.text
        let OptionTwoText = OptionTwoTextField.text
        let OptionThreeText = OptionThreeTextField.text
        
        flashcardsController.updateFlashcards (Question: questionText!, Answer: AnswerText!, OptionOne: OptionOneText!, OptionTwo: OptionTwoText!, OptionThree: OptionThreeText!)
    }

}

//
//  ViewController.swift
//  Flashcards
//
//  Created by Jashan Bhinder on 2/15/20.
//  Copyright © 2020 Jashan Bhinder. All rights reserved.
//

import UIKit

struct Flashcard{
    var Question: String
    var Answer: String
    var OptionOne: String
    var OptionTwo: String
    var OptionThree: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet var card: UIView!
    @IBOutlet weak var Question: UIView!
    @IBOutlet weak var Answer: UIView!
    @IBOutlet weak var OptionOne: UIButton!
    @IBOutlet weak var OptionTwo: UIButton!
    @IBOutlet weak var OptionThree: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func didTapOnDelete(_ sender: Any) {
        // Show confirmation
        let alert = UIAlertController(title: "Delete Flashcard", message: "Are you sure you want to delete it?", preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { action in
            self.deleteCurrentFlashcard()
        }
        alert.addAction(deleteAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    func deleteCurrentFlashcard(){
        
        // Delete Current
        flashcards.remove(at:currentIndex)
        
        // When the last card is deleted
        if currentIndex > flashcards.count - 1{
            currentIndex = flashcards.count - 1
        }
        // Update labels
        updateLabels()
        
        // Update button
        updateNextPrevButtons()
        
        // update flashcards to disk
        saveAllFlashcardsToDisk()
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        // Decrease current Index
        currentIndex = currentIndex - 1
        
        // update labels
        updateLabels()
        
        // Update button
        updateNextPrevButtons()
        
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        // Increase current Index
        currentIndex = currentIndex + 1
        
        // Update labels
        updateLabels()
        
        // Update button
        updateNextPrevButtons()
    }
    
    // Array to hold the Flashcards
    var flashcards = [Flashcard]()
    
    // Current Flashcard Index
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Read saved Flascards
        readSavedFlashcards()
        
        // Adding our inial Flashcards if needed
        if flashcards.count == 0 {
            updateFlashcards(Question:"What is the capital of California?", Answer: "Sacramento" , OptionOne: "San Francisco", OptionTwo: "Sacramento", OptionThree: "Los Angeles", isExisting: true)
        } else {
            updateLabels()
            updateNextPrevButtons()
        }
        
        Question.layer.cornerRadius = 20.0
        Question.layer.shadowRadius = 15.0
        Question.layer.shadowOpacity = 0.2
        Question.clipsToBounds = true
        Answer.layer.cornerRadius = 20.0
        Answer.layer.shadowRadius = 15.0
        Answer.layer.shadowOpacity = 0.2
        Answer.clipsToBounds = true
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
    
    func updateNextPrevButtons(){
        // Disable next button if at the end
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        
        // Disable the Prev button if at the beginning
        if currentIndex == flashcards.count + 1{
            prevButton.isEnabled = false
        } else {
            prevButton.isEnabled = true
        }
    }
    
    func updateLabels(){
        // Get current Flashcard
        let currentFlashcard = flashcards[currentIndex]
        
        //update labels
        frontLabel.text = currentFlashcard.Question
        backLabel.text = currentFlashcard.Answer
        OptionOne.setTitle(currentFlashcard.OptionOne, for: .normal)
        OptionTwo.setTitle(currentFlashcard.Answer, for: .normal)
        OptionThree.setTitle(currentFlashcard.OptionThree, for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsController = self
        if segue.identifier == "EditSegue"{
            creationController.initialQuestion = frontLabel.text
            creationController.initialAnswer = backLabel.text
        }
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
    
    func updateFlashcards(Question: String, Answer: String, OptionOne: String?, OptionTwo: String?, OptionThree: String?, isExisting: Bool){
        let flashcard = Flashcard(Question: Question, Answer: Answer, OptionOne: OptionOne!, OptionTwo: OptionTwo!, OptionThree: OptionThree!)
        
        if isExisting{
            // replace existing Flashcards
            flashcards[currentIndex] = flashcard
        }else {
            // Adding flashcard in the flashcard Array
            flashcards.append(flashcard)
            
            // Logging to the Console
            print("Added new Flashcard :)")
            print("We now have \(flashcards.count) flashcards")
            
            // Update Current Index
            currentIndex = flashcards.count - 1
            print("Our current Index \(currentIndex)")

            // Update Buttons
            updateNextPrevButtons()
            
            // Update Labels
            updateLabels()
            
            // Saving all Flashcards
            saveAllFlashcardsToDisk()
        }
    }
    
    func saveAllFlashcardsToDisk() {
        // From flashcard array to dictionary array
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.Question, "answer" : card.Answer, "OptionOne" : card.OptionOne, "OptionTwo" : card.OptionTwo, "OptionThree" : card.OptionThree]
        }
        
        // Save array on disk using UserDefault
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        // Log in
        print("Flashcards saved to UserDefault")
        
        // Save array on dish using UserDefault
        UserDefaults.standard.set(flashcards, forKey: "flashcards")
    }
    
    func readSavedFlashcards() {
        
        // Read Dictionary array from the disk(if any)
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
            // In here we have a dictionary array
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in
                return Flashcard(Question: dictionary["question"]!, Answer: dictionary["answer"]!, OptionOne: dictionary["OptionOne"]!, OptionTwo: dictionary["OptionTwo"]!, OptionThree: dictionary["OptionThree"]!)
            }
            // Put all these cards in our flashcards array
            flashcards.append(contentsOf: savedCards)
        }
    }
}


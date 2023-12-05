//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 29.11.2023.
//

import UIKit

final class ResultViewController: UIViewController {

    @IBOutlet var yourAnimalLabel: UILabel!
    @IBOutlet var yourAnimalDescriptionLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let chosenAnimal = numberOfResponses(answersChosen)
        yourAnimalLabel.text = "Вы - \(chosenAnimal.rawValue)"
        yourAnimalDescriptionLabel.text = chosenAnimal.definition
        
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

private extension ResultViewController {
        func numberOfResponses(_ answers: [Answer]) -> Animal {
            var numberOfResponses: [Animal: Int] = [:]
            var max = 1
            var yourResultAnimal: Animal? = nil
    
            for answer in answers {
                let animal = answer.animal
    
                if !numberOfResponses.keys.contains(animal) {
                    numberOfResponses[animal] = 1
                    continue
                } else {
                    numberOfResponses[animal]! += 1
                }
                
                if numberOfResponses[animal]! > max {
                    max = numberOfResponses[animal]!
                    yourResultAnimal = animal
                }
            }
            return yourResultAnimal!
        }
}

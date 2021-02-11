//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 08.02.2021.
//
// Передать сюда массив с ответами
// Определить наиболее часто встречающийся тип животного
// Отобразить результат в соответсвии с этим животным.

import UIKit

class ResultsViewController: UIViewController {
    
    
    @IBOutlet var animalEmojiLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var allUserAnswers: [Answer] = []
    
    var catCount: Int = 0
    var dogCount: Int = 0
    var turtleCount: Int = 0
    var rabbitCount: Int = 0
    
    var yourAnimal: AnimalType = .cat
    
    var countsArray: [Int] = []
    var animalsTypeArray: [AnimalType] = [.cat, .dog, .turtle, .rabbit]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let possibleAnswers = Answer.init(text: "My text", type: compare(countResult: countResult()))
        animalEmojiLabel.text = "Вы - \(possibleAnswers.type.rawValue)"
        descriptionLabel.text = possibleAnswers.type.definition
        
    }
    
    private func compare (countResult _: [Int]) -> AnimalType {
        
        for (animalType, count) in zip(animalsTypeArray, countsArray) {
            switch count {
            case countsArray.max()!:
                yourAnimal = animalType
                print(animalType, count)
                
                break
            default: break
                
            }
        }
        return yourAnimal
    }
    
    private func countResult() -> [Int] {
        for i in 0 ... allUserAnswers.count - 1 {
            
            switch allUserAnswers[i].type  {
            case .cat:
                catCount += 1
            case .dog:
                dogCount += 1
            case .turtle:
                turtleCount += 1
            case .rabbit:
                rabbitCount += 1
            }
        }
        
        countsArray.append(catCount)
        countsArray.append(dogCount)
        countsArray.append(turtleCount)
        countsArray.append(rabbitCount)
        
        return countsArray
    }
}



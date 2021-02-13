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
    var count = 0
    var resultingCountsByAnimalType: [AnimalType: Int] = [:]
    
//    var catCount = 0
//    var dogCount = 0
//    var turtleCount = 0
//    var rabbitCount = 0
//
 //   var yourAnimal: AnimalType = .cat
    
  //  var countsArray: [Int] = []
    // var animalsTypeArray: [AnimalType] = [.cat, .dog, .turtle, .rabbit]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        let animalsTypeArray = allUserAnswers.map { $0.type }
        let uniqueAnimalType = Array(Set(animalsTypeArray))

        for i in 0 ... (uniqueAnimalType.count - 1) {
            howManyAnimalByType(animalType: uniqueAnimalType[i])
        }
        
        let sortedResultingCountsByAnimalType = resultingCountsByAnimalType.sorted {$0.value > $1.value}
        guard let mostFrequencyAnimal = sortedResultingCountsByAnimalType.first?.key else { return }
        
        //result
        let possibleAnswers = Answer.init(text: "My text", type: mostFrequencyAnimal)
        animalEmojiLabel.text = "Вы - \(possibleAnswers.type.rawValue)"
        descriptionLabel.text = possibleAnswers.type.definition
        
        
//        let possibleAnswers = Answer.init(text: "My text", type: compare(countResult: countResult()))
//        animalEmojiLabel.text = "Вы - \(possibleAnswers.type.rawValue)"
//        descriptionLabel.text = possibleAnswers.type.definition
        
    }
    
    private func howManyAnimalByType (animalType: AnimalType) -> [AnimalType : Int] {
        
        for i in 0 ... allUserAnswers.count - 1 {
            if animalType == allUserAnswers[i].type {
            count += 1
        }
            resultingCountsByAnimalType.updateValue(count, forKey: animalType)
        }
        return resultingCountsByAnimalType
    }
    
  /*
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
 */
}


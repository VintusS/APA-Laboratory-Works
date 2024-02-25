//
//  arrayGenerator.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 25.02.2024.
//

import Foundation

func randomArray(length: Int) -> [Int] {
    var randomArray: [Int] = []

    for _ in 0..<length {
        let randomInt = Int(arc4random_uniform(UInt32(1000))) + 1
        randomArray.append(randomInt)
    }

    return randomArray
}

let arrayType1 = randomArray(length: 10)
let arrayType2 = randomArray(length: 100)
let arrayType3 = randomArray(length: 1000)
let arrayType4 = randomArray(length: 10000)
let arrayType5 = randomArray(length: 45000)


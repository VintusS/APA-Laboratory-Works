//
//  GoldenRatioMethod.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 14.02.2024.
//

import Foundation

func fibonacciGoldenRatio(n: Int) -> Int {
    let phi = (1 + sqrt(5)) / 2
    return Int(round(pow(phi, Double(n)) / sqrt(5)))
}

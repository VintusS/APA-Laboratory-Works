//
//  timeCalculator.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 25.02.2024.
//

import Foundation

// Function to measure time spent on sorting
func measureTime<T>(_ closure: () -> T) -> (result: T, time: Double) {
    let startTime = DispatchTime.now()
    let result = closure()
    let endTime = DispatchTime.now()
    let elapsedTime = Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / 1_000_000_000
    return (result, elapsedTime)
}

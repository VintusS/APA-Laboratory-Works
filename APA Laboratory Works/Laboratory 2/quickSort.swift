//
//  quickSort.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 25.02.2024.
//

import Foundation

func quickSort<T: Comparable>(_ array: inout [T], low: Int, high: Int) {
    if low < high {
        let pivotIndex = partition(&array, low: low, high: high)
        quickSort(&array, low: low, high: pivotIndex - 1)
        quickSort(&array, low: pivotIndex + 1, high: high)
    }
}

func partition<T: Comparable>(_ array: inout [T], low: Int, high: Int) -> Int {
    let pivot = array[high]
    var i = low - 1

    for j in low..<high {
        if array[j] <= pivot {
            i += 1
            array.swapAt(i, j)
        }
    }

    array.swapAt(i + 1, high)
    return i + 1
}

// Function to measure time spent on sorting
func measureTime<T>(_ closure: () -> T) -> (result: T, time: Double) {
    let startTime = DispatchTime.now()
    let result = closure()
    let endTime = DispatchTime.now()
    let elapsedTime = Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / 1_000_000_000
    return (result, elapsedTime)
}

// Arrays to be sorted
var arraysToSort: [[Int]] = [
    arrayType1,
    arrayType2,
    arrayType3,
    arrayType4,
    arrayType5,
]


func quickSortOutput() {
    var timeResults: [[Double]] = []
    
    for (_, array) in arraysToSort.enumerated() {
        var timings: [Double] = []
        for _ in 1...3 {
            var arrayCopy = array
            let (_, time) = measureTime { quickSort(&arrayCopy, low: 0, high: arrayCopy.count - 1) }
            timings.append(time)
        }
        timeResults.append(timings)
    }

    print("Array\t\tFirst try\t\tSecond Try\t\tThird Try")
    for (index, timings) in timeResults.enumerated() {
        print("Type \(index + 1)\t\t\(timings.map { String(format: "%.6f", $0) }.joined(separator: "\t\t"))")
    }
}

//
//  insertionMethod.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 25.02.2024.
//

import Foundation

func insertionSort<T: Comparable>(_ arr: inout [T]) {
    for i in 1..<arr.count {
        let key = arr[i]
        var j = i - 1

        while j >= 0 && arr[j] > key {
            arr[j + 1] = arr[j]
            j -= 1
        }

        arr[j + 1] = key
    }
}

func insertionMethodApplied() {
    // Arrays to be sorted
    let arraysToSort: [[Int]] = [
        arrayType1,
        arrayType2,
        arrayType3,
        arrayType4,
        arrayType5,
    ]
    
    var timeResults: [[Double]] = []
    
    for (_, array) in arraysToSort.enumerated() {
        var timings: [Double] = []
        for _ in 1...3 {
            var arrayCopy = array
            let (_, time) = measureTime { insertionSort(&arrayCopy) }
            timings.append(time)
        }
        timeResults.append(timings)
    }

    print("Array\t\tFirst try\t\tSecond Try\t\tThird Try")
    for (index, timings) in timeResults.enumerated() {
        print("Type \(index + 1)\t\t\(timings.map { String(format: "%.6f", $0) }.joined(separator: "\t\t"))")
    }
}

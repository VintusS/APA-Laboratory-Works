//
//  mergeSort.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 25.02.2024.
//

import Foundation

func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else { return array }

    let middleIndex = array.count / 2
    let leftArray = Array(array[..<middleIndex])
    let rightArray = Array(array[middleIndex...])

    return merge(mergeSort(leftArray), mergeSort(rightArray))
}

func merge<T: Comparable>(_ leftArray: [T], _ rightArray: [T]) -> [T] {
    var mergedArray: [T] = []
    var leftIndex = 0
    var rightIndex = 0

    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        if leftArray[leftIndex] < rightArray[rightIndex] {
            mergedArray.append(leftArray[leftIndex])
            leftIndex += 1
        } else {
            mergedArray.append(rightArray[rightIndex])
            rightIndex += 1
        }
    }

    mergedArray += Array(leftArray[leftIndex...])
    mergedArray += Array(rightArray[rightIndex...])

    return mergedArray
}

func mergeSortApplied() {
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
            let arrayCopy = array
            let (_, time) = measureTime { mergeSort(arrayCopy) }
            timings.append(time)
        }
        timeResults.append(timings)
    }

    print("Array\t\tFirst try\t\tSecond Try\t\tThird Try")
    for (index, timings) in timeResults.enumerated() {
        print("Type \(index + 1)\t\t\(timings.map { String(format: "%.6f", $0) }.joined(separator: "\t\t"))")
    }
}

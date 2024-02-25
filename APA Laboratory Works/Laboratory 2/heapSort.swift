//
// Sort.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 25.02.2024.
//

import Foundation

func heapSort<T: Comparable>(_ arr: inout [T]) {
    buildMaxHeap(&arr)

    for i in (1..<arr.count).reversed() {
        arr.swapAt(0, i)
        heapify(&arr, 0, i)
    }
}

func buildMaxHeap<T: Comparable>(_ arr: inout [T]) {
    let n = arr.count

    for i in stride(from: n/2 - 1, through: 0, by: -1) {
        heapify(&arr, i, n)
    }
}

func heapify<T: Comparable>(_ arr: inout [T], _ index: Int, _ size: Int) {
    var largest = index
    let left = 2 * index + 1
    let right = 2 * index + 2

    if left < size && arr[left] > arr[largest] {
        largest = left
    }

    if right < size && arr[right] > arr[largest] {
        largest = right
    }

    if largest != index {
        arr.swapAt(index, largest)
        heapify(&arr, largest, size)
    }
}

func heapSortApplied() {
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
            let (_, time) = measureTime { heapSort(&arrayCopy) }
            timings.append(time)
        }
        timeResults.append(timings)
    }

    print("Array\t\tFirst try\t\tSecond Try\t\tThird Try")
    for (index, timings) in timeResults.enumerated() {
        print("Type \(index + 1)\t\t\(timings.map { String(format: "%.6f", $0) }.joined(separator: "\t\t"))")
    }
}

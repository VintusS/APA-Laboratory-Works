//
//  Floyd.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 22.04.2024.
//

import Foundation

func floydAlgorithm() {
    let graph = GraphFloyd(vertices: 4)
    graph.addEdge(from: 0, to: 1, weight: 3)
    graph.addEdge(from: 0, to: 2, weight: 6)
    graph.addEdge(from: 1, to: 0, weight: 3)
    graph.addEdge(from: 1, to: 2, weight: 1)
    graph.addEdge(from: 2, to: 3, weight: 1)
    graph.addEdge(from: 3, to: 1, weight: 1)
    
    graph.floydWarshall()
    
    for i in 0..<graph.vertices {
        for j in 0..<graph.vertices {
            let path = graph.reconstructPath(from: i, to: j)
            if !path.isEmpty {
                let pathStr = path.map { "\($0)" }.joined(separator: " -> ")
                let cost = graph.adjMatrix[i][j]
                print("Shortest path from \(i) to \(j) is: \(pathStr) with total cost: \(cost)")
            } else {
                print("No path from \(i) to \(j)")
            }
        }
    }
}

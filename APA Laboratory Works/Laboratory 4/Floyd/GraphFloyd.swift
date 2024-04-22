//
//  GraphFloyd.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 22.04.2024.
//

import Foundation

class GraphFloyd {
    var vertices: Int
    var adjMatrix: [[Int]]
    var next: [[Int?]]
    
    init(vertices: Int) {
        self.vertices = vertices
        let inf = Int.max / 2  // Use a large number to represent infinity (avoid overflow)
        self.adjMatrix = Array(repeating: Array(repeating: inf, count: vertices), count: vertices)
        self.next = Array(repeating: Array(repeating: nil, count: vertices), count: vertices)
        
        for v in 0..<vertices {
            adjMatrix[v][v] = 0  // Distance to itself is always zero
        }
    }
    
    func addEdge(from: Int, to: Int, weight: Int) {
        adjMatrix[from][to] = weight
        next[from][to] = to
    }
    
    func floydWarshall() {
        for k in 0..<vertices {
            for i in 0..<vertices {
                for j in 0..<vertices {
                    if adjMatrix[i][k] < Int.max / 2 && adjMatrix[k][j] < Int.max / 2 {
                        if adjMatrix[i][j] > adjMatrix[i][k] + adjMatrix[k][j] {
                            adjMatrix[i][j] = adjMatrix[i][k] + adjMatrix[k][j]
                            next[i][j] = next[i][k]
                        }
                    }
                }
            }
        }
    }
    
    func reconstructPath(from src: Int, to dst: Int) -> [Int] {
        var path: [Int] = []
        if next[src][dst] == nil {
            return path  // No path
        }
        
        var at = src
        while at != dst {
            path.append(at)
            guard let nextStep = next[at][dst] else { break }
            at = nextStep
        }
        path.append(dst)  // Add the destination
        return path
    }
}

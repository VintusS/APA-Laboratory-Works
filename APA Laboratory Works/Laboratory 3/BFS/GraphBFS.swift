//
//  GraphBFS.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 22.04.2024.
//

import Foundation

class GraphBFS {
    private var vertices: Int
    private var adjList: [[Int]]

    init(vertices: Int) {
        self.vertices = vertices
        self.adjList = Array(repeating: [], count: vertices)
    }

    func addEdge(_ v: Int, _ w: Int) {
        adjList[v].append(w)  // Add w to v’s list.
    }

    func BFS(start: Int) {
        var visited = Array(repeating: false, count: vertices)
        var queue: [Int] = []

        // Start by visiting the root node
        visited[start] = true
        queue.append(start)

        while !queue.isEmpty {
            let node = queue.removeFirst()
            print(node, terminator: " ")

            // Get all adjacent vertices of the dequeued vertex node
            // If an adjacent has not been visited, then mark it visited and enqueue it
            for adj in adjList[node] {
                if !visited[adj] {
                    visited[adj] = true
                    queue.append(adj)
                }
            }
        }
    }
}

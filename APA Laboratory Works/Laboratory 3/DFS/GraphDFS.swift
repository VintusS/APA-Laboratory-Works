//
//  GraphDFS.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 22.04.2024.
//

import Foundation

class GraphDFS {
    private var vertices: Int
    private var adjList: [[Int]]

    init(vertices: Int) {
        self.vertices = vertices
        self.adjList = Array(repeating: [], count: vertices)
    }

    func addEdge(_ v: Int, _ w: Int) {
        adjList[v].append(w)  // Add w to v’s list.
    }

    private func dfsUtil(_ v: Int, _ visited: inout [Bool]) {
        visited[v] = true
        print(v, terminator: " ")
        for i in adjList[v] {
            if !visited[i] {
                dfsUtil(i, &visited)
            }
        }
    }

    func DFS(start: Int) {
        var visited = Array(repeating: false, count: vertices)
        dfsUtil(start, &visited)
    }
}

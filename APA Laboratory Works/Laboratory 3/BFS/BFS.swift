//
//  BFS.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 22.04.2024.
//

import Foundation

func bfs() {
    let graph = GraphBFS(vertices: 4)
    graph.addEdge(0, 1)
    graph.addEdge(0, 2)
    graph.addEdge(1, 2)
    graph.addEdge(2, 0)
    graph.addEdge(2, 3)
    graph.addEdge(3, 3)
    
    print("BFS starting from vertex 2:")
    graph.BFS(start: 2)
}

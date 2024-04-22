//
//  DFS.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 22.04.2024.
//

import Foundation

func dfs() {
    let graph = GraphDFS(vertices: 4)
    graph.addEdge(0, 1)
    graph.addEdge(0, 2)
    graph.addEdge(1, 2)
    graph.addEdge(2, 0)
    graph.addEdge(2, 3)
    graph.addEdge(3, 3)
    
    print("DFS starting from vertex 3:")
    graph.DFS(start: 2)
}

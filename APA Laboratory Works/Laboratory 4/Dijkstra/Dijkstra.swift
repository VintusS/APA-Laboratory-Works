//
//  Dijkstra.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 22.04.2024.
//

import Foundation

func dijkstraAlgorithm() {
    let graph = GraphDijkstra(vertices: 5)
    graph.addEdge(from: 0, to: 1, weight: 10)
    graph.addEdge(from: 0, to: 3, weight: 5)
    graph.addEdge(from: 1, to: 2, weight: 1)
    graph.addEdge(from: 1, to: 3, weight: 2)
    graph.addEdge(from: 2, to: 4, weight: 4)
    graph.addEdge(from: 3, to: 1, weight: 3)
    graph.addEdge(from: 3, to: 2, weight: 9)
    graph.addEdge(from: 3, to: 4, weight: 2)
    graph.addEdge(from: 4, to: 0, weight: 7)
    graph.addEdge(from: 4, to: 2, weight: 6)

    let (distances, paths) = graph.dijkstra(from: 0)
    for (index, distance) in distances.enumerated() {
        let path = paths[index].map { String($0) }.joined(separator: " -> ")
        print("Shortest path to vertex \(index) is [\(path)] with distance \(distance)")
    }
}

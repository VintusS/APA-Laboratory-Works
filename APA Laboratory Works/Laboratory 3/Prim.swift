//
//  Prim.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 22.04.2024.
//

import Foundation

func primAlgorithm() {
    let graph = GraphPrim(vertices: 5)
    graph.addEdge(from: 0, to: 1, weight: 2)
    graph.addEdge(from: 1, to: 2, weight: 3)
    graph.addEdge(from: 0, to: 3, weight: 6)
    graph.addEdge(from: 1, to: 3, weight: 8)
    graph.addEdge(from: 1, to: 4, weight: 5)
    graph.addEdge(from: 2, to: 4, weight: 7)
    
    let mst = graph.primMST()
    for edge in mst {
        print("Edge from \(edge.from) to \(edge.to) with weight \(edge.weight)")
    }
}

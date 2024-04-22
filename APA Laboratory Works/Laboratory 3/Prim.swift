//
//  Prim.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 22.04.2024.
//

import Foundation

class Edge {
    var from: Int
    var to: Int
    var weight: Int
    
    init(from: Int, to: Int, weight: Int) {
        self.from = from
        self.to = to
        self.weight = weight
    }
}

class Graph {
    var vertices: Int
    var adjList: [[Edge]]

    init(vertices: Int) {
        self.vertices = vertices
        self.adjList = Array(repeating: [], count: vertices)
    }

    func addEdge(from: Int, to: Int, weight: Int) {
        adjList[from].append(Edge(from: from, to: to, weight: weight))
        adjList[to].append(Edge(from: to, to: from, weight: weight)) // Since the graph is undirected
    }

    func primMST() -> [Edge] {
        var mst: [Edge] = []
        var edgePriorityQueue: [Edge] = []
        var inMST = Array(repeating: false, count: vertices)
        
        // Arbitrary starting point
        inMST[0] = true
        func addToQueue(from vertex: Int) {
            for edge in adjList[vertex] {
                if !inMST[edge.to] {
                    edgePriorityQueue.append(edge)
                }
            }
            edgePriorityQueue.sort { $0.weight < $1.weight }
        }

        addToQueue(from: 0)

        while !edgePriorityQueue.isEmpty {
            let edge = edgePriorityQueue.removeFirst()
            if !inMST[edge.to] {
                mst.append(edge)
                inMST[edge.to] = true
                addToQueue(from: edge.to)
            }
        }

        return mst
    }
}

func primAlgorithm() {
    let graph = Graph(vertices: 5)
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

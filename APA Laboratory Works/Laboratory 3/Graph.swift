//
//  Grpah.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 22.04.2024.
//

import Foundation

class GraphPrim {
    var vertices: Int
    var adjList: [[Edge]]

    init(vertices: Int) {
        self.vertices = vertices
        self.adjList = Array(repeating: [], count: vertices)
    }

    func addEdge(from: Int, to: Int, weight: Int) {
        adjList[from].append(Edge(from: from, to: to, weight: weight))
        adjList[to].append(Edge(from: to, to: from, weight: weight))
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

class GraphKruskal {
    private var edges: [Edge]
    private var vertices: Int
    
    init(vertices: Int) {
        self.vertices = vertices
        self.edges = []
    }
    
    func addEdge(from: Int, to: Int, weight: Int) {
        edges.append(Edge(from: from, to: to, weight: weight))
    }
    
    func kruskalMST() -> [Edge] {
        var mst: [Edge] = []
        let uf = UnionFind(count: vertices)
        
        // 1. Sort all the edges in non-decreasing order of their weight
        edges.sort()
        
        // 2. Pick the smallest edge and check if it forms a cycle with the spanning tree formed so far
        for edge in edges {
            if uf.find(edge.from) != uf.find(edge.to) {
                mst.append(edge)
                uf.union(edge.from, edge.to)
            }
        }
        
        return mst
    }
}

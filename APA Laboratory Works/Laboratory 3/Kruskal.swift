//
//  Kruskal.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 22.04.2024.
//

import Foundation

class UnionFind {
    private var parent: [Int]
    private var rank: [Int]
    
    init(count: Int) {
        parent = Array(0..<count)
        rank = Array(repeating: 0, count: count)
    }
    
    func find(_ p: Int) -> Int {
        if parent[p] != p {
            parent[p] = find(parent[p]) // Path compression
        }
        return parent[p]
    }
    
    func union(_ p: Int, _ q: Int) {
        let rootP = find(p)
        let rootQ = find(q)
        
        if rootP != rootQ {
            // Union by rank
            if rank[rootP] > rank[rootQ] {
                parent[rootQ] = rootP
            } else if rank[rootP] < rank[rootQ] {
                parent[rootP] = rootQ
            } else {
                parent[rootQ] = rootP
                rank[rootP] += 1
            }
        }
    }
}

func kruskalAlgorithm() {
    let graph = GraphKruskal(vertices: 5)
    graph.addEdge(from: 0, to: 1, weight: 2)
    graph.addEdge(from: 0, to: 3, weight: 6)
    graph.addEdge(from: 1, to: 2, weight: 3)
    graph.addEdge(from: 1, to: 3, weight: 8)
    graph.addEdge(from: 1, to: 4, weight: 5)
    graph.addEdge(from: 2, to: 4, weight: 7)
    graph.addEdge(from: 3, to: 4, weight: 8)
    
    let mst = graph.kruskalMST()
    for edge in mst {
        print("Edge from \(edge.from) to \(edge.to) with weight \(edge.weight)")
    }
    
}

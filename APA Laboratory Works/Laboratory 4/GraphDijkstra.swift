//
//  Graph.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 22.04.2024.
//

import Foundation

class GraphDijkstra {
    var vertices: Int
        var adjList: [[Edge]]
        
        init(vertices: Int) {
            self.vertices = vertices
            self.adjList = Array(repeating: [], count: vertices)
        }
        
        func addEdge(from: Int, to: Int, weight: Int) {
            adjList[from].append(Edge(from: from, to: to, weight: weight))
        }
        
        func dijkstra(from src: Int) -> ([Int], [[Int]]) {
            var distances = Array(repeating: Int.max, count: vertices)
            var priorityQueue: [(vertex: Int, dist: Int)] = []
            var visited = Array(repeating: false, count: vertices)
            var paths = Array(repeating: [Int](), count: vertices)
            
            // Start with the source vertex
            distances[src] = 0
            paths[src].append(src)
            priorityQueue.append((vertex: src, dist: 0))
            
            while !priorityQueue.isEmpty {
                // Extract the vertex with the minimum distance
                let current = priorityQueue.min(by: { $0.dist < $1.dist })!
                priorityQueue.removeAll(where: { $0.vertex == current.vertex })
                let u = current.vertex
                
                if visited[u] {
                    continue
                }
                visited[u] = true
                
                // Update distances and paths for adjacent vertices
                for edge in adjList[u] {
                    if !visited[edge.to] && distances[u] != Int.max {
                        let newDist = distances[u] + edge.weight
                        if newDist < distances[edge.to] {
                            distances[edge.to] = newDist
                            paths[edge.to] = paths[u] + [edge.to]  // Update the path
                            priorityQueue.append((vertex: edge.to, dist: newDist))
                        }
                    }
                }
            }
            
            return (distances, paths)
        }
}

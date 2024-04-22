//
//  Edge.swift
//  APA Laboratory Works
//
//  Created by Dragomir Mindrescu on 22.04.2024.
//

import Foundation

class Edge: Comparable {
    var from: Int
    var to: Int
    var weight: Int
    
    init(from: Int, to: Int, weight: Int) {
        self.from = from
        self.to = to
        self.weight = weight
    }
    
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.weight < rhs.weight
    }
    
    static func == (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.weight == rhs.weight
    }
}

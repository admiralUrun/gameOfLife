//
//  GameOfLife.swift
//  gameOfLife
//
//  Created by Andrew Yakovenko on 11/4/18.
//  Copyright © 2018 Andrew Yakovenko. All rights reserved.
//

import Foundation

enum Cell {
    case Empty, Alive, Newborn, Dying
}

let size = 10

class Life: NSObject {
    
    private var lifeCells: [[Cell]] = Array(repeating: Array(repeating: .Empty, count: size), count: size)
    
    func cellAt(x:Int,y:Int) -> Cell {
        return lifeCells[x][y]
    }
    
    func createNewLifeAt(x:Int,y:Int) {
        lifeCells[x][y] = .Alive
    }
    
    func cycle() {
        for x in 0 ..< size {
            for y in 0 ..< size {
                if lifeCells[x][y] == .Empty {
                    if countLiveNeighbors(x: x, y: y) == 3 {
                        
                        lifeCells[x][y] = .Newborn
                        
                    }
                } else if lifeCells[x][y] == .Alive {
                    if countLiveNeighbors(x: x, y: y) < 2 || countLiveNeighbors(x: x, y: y) > 3 {
                        
                        lifeCells[x][y] = .Dying
                    
                    }
                }
            }
        }
        
        for x in 0 ..< size {
            for y in 0 ..< size {
                if lifeCells[x][y] == .Dying {
                    lifeCells[x][y] = .Empty
                } else if lifeCells[x][y] == .Newborn {
                    lifeCells[x][y] = .Alive
                }
            }
        }
    }
    
    private func countLiveNeighbors(x:Int, y:Int) -> Int {
        var neighborCount = 0
        let neighbors = [(-1, 0), (1, 0), (0, -1), (0, 1), (-1, -1),(1, -1), (1, 1), (-1, 1)]
        
        for neighbor in neighbors {
            let xN = x + neighbor.0
            let yN = y + neighbor.1
            
            if (xN < 0 || xN == size || yN < 0 || yN == size) {
                continue
            }
            
            if lifeCells[xN][yN] == .Alive || lifeCells[xN][yN] == .Dying {
                neighborCount += 1
            }
        }
        
        return neighborCount
    }
    
}

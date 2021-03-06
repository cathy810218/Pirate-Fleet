//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
    let isWooden: Bool
    

    var cells: [GridLocation] {
        get {
            let start = self.location
            let end: GridLocation = ShipEndLocation(self)
            var occupiedCells = [GridLocation]()
            
            if start.x == end.x {
                for i in start.y...end.y {
                    let body = GridLocation(x: start.x, y: i)
                    occupiedCells.append(body)
                }
            } else if start.y == end.y {
                for i in start.x...end.x {
                    let body = GridLocation(x: i, y: start.y)
                    occupiedCells.append(body)
                }
            }
            return occupiedCells
        }
    }
    
    var hitTracker: HitTracker
    var sunk: Bool {
        get {
            let dict = hitTracker.cellsHit
            for eachCell in dict {
                if eachCell.1 == false {
                    return false
                }
            }
            return true
        }
    }
    
    init(length: Int, location: GridLocation, isVertical: Bool) {
        self.length = length
        self.location = location
        self.isVertical = isVertical
        self.isWooden = false
        self.hitTracker = HitTracker()
    }
    init(length: Int, location: GridLocation, isVertical: Bool, isWooden: Bool) {
        self.length = length
        self.location = location
        self.isVertical = isVertical
        self.isWooden = isWooden
        self.hitTracker = HitTracker()
    }
}

protocol PenaltyCell {
    var location: GridLocation {get}
    var penaltyText: String{get}
    var guaranteesHit: Bool{get}
}

struct Mine: PenaltyCell {
    let location: GridLocation
    var penaltyText: String
    let guaranteesHit: Bool
    
    init(location: GridLocation, penaltyText: String) {
        self.location = location
        self.penaltyText = penaltyText
        self.guaranteesHit = false
    }
    
    init(location: GridLocation, penaltyText: String, guaranteesHit: Bool) {
        self.location = location
        self.penaltyText = penaltyText
        self.guaranteesHit = guaranteesHit
    }
    
}

struct SeaMonster: PenaltyCell {
    let location: GridLocation
    var penaltyText: String
    let guaranteesHit: Bool
}

class ControlCenter {
    
    func placeItemsOnGrid(human: Human) {
        
        // SHIP
        // first initializer
        let smallShip = Ship(length: 2, location: GridLocation(x: 3, y: 4), isVertical: true, isWooden: true)
        human.addShipToGrid(smallShip)
        
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: false, isWooden: true)
        human.addShipToGrid(mediumShip1)
        
        // second initializer
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 3, y: 1), isVertical: false)
        human.addShipToGrid(mediumShip2)
        
        let largeShip = Ship(length: 4, location: GridLocation(x: 6, y: 3), isVertical: true)
        human.addShipToGrid(largeShip)
        
        let xLargeShip = Ship(length: 5, location: GridLocation(x: 7, y: 2), isVertical: true)
        human.addShipToGrid(xLargeShip)
        
        
        // MINE
        // first initializer
        let mine1 = Mine(location: GridLocation(x: 6, y: 0), penaltyText: "WHAT")
        human.addMineToGrid(mine1)
        
        // second initializer
        let mine2 = Mine(location: GridLocation(x: 3, y: 3), penaltyText: "WHAT", guaranteesHit: true)
        human.addMineToGrid(mine2)
        
        
        // SEAMONSTER
        let seamonster1 = SeaMonster(location: GridLocation(x: 5, y: 6), penaltyText: "HIT YA", guaranteesHit: true)
        human.addSeamonsterToGrid(seamonster1)
        
        let seamonster2 = SeaMonster(location: GridLocation(x: 2, y: 2), penaltyText: "HIT YA", guaranteesHit: true)
        human.addSeamonsterToGrid(seamonster2)
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        let sinkBonus = (5 - gameStats.enemyShipsRemaining) * gameStats.sinkBonus
        let shipBonus = (5 - gameStats.humanShipsSunk) * gameStats.shipBonus
        let guessPenalty = (gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman) * gameStats.guessPenalty
        
        finalScore = sinkBonus + shipBonus - guessPenalty
        
        return finalScore
    }
}
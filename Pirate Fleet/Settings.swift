//
//  Settings.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 8/25/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//

// MARK: - ReadyState: String

enum ReadyState: String {
    case ShipsNotReady = "You do not have the correct amount of ships. Check the Debug Area for more specific details."
    case ShipsMinesNotReady = "You do not have the correct amount of ships/mines. Check the Debug Area for more specific details."
    case ShipsMonstersNotReady = "You do not have the correct amount of ships/monsters. Check the Debug Area for more specific details."
    case ShipsMinesMonstersNotReady = "You do not have the correct amount of ships/mines/monsters. Check the Debug Area for more specific details."
    case ReadyToPlay = "All Ready!"
    case Invalid = "Invalid Ready State!"
}

// MARK: - Settings

struct Settings {
    
    static let DefaultGridSize = GridSize(width: 8, height: 8)
    static let ComputerDifficulty = Difficulty.Advanced
    static let RequiredShips: [ShipSize:Int] = [
        .Small: 1,
        .Medium: 2,
        .Large: 1,
        .XLarge: 1
    ]
    static let RequiredMines = 2
    static let RequiredSeamonsters = 2
    
    static let DefaultMineText = "Boom!"
    static let DefaultMonsterText = "Yikes!"
    
    struct Messages {
        static let GameOverTitle = "Game Over"
        static let GameOverWin = "You won! Congrats!"
        static let GameOverLose = "You've been defeated by the computer."
        static let UnableToStartTitle = "Cannot Start Game"
        static let ShipsNotReady = "NOTE: You need one small ship (size 2), two medium ships (size 3), one large ship (size 4), one x-large ship (size 5)."
        static let ShipsMinesNotReady = "NOTE: You need one small ship (size 2), two medium ships (size 3), one large ship (size 4), one x-large ship (size 5), and two mines."
        static let ShipsMonstersNotReady = "NOTE: You need one small ship (size of 2), two medium ships (size of 3), one large ship (size of 4), one x-large ship (size of 5), and two sea monsters."
        static let ShipsMinesMonstersNotReady = "NOTE: You need one small ship (size of 2), two medium ships (size of 3), one large ship (size of 4), one x-large ship (size of 5), two mines, and two sea monsters."
        static let HumanHitMine = "You've hit a mine! The computer has been rewarded an extra move on their next turn."
        static let ComputerHitMine = "The computer has hit a mine! You've been awarded an extra move on your next turn."
        static let HumanHitMonster = "You've hit a sea monster! The computer will be awarded a free hit on your ship"
        static let ComputerHitMonster = "The computer has hit a sea monster! You will be awarded a free hit on their ship"
        static let ResetAction = "Reset Game"
        static let DismissAction = "Continue"
    }
    
    struct Images {
        static let Water = "Water"
        static let Hit = "Hit"
        static let Miss = "Miss"

        static let ShipEndRight = "ShipEndRight"
        static let ShipEndLeft = "ShipEndLeft"
        static let ShipEndDown = "ShipEndDown"
        static let ShipEndUp = "ShipEndUp"
        static let ShipBodyHorz = "ShipBodyHorz"
        static let ShipBodyVert = "ShipBodyVert"

        static let WoodenShipHeadLeft = "WoodenShipHeadLeft"
        static let WoodenShipHeadRightWithFlag = "WoodenShipHeadRightWithFlag"
        static let WoodenShipHeadUpWithFlag = "WoodenShipHeadUpWithFlag"
        static let WoodenShipHeadDown = "WoodenShipHeadDown"
        static let WoodenShipBodyHorz = "WoodenShipBodyHorz"
        static let WoodenShipBodyVert = "WoodenShipBodyVert"
        
        static let Mine = "Mine"
        static let MineHit = "MineHit"
        
        static let SeaMonster = "SeaMonster"
        static let SeaMonsterHit = "SeaMonsterHit"
    }
}
//
//  Sign.swift
//  RPS
//
//  Created by Daria on 05/08/2019.
//  Copyright © 2019 D.Misch. All rights reserved.
//
import GameplayKit
import Foundation

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1{
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return  "✋"
        case .scissors:
            return  "✌️"
        }
    }
    func result(_ oposite: Sign) -> GameState {
        switch (self, oposite) {
        case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
            return .draw
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            return .win
        case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
            return .lose
        }
    }
}

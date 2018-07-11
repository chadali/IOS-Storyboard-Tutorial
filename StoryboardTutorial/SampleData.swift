//
//  SampleData.swift
//  StoryboardTutorial
//
//  Created by ali chaudhry on 7/6/18.
//  Copyright © 2018 ali chaudhry. All rights reserved.
//

import Foundation

final class SampleData {
    static func genereatePlayerData() -> [Player] {
        return [
            Player(name: "Bill Evans", game: "Tic-Tac-Toe", rating: 4),
            Player(name: "Oscar Peterson", game: "Spin the Bottle", rating: 5),
            Player(name: "Dave Brubeck", game: "Texas Hold 'em Poker", rating: 2)
        ]
    }
}

//
//  Diceware.swift
//  EasyDiceware
//
//  Created by Colin Drake on 5/28/17.
//  Copyright © 2017 Colin Drake. All rights reserved.
//

import Foundation

func throwDie() -> Int {
    return Int(arc4random() % 6) + 1
}

func throwNDice(n: Int) -> [Int] {
    return (0..<n).map { _ in return throwDie() }
}

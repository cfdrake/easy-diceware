//
//  Diceware.swift
//  EasyDiceware
//
//  Created by Colin Drake on 5/28/17.
//  Copyright © 2017 Colin Drake. All rights reserved.
//

import Foundation

/// Represents the whole diceware system.
final class Diceware {

    // MARK: Properties

    var dicewareEntries: [String: String] = [:]  // Hash table for quick searching.

    // MARK: Helpers

    func throwDie() -> Int {
        return Int(arc4random() % 6) + 1
    }

    func throwNDice(n: Int) -> [Int] {
        return (0..<n).map { _ in return throwDie() }
    }

    func buildDictionary() {
        let dicewarePath = Bundle.main.path(forResource: "diceware", ofType: "txt")!
        guard let dicewareLines = try? String(contentsOfFile: dicewarePath).components(separatedBy: "\n") else {
            fatalError("Could not load diceware entries")
        }

        dicewareLines.filter { $0.characters.count > 0 }.forEach { (line: String) in
            let components = line.components(separatedBy: "\t")
            self.dicewareEntries[components[0]] = components[1]
        }
    }

    // MARK: Public Interface

    func randomPassphraseOfLength(_ length: Int) -> String {
        if dicewareEntries.count == 0 {
            buildDictionary()
        }

        let numbers = (0..<length).map { _ in return throwNDice(n: 5).map({ String($0) }).joined() }
        return numbers.map({ num in dicewareEntries[num]! }).joined(separator: " ")
    }

}

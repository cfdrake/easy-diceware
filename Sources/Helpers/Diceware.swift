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

    lazy var dicewareEntries: [String: String] = {
        let dicewarePath = Bundle.main.path(forResource: "diceware", ofType: "txt")!
        guard let dicewareLines = try? String(contentsOfFile: dicewarePath).components(separatedBy: "\n") else {
            fatalError("Could not load diceware entries")
        }

        var dicewareEntries = [String: String]()
        dicewareLines.filter { $0.characters.count > 0 }.forEach { (line: String) in
            let components = line.components(separatedBy: "\t")
            dicewareEntries[components[0]] = components[1]
        }

        return dicewareEntries
    }()

    // MARK: Helpers

    func throwDie() -> Int {
        return Int(arc4random() % 6) + 1
    }

    func throwNDice(n: Int) -> [Int] {
        return (0..<n).map { _ in return throwDie() }
    }

    // MARK: Public Interface

    func randomPassphraseOfLength(_ length: Int) -> String {
        let numbers = (0..<length).map { _ in return throwNDice(n: 5).map({ String($0) }).joined() }
        return numbers.map({ num in dicewareEntries[num]! }).joined(separator: " ")
    }

}

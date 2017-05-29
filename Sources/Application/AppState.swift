//
//  AppState.swift
//  EasyDiceware
//
//  Created by Colin Drake on 5/28/17.
//  Copyright © 2017 Colin Drake. All rights reserved.
//

import Foundation

/// Global application state.
final class AppState {

    // MARK: Static Properties

    static let sharedState = AppState()

    // MARK: Properties

    let diceware = Diceware()

    var length: Int? {
        didSet {
            guard let length = length else { return }
            self.passphrase = diceware.randomPassphraseOfLength(length)
        }
    }

    var passphrase: String?

    // MARK: Public Interface

    func reset() {
        passphrase = ""
    }

}

//
//  GeneratePassphraseViewController.swift
//  EasyDiceware
//
//  Created by Colin Drake on 5/28/17.
//  Copyright © 2017 Colin Drake. All rights reserved.
//

import UIKit

/// Generates a new passphrase for the user.
/// In reality, everything is already done and this is merely a nice, quick animation.
final class GeneratePassphraseViewController: UIViewController {

    // MARK: Properties

    @IBOutlet var emojiLabel: UILabel?
    @IBOutlet var progressViewBackground: UIView?
    @IBOutlet var progressViewConstraint: NSLayoutConstraint?

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        // Animate randomized emojis.
        Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { _ in
            guard let emojiLabel = self.emojiLabel else { return }
            emojiLabel.text = self.randomEmoji() + self.randomEmoji() + "\n" + self.randomEmoji() + self.randomEmoji()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Animate progress bar ;)
        guard let progressViewBackground = progressViewBackground else { return }
        let animationTime = 2.0

        progressViewConstraint?.constant = progressViewBackground.frame.width

        UIView.animate(withDuration: animationTime) {
            self.view.layoutIfNeeded()
        }

        Timer.scheduledTimer(withTimeInterval: animationTime + 0.01, repeats: false) { _ in
            self.performSegue(withIdentifier: "ShowPassphraseViewController", sender: nil)
        }
    }

    // MARK: Helpers

    func randomEmoji() -> String {
        switch arc4random() % 5 {
        case 0: return "🤔"
        case 1: return "🤖"
        case 2: return "🔒"
        case 3: return "🎲"
        default: return "🔑"
        }
    }

}

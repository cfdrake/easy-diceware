//
//  PassphraseViewController.swift
//  EasyDiceware
//
//  Created by Colin Drake on 5/28/17.
//  Copyright © 2017 Colin Drake. All rights reserved.
//

import UIKit

/// Presents the generated passphrase to the user.
final class PassphraseViewController: UIViewController {

    // MARK: Properties

    @IBOutlet var passphraseLabel: UILabel?
    @IBOutlet var copyLabel: UILabel?

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        // Fill out passphrase.
        passphraseLabel?.text = AppState.sharedState.passphrase

        // Add gesture for tap-to-copy.
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        passphraseLabel?.addGestureRecognizer(tapRecognizer)
    }

    // MARK: Actions

    func tapped() {
        // Copy passphrase to system clipboard.
        guard let passphrase = AppState.sharedState.passphrase else { return }

        UIPasteboard.general.string = passphrase
        copyLabel?.text = "👍🏻 copied!"
    }

    @IBAction func tappedDone() {
        // Verify the user is alright with destroying this passphrase before continuing.
        let alert = UIAlertController(title: "Woah there!", message: "Leaving this screen will remove all traces of this passphrase, forever. Make sure you've copied it or have written it down! Do you still want to leave?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive) { _ in
            AppState.sharedState.reset()
            self.navigationController?.popToRootViewController(animated: true)
        })

        present(alert, animated: true, completion: nil)
    }

}

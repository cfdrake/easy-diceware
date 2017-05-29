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

    var passphrase: String? {
        didSet {
            guard isViewLoaded else { return }
            self.passphraseLabel?.text = passphrase
        }
    }

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add gesture for tap-to-copy.
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        passphraseLabel?.addGestureRecognizer(tapRecognizer)
    }

    // MARK: Actions

    func tapped() {
        // Copy passphrase to system clipboard.
        guard let passphrase = passphrase else { return }
        UIPasteboard.general.string = passphrase
    }

    @IBAction func tappedDone() {
        // Verify the user is alright with destroying this passphrase before continuing.
        let alert = UIAlertController(title: "Woah there!", message: "Leaving this screen will remove all traces of this passphrase, forever. Make sure you've copied it or have written it down! Do you still want to leave?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive) { _ in
            self.navigationController?.popToRootViewController(animated: true)
        })

        present(alert, animated: true, completion: nil)
    }

}

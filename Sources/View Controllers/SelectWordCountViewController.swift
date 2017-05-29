//
//  SelectWordCountViewController.swift
//  EasyDiceware
//
//  Created by Colin Drake on 5/28/17.
//  Copyright © 2017 Colin Drake. All rights reserved.
//

import UIKit

/// Allows the user to select how many words their passphrase will contain.
final class SelectWordCountViewController: UIViewController {

    // MARK: Properties

    @IBOutlet var wordsLabel: UILabel?

    var words = 5 {
        didSet {
            guard self.isViewLoaded else { return }
            wordsLabel?.text = String(describing: words)
        }
    }

    // MARK: UIViewController

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AppState.sharedState.length = words
    }

    // MARK: Actions

    @IBAction func sliderValueChanged(slider: UISlider) {
        words = Int(slider.value)
        AppState.sharedState.length = words
    }

}

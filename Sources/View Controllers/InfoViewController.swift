//
//  InfoViewController.swift
//  EasyDiceware
//
//  Created by Colin Drake on 6/20/17.
//  Copyright © 2017 Colin Drake. All rights reserved.
//

import UIKit

/// Information view controller.
final class InfoViewController: UIViewController {

    // MARK: Properties

    @IBOutlet var webView: UIWebView?

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        webView?.loadRequest(URLRequest(url: URL(string: "https://en.wikipedia.org/wiki/Diceware")!))
    }

    // MARK: Actions

    @IBAction func close(sender: UIBarButtonItem) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

}

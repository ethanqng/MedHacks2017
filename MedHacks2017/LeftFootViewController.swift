//
//  LeftFootViewController.swift
//  MedHacks2017
//
//  Created by Olivia Brown on 9/9/17.
//  Copyright © 2017 Olivia Brown. All rights reserved.
//

import UIKit

class LeftFootViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var leftFootImageView: UIImageView!
    @IBOutlet weak var leftFootLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        leftFootLabel.adjustsFontSizeToFitWidth = true
        startButton.layer.cornerRadius = 10

        
    }
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

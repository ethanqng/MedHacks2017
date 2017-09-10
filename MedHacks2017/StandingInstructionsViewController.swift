//
//  StandingInstructionsViewController.swift
//  MedHacks2017
//
//  Created by Olivia Brown on 9/9/17.
//  Copyright © 2017 Olivia Brown. All rights reserved.
//

import UIKit

class StandingInstructionsViewController: UIViewController {

    @IBOutlet weak var instructionsTitleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        instructionsTitleLabel.numberOfLines = 2
        instructionsTitleLabel.adjustsFontSizeToFitWidth = true

    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

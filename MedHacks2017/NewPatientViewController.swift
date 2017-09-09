//
//  NewPatientViewController.swift
//  MedHacks2017
//
//  Created by Olivia Brown on 9/9/17.
//  Copyright © 2017 Olivia Brown. All rights reserved.
//

import UIKit

class NewPatientViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var descriptionOneLabel: UILabel!
    @IBOutlet weak var descriptionTwoLabel: UILabel!
    @IBOutlet weak var getStartedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.adjustsFontSizeToFitWidth = true
        descriptionOneLabel.adjustsFontSizeToFitWidth = true
        descriptionTwoLabel.adjustsFontSizeToFitWidth = true
        getStartedButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
}

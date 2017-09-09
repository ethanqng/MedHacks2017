//
//  NewPatientViewController.swift
//  MedHacks2017
//
//  Created by Olivia Brown on 9/9/17.
//  Copyright © 2017 Olivia Brown. All rights reserved.
//

import Firebase
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

    @IBAction func registerNewUser(_ sender: AnyObject) {
        // Fetch information from form
        let username = usernameField.text
        let firstName = firstNameField.text
        let lastName = lastNameField.text
        let email = emailField.text
        let password = passwordField.text
        let doctorEmail = doctorEmailField.text

        // Validate information
        if username != "" && firstName != "" && lastName != "" && email != "" && password != "" && doctorEmail != "" {
            //Create user in firebase
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    self.showMessagePrompt("You are now registered!")
                } else {
                    self.showMessagePrompt(error.localizedDescription)
                    return
                }
            }
        } else {
            self.showMessagePrompt("Please fill out all fields.")
        }
    }
}

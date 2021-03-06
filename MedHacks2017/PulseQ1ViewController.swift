//
//  PulseQ1ViewController.swift
//  MedHacks2017
//
//  Created by Olivia Brown on 9/9/17.
//  Copyright © 2017 Olivia Brown. All rights reserved.
//

import UIKit

class PulseQ1ViewController: UIViewController {
    var felt: Bool = false
    var storage: StorageController?
    @IBOutlet weak var answerSwitch: UISwitch!
    @IBOutlet weak var answerDisplayLabel: UILabel!
    @IBAction func answerSwitchPressed(_ sender: Any) {
        if answerSwitch.isOn{
            answerDisplayLabel.text = "Yes"
            self.felt = true
        } else if !answerSwitch.isOn{
            answerDisplayLabel.text = "No"
            self.felt = false
        }
        
    }
    @IBAction func nextButtonPressed(_ sender: Any) {
        
        if felt {
            performSegue(withIdentifier: "beats", sender: self)
        }
        else{
            performSegue(withIdentifier: "images", sender: self)
        }
        
    }
    
    let onColor = UIColor(red: 236.0/255.0, green: 27.0/255.0, blue: 82.0/255.0, alpha: 1.0)
    let offColor = UIColor(red: 61.0/255.0, green:  62.0/255.0, blue: 61.0/255.0, alpha: 0.5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerSwitch.setOn(false, animated: true)
        answerSwitch.onTintColor = onColor
        answerSwitch.tintColor = offColor
        storage = self.navigationController as? StorageController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if !storage!.didCheckLeft{
            storage!.leftFelt = self.felt
        }
        else{
            storage!.rightFelt = self.felt
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

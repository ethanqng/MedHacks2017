//
//  PulseQ3ViewController.swift
//  MedHacks2017
//
//  Created by Olivia Brown on 9/9/17.
//  Copyright © 2017 Olivia Brown. All rights reserved.
//

import UIKit

class PulseQ3ViewController: UIViewController {

    var storage: StorageController?
    var sliderValue: Int = 0
    @IBOutlet weak var strengthDisplayLabel: UILabel!
    @IBOutlet weak var strengthSlider: UISlider!
    @IBAction func strengthSliderPressed(_ sender: UISlider) {
        sliderValue = Int(sender.value)
        strengthDisplayLabel.text = String(sliderValue)
    }
    @IBAction func nextButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "palm", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        strengthSlider.minimumValue = 1
        strengthSlider.maximumValue = 10
        storage = self.navigationController as? StorageController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if !storage!.didCheckLeft{
            storage!.leftStrength = Int(self.strengthSlider.value)
        }
        else{
            storage!.rightStrength = Int(self.strengthSlider.value)
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

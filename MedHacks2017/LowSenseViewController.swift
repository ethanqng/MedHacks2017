//
//  LowSenseViewController.swift
//  MedHacks2017
//
//  Created by Olivia Brown on 9/9/17.
//  Copyright © 2017 Olivia Brown. All rights reserved.
//

import Firebase
import UIKit
import RealmSwift



class LowSenseViewController: UIViewController, SmoothViewDelegate {
    
    var storage:StorageController?
    var savedData: Results<Patient>?
    
    @IBOutlet weak var overView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scribbleView: SmothView!
    
    @IBOutlet weak var lowSensitivityLabel: UILabel!
    @IBOutlet weak var completeRightButton: UIButton!
    
    
    @IBAction func eraseButton(_ sender: UIButton) {
        scribbleView.incrementalImage = UIImage()
        scribbleView.backgroundColor = UIColor.clear
        
        if !storage!.didCheckLeft{
            imageView.image = storage!.leftPalmImage.toPicture()!
        }
        else{
            imageView.image = storage!.rightPalmImage.toPicture()!
        }
        
        scribbleView.setNeedsDisplay()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var ref: DatabaseReference?
        self.storage = self.navigationController as? StorageController
        scribbleView.backgroundColor = .clear
        scribbleView.color = UIColor(colorLiteralRed: 61.0/255.0, green: 191.0/255.0, blue: 184.0/255.0, alpha: 1.0)
        scribbleView.setBrush(5.0, alpha: 0.8)
        scribbleView.delegate = self
        if !storage!.didCheckLeft{
            imageView.image = storage!.leftPalmImage.toPicture()!
            completeRightButton.setTitle("Next", for: .normal)
        }
        else{
            imageView.image = storage!.rightPalmImage.toPicture()!
            completeRightButton.setTitle("Complete", for: .normal)
        }
        
        
        scribbleView.alpha = 1.0
        lowSensitivityLabel.adjustsFontSizeToFitWidth = true

        
        // Do any additional setup after loading the view.
    }
    func buildLayer(){
        self.imageView.image = UIImage(view:self.overView)
    }
    
    @IBAction func completeRightButtonPressed(_ sender: UIButton) {
        nextButton()
    }

    func addToFirebase(checkup) {
        let user = Auth.auth().currentUser
        let uid = user!.uid
        let left = checkup.leftFoot
        let right = checkup.rightFoot

        let keyInCheckups = ref?.child("checkups").childByAutoId().key
        let keyInUsers = ref?.child("users").child(uid).childByAutoId().key

        let checkupEntry = [
            "user": uid,
            "date": checkup.date,
            "sent": checkup.sent,
            "left": [
                "pulse": [
                    "felt": left.pulse.felt,
                    "beats": left.pulse.beats,
                    "strength": left.pulse.strength
                ],
                "palm": left.palm
                "ankle": left.ankle,
                "standing": left.standing
                "highSense": left.highSense,
                "lowSense": left.lowSense
            ],
            "right": [
                "pulse": [
                    "felt": right.pulse.felt,
                    "beats": right.pulse.beats,
                    "strength": right.pulse.strength
                ],
                "palm": right.palm,
                "ankle": right.ankle,
                "standing": right.standing,
                "highSense": right.highSense,
                "lowSense": right.lowSense
            ]
        ]

        let childUpdates = [
            "/checkups/\(keyInCheckups)": checkupEntry,
            "/users/\(uid)/checkups/\(keyInUsers)": keyInCheckups
        ]
        ref?.updateChildValues(childUpdates)
    }

    func nextButton(){
        print("touching here")
        if !storage!.didCheckLeft {
            storage!.didCheckLeft = true
            storage!.leftLowSense = UIImage(view: self.overView).toData()!
            performSegue(withIdentifier: "right", sender: self)
        }
        else{
            print("checking others")
            storage!.rightLowSense = UIImage(view: self.overView).toData()!
            
            var realm = try! Realm()
            self.savedData = realm.objects(Patient)
            let thisPatient = savedData?[0]
            let newCheckup = storage!.buildCheckup()
            
            try! realm.write{
                thisPatient?.checkups.append(newCheckup)
            }
            
            addToFirebase(newCheckup)

            if thisPatient!.checkups.count == 1 {
                performSegue(withIdentifier: "mainWelcome", sender: self)
            }
            
            else{
                performSegue(withIdentifier: "unwind", sender: self)
            }
            
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainWelcome" || segue.identifier == "unwind"{
            if  let main = segue.destination as? ViewController{
                let realm = try! Realm()
                let memory = realm.objects(Patient.self)
                main.memory = memory
            }
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}


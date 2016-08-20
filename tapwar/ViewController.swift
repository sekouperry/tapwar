//
//  ViewController.swift
//  tapwar
//
//  Created by Sekou Perry on 8/19/16.
//  Copyright © 2016 Sekou Perry. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var TopBtn: UIButton!
    @IBOutlet weak var BtmBtn: UIButton!
    
    @IBOutlet weak var TopLbl: UILabel!
    @IBOutlet weak var BtmLbl: UILabel!
    
    @IBOutlet weak var endScene: UIButton!
    
    @IBOutlet weak var TopEndScene: UILabel!
    @IBOutlet weak var BtmEndScene: UILabel!
    
    var score = 0
    
    
    
    var TrumpButtonAudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Trump", ofType: "mp3")!)
    var ClintonButtonAudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Clinton", ofType: "mp3")!)
    var FailButtonAudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Fail", ofType: "mp3")!)

    
    var ClintonPlayAudio = AVAudioPlayer()
    var TrumpPlayAudio = AVAudioPlayer()
    var FailPlayAudio = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        score = 0
        TopLbl.text = "\(score)"
        BtmLbl.text = "\(score)"
        
        TopLbl.transform = CGAffineTransformMakeRotation(3.14)
        
        
        endScene.hidden = true
        TopEndScene.hidden = true
        BtmEndScene.hidden = true
        
        TopEndScene.transform = CGAffineTransformMakeRotation(3.14)
        
        ClintonPlayAudio = try!  AVAudioPlayer(contentsOfURL: ClintonButtonAudioURL, fileTypeHint: nil)
        TrumpPlayAudio  = try!  AVAudioPlayer(contentsOfURL: TrumpButtonAudioURL, fileTypeHint: nil)
        FailPlayAudio  = try!  AVAudioPlayer(contentsOfURL: FailButtonAudioURL, fileTypeHint: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func TopBtnAction(sender: AnyObject) {
        
        score += 1
        TopLbl.text = "\(score)"
        BtmLbl.text = "\(score)"
        
        testScore()
        
        TrumpPlayAudio.play()
        
    }
    
    @IBAction func BtmBtnAction(sender: AnyObject) {
        
        score -= 1
        TopLbl.text = "\(score)"
        BtmLbl.text = "\(score)"
        
        testScore()
        
        ClintonPlayAudio.play()
        
    }
    
    
    func testScore(){
        
        if score >= 10{
            
            endScene.hidden = false
            TopEndScene.hidden = false
            BtmEndScene.hidden = false
            
            TopEndScene.text = "Winner!"
            BtmEndScene.text = "Loser!"
            
            FailPlayAudio.play()
            
        }
        else if score <= -10{
            
            endScene.hidden = false
            TopEndScene.hidden = false
            BtmEndScene.hidden = false
            
            TopEndScene.text = "Loser!"
            BtmEndScene.text = "Winner!"
            
            FailPlayAudio.play()
            
        }
        
    }
    
    @IBAction func endSceneAction(sender: AnyObject) {
        
        endScene.hidden = true
        TopEndScene.hidden = true
        BtmEndScene.hidden = true
        
        score = 0
        TopLbl.text = "\(score)"
        BtmLbl.text = "\(score)"
        
    }
    
    
}


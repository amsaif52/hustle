//
//  ViewController.swift
//  Hustle
//
//  Created by Ali Asgar Merchant on 7/23/17.
//  Copyright © 2017 Ali Asgar Merchant. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var hustleLbl: UILabel!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var onLbl: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            
        } catch let error as NSError{
            print(error.description)
        }
        
    }
    
    @IBAction func powerBtnPressed(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 130, width: 375, height: 402)
        }) { (finished) in
            self.onLbl.isHidden = false
            self.hustleLbl.isHidden = false
        }
    }

}


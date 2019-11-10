//
//  ViewController.swift
//  Ear Training Game
//
//  Created by Niveditha Kani on 2019-11-09.
//  Copyright © 2019 Niveditha Kani. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var scoreCount = 0
    var player : AVPlayer?
    var currentInterval = ("Interval", "URL")
    var audiofiles: [String:String] = [
        "Perfect Unison" : "https://firebasestorage.googleapis.com/v0/b/intervals-e0f27.appspot.com/o/per1.mp3?alt=media&token=64bfc8ab-47cc-4e58-917d-165df171b031",
        "Major 2nd" :  "https://firebasestorage.googleapis.com/v0/b/intervals-e0f27.appspot.com/o/maj2.mp3?alt=media&token=8b9613fb-cd33-45fb-ba7c-995c9d4b034b",
        "Major 3rd" : "https://firebasestorage.googleapis.com/v0/b/intervals-e0f27.appspot.com/o/maj3.mp3?alt=media&token=8bad5e44-2e91-40e0-b82b-0e83c1a39bf3",
        "Perfect 4th" : "https://firebasestorage.googleapis.com/v0/b/intervals-e0f27.appspot.com/o/per4.mp3?alt=media&token=2b7ef31e-698b-47f0-bca2-a4e975c31dd9",
        "Perfect 5th" : "https://firebasestorage.googleapis.com/v0/b/intervals-e0f27.appspot.com/o/per5.mp3?alt=media&token=931cc5f3-680b-496e-9800-7b15cca7ca01",
        "Major 6th" : "https://firebasestorage.googleapis.com/v0/b/intervals-e0f27.appspot.com/o/maj6.mp3?alt=media&token=333f53d2-047d-4c85-a4f9-935523f587d1",
        "Major 7th" : "https://firebasestorage.googleapis.com/v0/b/intervals-e0f27.appspot.com/o/maj7.mp3?alt=media&token=bd0cab76-8e7f-4e8b-9853-50888ff70ffd",
        "Perfect Octave" : "https://firebasestorage.googleapis.com/v0/b/intervals-e0f27.appspot.com/o/per8.mp3?alt=media&token=6c342740-1c96-474e-b70a-fbcfbaff8236"
    ]
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var result: UILabel!
    
    @IBAction func playButtonPressed(_ sender: Any) {
        loadRadio(radioURL: currentInterval.1)
        result.text = " "
    }
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        if (sender as AnyObject).titleLabel!.text == currentInterval.0 {
        score.text = "Score: \(scoreCount + 1)"
            scoreCount += 1
            result.text = "Correct! That was a " + currentInterval.0
        }
        else {
            result.text = "Incorrect. That was a " + currentInterval.0
        }
        resetAudio()
        resetOptions()
    }
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    func resetAudio() {
        let temp = audiofiles.randomElement()
        currentInterval.0 = temp!.key
        currentInterval.1 = temp!.value
    }
    
    func resetOptions() {
        var allOptions = (Array(audiofiles.keys)).shuffled()
        if let index = allOptions.firstIndex(of: currentInterval.0) {
            allOptions.remove(at: index)
        }
        let fourOptions = ([currentInterval.0, allOptions[1], allOptions[2], allOptions[3]]).shuffled()
        button1.setTitle(fourOptions[0], for: .normal)
        button2.setTitle(fourOptions[1], for: .normal)
        button3.setTitle(fourOptions[2], for: .normal)
        button4.setTitle(fourOptions[3], for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetAudio()
        resetOptions()
        score.text = "Score: \(scoreCount)"
        result.text = " "
    }
    
    func loadRadio(radioURL: String) {
        guard let url = URL.init(string: radioURL) else { return }
        let playerItem = AVPlayerItem.init(url: url)
        player = AVPlayer.init(playerItem: playerItem)
        player?.play()
    }


}


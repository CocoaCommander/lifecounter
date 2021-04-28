//
//  ViewController.swift
//  lifecounter
//
//  Created by Ryan Lee on 4/21/21.
//

class PlayerModel {
    
    var allPlayers: [String: Int]
    var action: String = ""
    
    init() {
        self.allPlayers = [:]
        for i: Int in 0...3 {
            self.allPlayers["Player \(i + 1)"] = 20
        }
    }
    
    func addHP(_ playerName: String, _ hp: Int) {
        self.allPlayers[playerName]! += hp
        self.action = "\(playerName) has gained \(hp) HP."
    }
    
    func minusHP(_ playerName: String, _ hp: Int) {
        self.allPlayers[playerName]! -= hp
        self.action = "\(playerName) has lost \(hp) HP."
        if (self.checkLoss(playerName)) {
            self.action = "\(playerName) has lost \(hp) HP and has lost the game."
            self.allPlayers.removeValue(forKey: playerName)
        }
        if checkFinish() {
            // guaranteed only one key
            for winner in self.allPlayers.keys {
                self.action = "\(playerName) has lost \(hp) HP and has lost the game. \(winner) has won the game!"
            }
        }
    }
    
    func checkLoss(_ playerName: String) -> Bool {
        return self.allPlayers[playerName] != nil && self.allPlayers[playerName]! <= 0
    }
    
    func checkFinish() -> Bool {
        return self.count() == 1
    }
    
    func plusOne(_ playerName: String) {
        addHP(playerName, 1)
    }
    
    func minusOne(_ playerName: String) {
        minusHP(playerName, 1)
    }
    
    func count() -> Int {
        return self.allPlayers.count
    }
    
    func maxSizeReached() -> Bool {
        return self.count() == 8
    }
    
    func reportHist() -> String {
        return self.action
    }
}

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Players: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //var playerModel = PlayerModel()
        
        if let nib = Bundle.main.loadNibNamed("PlayerControls", owner: self),
        let nibView = nib.first as? UIView {
            nibView.frame = Players.bounds
            nibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            Players.addSubview(nibView)
            Players.addSubview(nibView)
            Players.addSubview(nibView)
            Players.addSubview(nibView)
        }
    }
    
}


//
//  ViewController.swift
//  lifecounter
//
//  Created by Ryan Lee on 4/21/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    var playerOneLife: Int = 20
    var playerTwoLife: Int = 20
    var playerThreeLife: Int = 20
    var playerFourLife: Int = 20
    
    func calcHP(_ hp: Int, _ player: Int) {
        switch player {
        case 1:
            playerOneLife += hp
            editHPLabel(playerOneLife, player)
            catchLoss(playerOneLife, player)
        case 2:
            playerTwoLife += hp
            editHPLabel(playerTwoLife, player)
            catchLoss(playerTwoLife, player)
        case 3:
            playerThreeLife += hp
            editHPLabel(playerThreeLife, player)
            catchLoss(playerThreeLife, player)
        default:
            playerFourLife += hp
            editHPLabel(playerFourLife, player)
            catchLoss(playerFourLife, player)
        }
    }
    
    func catchLoss(_ hp: Int, _ player: Int) {
        if hp <= 0 {
            playerLost.text = "Player \(player) LOSES!"
        }
    }
    
    func editHPLabel(_ hp: Int, _ player: Int) {
        switch player {
        case 1:
            p1CurrHP.text = "Player \(player): \(hp) HP"
        case 2:
            p2CurrHP.text = "Player \(player): \(hp) HP"
        case 3:
            p3CurrHP.text = "Player \(player): \(hp) HP"
        default:
            p4CurrHP.text = "Player \(player): \(hp) HP"
        }
    }
    
    @IBOutlet weak var p1CurrHP: UILabel!
    @IBOutlet weak var p2CurrHP: UILabel!
    @IBOutlet weak var p3CurrHP: UILabel!
    @IBOutlet weak var p4CurrHP: UILabel!
    
    @IBOutlet weak var playerLost: UILabel!
    
    @IBAction func p1Plus1(_ sender: UIButton) {
        calcHP(1, 1)
    }
    @IBAction func p1Plus5(_ sender: Any) {
        calcHP(5, 1)
    }
    @IBAction func p1Minus1(_ sender: Any) {
        calcHP(-1, 1)
    }
    @IBAction func p1Minus5(_ sender: Any) {
        calcHP(-5, 1)
    }
    
    @IBAction func p2Plus1(_ sender: UIButton) {
        calcHP(1, 2)
    }
    @IBAction func p2Plus5(_ sender: Any) {
        calcHP(5, 2)
    }
    @IBAction func p2Minus1(_ sender: Any) {
        calcHP(-1, 2)
    }
    @IBAction func p2Minus5(_ sender: Any) {
        calcHP(-5, 2)
    }
    
    @IBAction func p3Plus1(_ sender: UIButton) {
        calcHP(1, 3)
    }
    @IBAction func p3Plus5(_ sender: Any) {
        calcHP(5, 3)
    }
    @IBAction func p3Minus1(_ sender: Any) {
        calcHP(-1, 3)
    }
    @IBAction func p3Minus5(_ sender: Any) {
        calcHP(-5, 3)
    }
    
    @IBAction func p4Plus1(_ sender: UIButton) {
        calcHP(1, 4)
    }
    @IBAction func p4Plus5(_ sender: Any) {
        calcHP(5, 4)
    }
    @IBAction func p4Minus1(_ sender: Any) {
        calcHP(-1, 4)
    }
    @IBAction func p4Minus5(_ sender: Any) {
        calcHP(-5, 4)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}


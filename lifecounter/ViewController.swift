//
//  ViewController.swift
//  lifecounter
//
//  Created by Ryan Lee on 4/21/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var controls: UIView!
    @IBOutlet weak var PlayerStack: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        if let nib = Bundle.main.loadNibNamed("PlayerControls", owner: self),
//           let nibView = nib.first as? UIView {
//             nibView.frame = PlayerStack.bounds
//             nibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//             PlayerStack.addSubview(nibView)
//        }
    }
    
}


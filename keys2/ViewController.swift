//
//  ViewController.swift
//  keys2
//
//  Created by 谷出広大 on 2019/10/27.
//  Copyright © 2019 谷出広大. All rights reserved.
//

import UIKit

class ViewController: UIViewController, KeyViewDelegate {
    
    @IBOutlet weak var keyArea: UIView!
    @IBOutlet weak var label: UILabel!
    
    func onKeyTap(n: Int) {
        label.text = "key:\(n) tapped"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let keyview = KeyView(frame: keyArea.frame)
        keyview.keyViewDelegate = self
        view.addSubview(keyview)
    }
}

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var scoreArea: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let score = ScoreView(frame: scoreArea.frame)
        view.addSubview(score)
    }
}

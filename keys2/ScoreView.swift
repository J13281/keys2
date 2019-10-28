//
//  ScoreView.swift
//  keys2
//
//  Created by 谷出広大 on 2019/10/28.
//  Copyright © 2019 谷出広大. All rights reserved.
//

import UIKit

class ScoreView: UIView {
    
    let h = 20
    let x = 100
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        for i in 3..<8 {
            let v = line(CGRect(x: 0, y: CGFloat(i * h), width: frame.width, height: 1))
            addSubview(v)
        }
        
        showNote(n: 15)
    }
    
    func showNote(n: Int) {
        let v = score(n: n)
        v.frame = v.frame.offsetBy(dx: CGFloat(x), dy: 0)
        addSubview(v)
    }
    
    func score(n: Int) -> UIView {
        let v = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 200))
        v.backgroundColor = .red
        return v
    }
    
    func line(_ frame: CGRect) -> UIView {
        let v  = UIView(frame: frame)
        v.layer.borderColor = UIColor.black.cgColor
        v.layer.borderWidth = 1
        return v
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

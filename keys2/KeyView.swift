//
//  KeyView.swift
//  keys2
//
//  Created by 谷出広大 on 2019/10/27.
//  Copyright © 2019 谷出広大. All rights reserved.
//

import UIKit

protocol KeyViewDelegate {
    func onKeyTap(n: Int)
}

class KeyView: UIView {
    
    var keyViewDelegate: KeyViewDelegate?
    let keyNum = 10
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        let w1 = frame.width / CGFloat(keyNum)
        let w2 = w1 * CGFloat(0.666)
        let h1 = frame.height
        let h2 = frame.height * CGFloat(0.5)
        
        var tag = 0
        for i in 0..<keyNum {
            
            let v1 = white(CGRect(x: w1 * CGFloat(i), y: 0, width: w1, height: h1))
            v1.tag = tag
            addSubview(v1)
            tag += 1
            
            if i % 7 == 2 || i % 7 == 6 {
                continue
            }
            
            tag += 1
        }
        
        tag = 0
        for i in 0..<keyNum {
            
            tag += 1
            
            if i % 7 == 2 || i % 7 == 6 {
                continue
            }
            
            let v2 = black(CGRect(x: w1 * CGFloat(i) + w2, y: 0, width: w2, height: h2))
            v2.tag = tag
            addSubview(v2)
            tag += 1
        }
    }
    
    @objc func keyTapped(sender: UITapGestureRecognizer) {
        
        guard let tag = sender.view?.tag else {
            return
        }
        
        keyViewDelegate?.onKeyTap(n: tag)
        print("key:\(tag) tapped")
    }
    
    func white(_ frame: CGRect) -> UIView{
        let v = UIView(frame: frame)
        v.layer.borderWidth = 2
        v.layer.borderColor = UIColor.black.cgColor
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(keyTapped)))
        return v
    }
    
    func black(_ frame: CGRect) -> UIView{
        let v = UIView(frame: frame)
        v.backgroundColor = .black
        v.isUserInteractionEnabled = true
        v.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(keyTapped)))
        return v
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

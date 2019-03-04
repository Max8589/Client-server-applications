//
//  LoaderUIView.swift
//  VKApp
//
//  Created by admin on 15/02/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

enum LoaderAnimationStep {
    case step1
    case step2
    case stepEnd
}

class LoaderUIView: UIView {

    weak var label1: UILabel?
    weak var label2: UILabel?
    weak var label3: UILabel?
    
    var animationStep: LoaderAnimationStep = .step1 {
        didSet {
            self.updateStep()
        }
    }
    
    let animationaDuration: TimeInterval = 0.5
    
    private var isLoading: Bool = false
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.customInit()
    }
    
    func customInit() {
        let label1 = UILabel()
        let label2 = UILabel()
        let label3 = UILabel()
        label1.text = "."
        label2.text = "."
        label3.text = "."
        
        self.addSubview(label1)
        self.addSubview(label2)
        self.addSubview(label3)
        self.label1 = label1
        self.label2 = label2
        self.label3 = label3
        self.label1?.font = UIFont.systemFont(ofSize: 90)
        self.label2?.font = UIFont.systemFont(ofSize: 90)
        self.label3?.font = UIFont.systemFont(ofSize: 90)
        self.label1?.textColor = UIColor.white
        self.label2?.textColor = UIColor.white
        self.label3?.textColor = UIColor.white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.label1?.frame = self.bounds
        self.label2?.frame = self.bounds
        self.label3?.frame = self.bounds
    }
    
    
    func start() {
        self.isHidden  = false
        self.isLoading = true
        self.updateStep()
    }
    
    func stop() {
        self.isHidden  = true
        self.isLoading = false
    }
    
    func updateStep() {
        print("\(self.label1)")
        print("\(self.label2)")
        print("\(self.label3)")
        
        if false == self.isLoading {
            return
        }
        
        switch self.animationStep {
        case .step1:
            self.animateStep1()
        case .step2:
            self.animateStep2()
        case .stepEnd:
            self.animateStepEnd()
        }
    }
    
    
    
    func animateStep1() {
        UIView.animate(withDuration: self.animationaDuration,
                       animations: {
                        self.label1?.frame.origin.x = self.frame.size.width / 2
                        self.label2?.frame.origin.x = self.frame.size.width
                        self.label3?.frame.origin.x = 0
                        self.label1?.alpha = 0.2
                        self.label2?.alpha = 0.6
                        self.label3?.alpha = 0.9
        }) { (finished: Bool) in
            self.animationStep = .step2
        }
    }
    
    func animateStep2() {
        UIView.animate(withDuration: self.animationaDuration,
                       animations: {
                        self.label1?.frame.origin.x = self.frame.size.width / 2
                        self.label2?.frame.origin.x = self.frame.size.width
                        self.label3?.frame.origin.x = 0
                        self.label1?.alpha = 0.9
                        self.label2?.alpha = 0.2
                        self.label3?.alpha = 0.6
        }) { (finished: Bool) in
            self.animationStep = .stepEnd
        }
    }
    
    func animateStepEnd() {
        UIView.animate(withDuration: self.animationaDuration,
                       animations: {
                        self.label1?.frame.origin.x = self.frame.size.width / 2
                        self.label2?.frame.origin.x = self.frame.size.width
                        self.label3?.frame.origin.x = 0
                        self.label1?.alpha = 0.6
                        self.label2?.alpha = 0.9
                        self.label3?.alpha = 0.2
        }) { (finished: Bool) in
            self.animationStep = .step1
        }
    }

}

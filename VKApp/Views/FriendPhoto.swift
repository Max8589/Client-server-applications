//
//  FriendPhoto.swift
//  VKApp
//
//  Created by admin on 10/02/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

@IBDesignable class UserpicView: UIView {
    
    private weak var imageView: UIImageView?
    
    @IBInspectable var imageName: String = "Image" {
        didSet {
            self.addSubviews()
            self.setNeedsLayout()
            self.layoutIfNeeded()
            self.imageView?.image = UIImage(named: imageName)
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 16 {
        didSet {
            self.setShadow()
            self.layer.shadowRadius = shadowRadius
        }
    }
    
   // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setAppearance()
        self.addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setAppearance()
        self.addSubviews()
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imageView?.frame = self.bounds
        self.imageView?.layer.cornerRadius = 16
        self.imageView?.layer.borderWidth = 2
        self.imageView?.layer.borderColor = UIColor.gray.cgColor
        self.imageView?.layer.masksToBounds = true
    }
    
    // MARK: - Appearance
    
    private func setAppearance() {
        self.backgroundColor = nil
        self.setShadow()
    }
    
    private func setShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = self.shadowRadius
        self.layer.shadowOffset = CGSize(width: 0, height: self.shadowRadius)
    }
    
    // MARK: - Subviews
    
    private func addSubviews() {
        if nil == self.imageView {
            let imageView = UIImageView(image: UIImage(named: "Image"))
            self.addSubview(imageView)
            self.imageView = imageView
        }
    }
}

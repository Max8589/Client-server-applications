//
//  FriendViewController.swift
//  VKApp
//
//  Created by admin on 10/02/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController {
    
    var i = 1
    var labelName: String? = nil
    
    @IBOutlet weak var likeButton: LikeButton?
    @IBAction func likeButtonChanged() {
        print("likeButtonChanged")
    }
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendName.text = labelName
        
        photo.isUserInteractionEnabled = true
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        rightSwipe.direction = .right
        photo.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        rightSwipe.direction = .left
        photo.addGestureRecognizer(leftSwipe)
    }
    
    @objc func handleSwipes(_ sender: UISwipeGestureRecognizer) {
        let scaleAnimation = CASpringAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 1
        scaleAnimation.toValue = 0.7
        scaleAnimation.stiffness = 65
        scaleAnimation.mass = 2
        
        if (sender.direction == .left) {
            UIView.animate(withDuration: 0.2, delay: 0, options: [.allowUserInteraction, .autoreverse], animations: {
                print("Swipe left \(self.i)")
                if self.i < 3 {
                    self.i += 1
                    self.photo.layer.add(scaleAnimation, forKey: nil)
                    self.photo.image = UIImage(named: "\(self.i)")
            } else {
                    self.i = 1
                    self.photo.layer.add(scaleAnimation, forKey: nil)
                    self.photo.image = UIImage(named: "\(self.i)")
            }
          })
        }
        
        if (sender.direction == .right) {
            UIView.animate(withDuration: 0.2, delay: 0, options: [.allowUserInteraction, .autoreverse], animations: {
                print("Swipe right \(self.i)")
                if self.i > 1 {
                    self.i -= 1
                    self.photo.layer.add(scaleAnimation, forKey: nil)
                    self.photo.image = UIImage(named: "\(self.i)")
            } else {
                    self.i = 3
                    self.photo.layer.add(scaleAnimation, forKey: nil)
                    self.photo.image = UIImage(named: "\(self.i)")
            }
        })
      }
    }
}

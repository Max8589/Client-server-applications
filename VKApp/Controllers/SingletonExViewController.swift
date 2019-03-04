//
//  SingletonExViewController.swift
//  VKApp
//
//  Created by admin on 03/03/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class SingletonExViewController: UIViewController {
    
    @IBOutlet weak var tokenView: UILabel!
    @IBOutlet weak var userIdView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let session = Session.instance
        tokenView.text = session.token
        userIdView.text = String(describing: session.userId)
    }
}

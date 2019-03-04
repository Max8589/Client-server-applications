//
//  ViewModel2.swift
//  VKApp
//
//  Created by admin on 14/02/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ViewModel2: BaseViewModel {
    var name: String = ""
    var photo: UIImageView
    
    init(name: String, photo: UIImageView) {
        
        self.name = name
        self.photo = photo
    }
}

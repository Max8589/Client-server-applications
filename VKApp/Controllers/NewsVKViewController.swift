//
//  NewsVKViewController.swift
//  VKApp
//
//  Created by admin on 14/02/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class NewsVKViewController: UIViewController {
        
    @IBOutlet weak var CustomCollectionView: CustomCollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reloadNews()
    }
    
    func reloadNews() {
        var VKAppArray: [VKApplicationViewModel] = []
        for i in 1...10 {
            let VKApp = VKApplicationViewModel(group: "\(i). News")
           VKAppArray.append(VKApp)
        }
        self.CustomCollectionView?.reload(viewModels: VKAppArray)
    }
}

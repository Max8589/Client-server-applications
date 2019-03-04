//
//  GroupsVKViewController.swift
//  VKApp
//
//  Created by admin on 12/02/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

protocol AddGroupDelegate: class {
    func addGroup(group: VKApplicationViewModel)
}


class GroupsVKViewController: UIViewController {

    weak var delegate: AddGroupDelegate?
   
    @IBOutlet weak var customTableView: CustomTableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var VKAppArray: [VKApplicationViewModel] = []
        
        let VKApp1 = VKApplicationViewModel(group: "News")
        VKAppArray.append(VKApp1)
        
        let VKApp2 = VKApplicationViewModel(group: "Films")
        VKAppArray.append(VKApp2)
        
        let VKApp3 = VKApplicationViewModel(group: "Sport")
        VKAppArray.append(VKApp3)
        
        let VKApp4 = VKApplicationViewModel(group: "Music")
        VKAppArray.append(VKApp4)
        
        let VKApp5 = VKApplicationViewModel(group: "Humor")
        VKAppArray.append(VKApp5)
        
        self.customTableView?.reload(viewModels: VKAppArray)
        
        let headerViewModel = VKAppHeaderViewModel()
        headerViewModel.groupName = "Groups"
        self.customTableView?.setHeader(viewModel: headerViewModel)
        
        
    }
    
    @IBAction func add() {
        let viewModel = VKApplicationViewModel(group: "")
        self.customTableView?.add(viewModel: viewModel)
    }
}

extension GroupsVKViewController {
    func addGroup(group: VKApplicationViewModel) {
        self.delegate?.addGroup(group: group)
    }
}

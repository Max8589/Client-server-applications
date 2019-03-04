//
//  MyGroupsTableViewCell.swift
//  VKApp
//
//  Created by admin on 10/02/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class MyGroupsTableViewCell: UITableViewCell {

    @IBOutlet weak var myGroupsName: UILabel!
    
    func setViewModel(viewModel: VKApplicationViewModel) {
        self.myGroupsName?.text = viewModel.group
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

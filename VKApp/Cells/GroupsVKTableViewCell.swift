//
//  GroupsVKTableViewCell.swift
//  VKApp
//
//  Created by admin on 11/02/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class GroupsVKTableViewCell: UITableViewCell {

    func setViewModel(viewModel: VKApplicationViewModel) {
        self.groupLabel?.text = viewModel.group
    }
    
    @IBOutlet private weak var nameLabel: UILabel?
    @IBOutlet private weak var groupLabel: UILabel?
    @IBOutlet private weak var photoNameLabel: UILabel?
    @IBOutlet private weak var photo: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

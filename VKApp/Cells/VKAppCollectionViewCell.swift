//
//  VKAppCollectionViewCell.swift
//  VKApp
//
//  Created by admin on 14/02/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class VKAppCollectionViewCell: UICollectionViewCell {

    func setViewModel(viewModel: VKApplicationViewModel) {
        self.groupLabel?.text = viewModel.group
    }
    
    @IBOutlet private weak var nameLabel: UILabel?
    @IBOutlet private weak var groupLabel: UILabel?
    @IBOutlet private weak var photoNameLabel: UILabel?
    @IBOutlet private weak var photo: UIImageView?
    @IBOutlet weak var likeButton: LikeButton?

}

//
//  RepoItemTableViewCell.swift
//  Github C-Viper
//
//  Created by Onur Tuna on 28.12.2019.
//  Copyright © 2019 Onur Tuna. All rights reserved.
//

import UIKit

final class RepoItemTableViewCell: UITableViewCell {

    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var descriptionLabel: UILabel!
    
    var repo: Repo? {
        didSet {
            titleLabel.text = repo?.name
            descriptionLabel.text = repo?.fullname
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

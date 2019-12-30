//
//  RepoContributorTableViewCell.swift
//  Github C-Viper
//
//  Created by Onur Tuna on 29.12.2019.
//  Copyright © 2019 Onur Tuna. All rights reserved.
//

import UIKit

class RepoContributorTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var fullnameLabel: UILabel!
    
    //let cache = NSCache<NSString, UIImage>()
    var presenter: RepoPresenter?
    var contributor: Contributor? {
        didSet {
            fullnameLabel.text = contributor?.name
//            guard let name = contributor?.name as NSString? else {
//                return
//            }
//            if let cached = cache.object(forKey: name) {
//                self.avatarImageView.image = cached
//            } else {
                presenter?.getContributorAvatar(path: contributor?.avatarUrl ?? "", imageDownloaded: { (data) in
                    guard let avatar = UIImage(data: data, scale: 1.0) else {
                        return
                    }
                    self.avatarImageView.image = avatar
//                    guard let name = self.contributor?.name as NSString? else {
//                        return
//                    }
//                    self.cache.setObject(avatar, forKey: name)
                })
//            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.image = nil
    }
    
}

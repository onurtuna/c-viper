//
//  RepoDetailViewController.swift
//  Github C-Viper
//
//  Created by Onur Tuna on 29.12.2019.
//  Copyright © 2019 Onur Tuna. All rights reserved.
//

import UIKit

final class RepoDetailViewController: UIViewController {

    @IBOutlet weak var ownerAvatarImageView: UIImageView!
    @IBOutlet weak var ownerLoginLabel: UILabel!
    @IBOutlet weak var repoDescriptionLabel: UILabel!
    @IBOutlet weak var forksCountLabel: UILabel!
    @IBOutlet weak var stargazersCountLabel: UILabel!
    @IBOutlet weak var contributorsTableView: UITableView!
    
    private var presenter: RepoPresenter?
    private var repo: Repo?
    var repoDetail: RepoDetail?
    
    init(repo: Repo, presenter: RepoPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.repo = repo
        presenter.getDetail(of: repo.fullname)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.repoDetailFetched = { [unowned self] (repoDetail) in
            self.repoDetail = repoDetail
            self.setupView()
        }
    }
    
    fileprivate func setupView() {
        ownerLoginLabel.text = repoDetail?.owner.login
        repoDescriptionLabel.text = repoDetail?.description
        forksCountLabel.text = "forks: \(repoDetail?.forksCount ?? 0)"
        stargazersCountLabel.text = "stargazers: \(repoDetail?.stargazersCount ?? 0)"
    }

}

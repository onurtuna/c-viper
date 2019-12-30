//
//  RepoDetailViewController.swift
//  Github C-Viper
//
//  Created by Onur Tuna on 29.12.2019.
//  Copyright © 2019 Onur Tuna. All rights reserved.
//

import UIKit

final class RepoDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ownerAvatarImageView: UIImageView!
    @IBOutlet weak var ownerLoginLabel: UILabel!
    @IBOutlet weak var repoDescriptionLabel: UILabel!
    @IBOutlet weak var forksCountLabel: UILabel!
    @IBOutlet weak var stargazersCountLabel: UILabel!
    @IBOutlet weak var contributorsTableView: UITableView!
    
    private var presenter: RepoPresenter?
    private var repo: Repo?
    var repoDetail: RepoDetail?
    private var contributors = Array<Contributor>()
    
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
        titleLabel.text = repo?.name
        registerTableItems()
        setupClosures()
        fetchContributors()
    }
    
    fileprivate func setupView() {
        ownerLoginLabel.text = "owner: \(repoDetail?.owner.login ?? "")"
        repoDescriptionLabel.text = repoDetail?.description
        forksCountLabel.text = "forks: \(repoDetail?.forksCount ?? 0)"
        stargazersCountLabel.text = "stargazers: \(repoDetail?.stargazersCount ?? 0)"
    }
    
    fileprivate func setupClosures() {
        presenter?.ownerAvatarDownloaded = { [unowned self] (response) in
            guard let avatar = UIImage(data: response, scale: 1.0) else {
                return
            }
            self.ownerAvatarImageView.image = avatar
        }
        presenter?.repoDetailFetched = { [unowned self] (repoDetail) in
            self.repoDetail = repoDetail
            self.presenter?.getOwnerAvatar(path: repoDetail.owner.avatarUrl)
            self.setupView()
        }
    }
    
    fileprivate func fetchContributors() {
        presenter?.fetchContributors(of: repo?.fullname ?? "", contributorsFetched: { [unowned self] (contributors) in
            self.contributors.removeAll()
            self.contributors = contributors
            self.contributorsTableView.reloadData()
        })
    }
    
    fileprivate func registerTableItems() {
        contributorsTableView.dataSource = self
        contributorsTableView.delegate = self
        contributorsTableView.register(UINib(nibName: "RepoContributorTableViewCell", bundle: nil), forCellReuseIdentifier: "RepoContributorTableViewCell")
    }

}

extension RepoDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contributors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepoContributorTableViewCell") as? RepoContributorTableViewCell else {
            return UITableViewCell()
        }
        cell.presenter = presenter
        cell.contributor = contributors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

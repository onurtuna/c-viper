//
//  ViewController.swift
//  Github C-Viper
//
//  Created by Onur Tuna on 28.12.2019.
//  Copyright © 2019 Onur Tuna. All rights reserved.
//

import UIKit

class RepoListViewController: UIViewController {

    @IBOutlet weak var repoListTableView: UITableView!
    
    var currentPage = 1
    var presenter: RepoPresenter?
    var repos: Array<Repo> = Array<Repo>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repoListTableView.dataSource = self
        repoListTableView.delegate = self
        repoListTableView.register(UINib(nibName: "RepoItemTableViewCell", bundle: nil), forCellReuseIdentifier: "RepoItemTableViewCell")
        presenter?.reposFetched = { (repos) in
            self.repos.append(contentsOf: repos)
            self.repoListTableView.reloadData()
        }
        presenter?.startFetchingRepos(page: currentPage)
    }

}

extension RepoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == (repos.count) - 1 { // last cell
            currentPage += 1
            presenter?.startFetchingRepos(page: currentPage)
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepoItemTableViewCell") as? RepoItemTableViewCell else {
            return UITableViewCell()
        }
        cell.repo = repos[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let presenter = presenter else {
            return
        }
        guard let navigationController = navigationController else {
            return
        }
        RepoRouter.pushToRepoDetail(repo: repos[indexPath.row], presenter: presenter, navigationController: navigationController)
    }
    
}

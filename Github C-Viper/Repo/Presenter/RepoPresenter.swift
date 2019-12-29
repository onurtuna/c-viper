//
//  RepoPresenter.swift
//  Github C-Viper
//
//  Created by Onur Tuna on 28.12.2019.
//  Copyright © 2019 Onur Tuna. All rights reserved.
//

import Foundation

class RepoPresenter {
    
    var interactor: RepoInteractor?
    var reposFetched: ((Array<Repo>) -> Void)? {
        didSet {
            interactor?.reposFetched = reposFetched
        }
    }
    var repoDetailFetched: ((RepoDetail) -> Void)? {
        didSet {
            interactor?.repoDetailFetched = repoDetailFetched
        }
    }
    
    func startFetchingRepos(page: Int) {
        interactor?.fetchRepos(page: page)
    }
    
    func getDetail(of repoFullname: String) {
        interactor?.getDetail(of: repoFullname)
    }
    
}

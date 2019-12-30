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
    var ownerAvatarDownloaded: ((Data) -> Void)? {
        didSet {
            interactor?.imageDownloaded = ownerAvatarDownloaded
        }
    }
    private var contributorInteractor = ContributorInteractor()
    
    func startFetchingRepos(page: Int) {
        interactor?.fetchRepos(page: page)
    }
    
    func getDetail(of repoFullname: String) {
        interactor?.getDetail(of: repoFullname)
    }
    
    func getOwnerAvatar(path: String) {
        interactor?.downloadImage(path: path)
    }
    
    func fetchContributors(of repoFullname: String, contributorsFetched: @escaping (Array<Contributor>) -> Void) {
        contributorInteractor.contributorsFetched = { (contributors) in
            contributorsFetched(contributors)
        }
        contributorInteractor.fetchContributors(of: repoFullname)
    }
    
    func getContributorAvatar(path: String, imageDownloaded: @escaping (Data) -> Void) {
        contributorInteractor.imageDownloaded = { (data) in
            imageDownloaded(data)
        }
        contributorInteractor.downloadImage(path: path)
    }
    
}

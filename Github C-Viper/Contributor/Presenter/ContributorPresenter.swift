//
//  ContributorPresenter.swift
//  Github C-Viper
//
//  Created by Onur Tuna on 29.12.2019.
//  Copyright © 2019 Onur Tuna. All rights reserved.
//

import Foundation

class ContributorPresenter {
    
    var interactor: ContributorInteractor?
    var contributorsFetched: ((Array<Contributor>) -> Void)? {
        didSet {
            interactor?.contributorsFetched = contributorsFetched
        }
    }
    
    func fetchContributors(of repoFullname: String) {
        interactor?.fetchContributors(of: repoFullname)
    }
    
    func getDetail(of contributorUrl: String) {
        interactor?.getDetail(of: contributorUrl)
    }
    
}

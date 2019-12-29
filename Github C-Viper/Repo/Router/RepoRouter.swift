//
//  RepoRouter.swift
//  Github C-Viper
//
//  Created by Onur Tuna on 28.12.2019.
//  Copyright © 2019 Onur Tuna. All rights reserved.
//

import Foundation
import UIKit

class RepoRouter {
    
    class func createModule() -> RepoListViewController {
        guard let view = RepoRouter.mainstoryboard.instantiateViewController(withIdentifier: "RepoListViewController") as? RepoListViewController else {
            // sıçış
            return RepoListViewController()
        }
        let presenter = RepoPresenter()
        let interactor = RepoInteractor()
        
        view.presenter = presenter
        presenter.interactor = interactor
        
        return view
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    class func pushToRepoDetail(repo: Repo, presenter: RepoPresenter, navigationController: UINavigationController) -> Void {
        let repoDetailVC = RepoDetailViewController(repo: repo, presenter: presenter)
        navigationController.pushViewController(repoDetailVC, animated: true)
    }
    
}

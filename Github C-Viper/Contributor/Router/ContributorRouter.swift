//
//  ContributorRouter.swift
//  Github C-Viper
//
//  Created by Onur Tuna on 29.12.2019.
//  Copyright © 2019 Onur Tuna. All rights reserved.
//

import Foundation

class ContributorRouter {
    
    class func createModule() -> ContributorViewController {
        let view = ContributorViewController()
        let presenter = ContributorPresenter()
        let interactor = ContributorInteractor()
        
        view.presenter = presenter
        presenter.interactor = interactor
        
        return view
    }
    
}

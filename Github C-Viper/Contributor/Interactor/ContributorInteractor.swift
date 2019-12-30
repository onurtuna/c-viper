//
//  ContributorInteractor.swift
//  Github C-Viper
//
//  Created by Onur Tuna on 29.12.2019.
//  Copyright © 2019 Onur Tuna. All rights reserved.
//

import Moya

class ContributorInteractor {
    
    var contributorsFetched: ((Array<Contributor>) -> Void)?
    var imageDownloaded: ((Data) -> Void)?
    
    func fetchContributors(of repoFullname: String) {
        MoyaHelper.getProvider(GithubContributor.self).request(.fetch(repoFullname: repoFullname), completion: { [unowned self] result in
            switch result {
                case .success(let response):
                    let decoder = JSONDecoder()
                    do {
                        let contributors = try decoder.decode(Array<Contributor>.self, from: response.data)
                        self.contributorsFetched?(contributors)
                    } catch (let error) {
                        print(error)
                    }
                case .failure(let error):
                    print(error)
            }
        })
    }
    
    func downloadImage(path: String) {
        MoyaHelper.getProvider(FileService.self).request(.download(url: path), completion: { [unowned self] (result) in
            switch result {
            case .success(let response):
                self.imageDownloaded?(response.data)
            case .failure(let error):
                print(error)
            }
        })
    }
    
}

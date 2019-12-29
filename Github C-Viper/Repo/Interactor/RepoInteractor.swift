//
//  RepoInteractor.swift
//  Github C-Viper
//
//  Created by Onur Tuna on 28.12.2019.
//  Copyright © 2019 Onur Tuna. All rights reserved.
//

import Moya

class RepoInteractor {
    
    var reposFetched: ((Array<Repo>) -> Void)?
    var repoDetailFetched: ((RepoDetail) -> Void)?
    var imageDownloaded: ((Data) -> Void)?
    
    func fetchRepos(page: Int) {
        getProvider(GithubRepo.self).request(.search(page: page), completion: { [unowned self] result in
            switch result {
                case .success(let response):
                    let decoder = JSONDecoder()
                    do {
                        let repos = try decoder.decode(RepoItem.self, from: response.data).items
                        self.reposFetched?(repos)
                    } catch (let error) {
                        print(error)
                    }
                case .failure(let error):
                    print(error)
            }
        })
    }
    
    func getDetail(of repoFullname: String) {
        getProvider(GithubRepo.self).request(.detail(repoFullname: repoFullname), completion: { [unowned self] result in
            switch result {
            case .success(let response):
                let decoder = JSONDecoder()
                do {
                    let repoDetail = try decoder.decode(RepoDetail.self, from: response.data)
                    self.repoDetailFetched?(repoDetail)
                } catch (let error) {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func downloadImage(path: String) {
        getProvider(FileService.self).request(.download(url: path), completion: { [unowned self] (result) in
            switch result {
            case .success(let response):
                self.imageDownloaded?(response.data)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    fileprivate func getProvider<T>(_ input: T.Type) -> MoyaProvider<T> {
        let provider = MoyaProvider<T>(plugins: [CompleteUrlLoggerPlugin()])
        return provider
    }
    
}

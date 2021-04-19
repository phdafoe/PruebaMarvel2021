//
//  DetailCharacterPresenter.swift
//  PruebaMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek
//

import Foundation

protocol DetailCharacterPresenterProtocolOutput: class {
    func loadDetailCharacter()
    func loadDetailSeries()
    func getHeaderInfoOfRow(completion: @escaping (ResultCharacter?) -> Void)
    func getArrayItemComics() -> Int
    func getInfoComic(index: Int, completion: @escaping(ResultComic) -> Void)
    func getInfoSeries(completion: @escaping ([ResultSeries]?) -> Void)
}


final class DetailCharacterPresenter: BasePresenter<DetailCharacterViewController, DetailCharacterRouterProtocolOutput> {
        
    var listDetailComic: [ResultComic]? = []
    var listSeries: [ResultSeries]? = []
    var dataResult: ResultCharacter? = nil
    var provider: DetailCharacterProviderProtocol!
    
}


extension DetailCharacterPresenter: DetailCharacterPresenterProtocolOutput {
    
    func loadDetailCharacter() {
        self.listDetailComic = nil
        self.viewController?.showLoading(view: (self.viewController?.view)!, animated: true)
        self.provider.fetchDetailCharacter(id: "\(self.dataResult?.id ?? 0)") { [weak self] (result) in
            guard let self = self else { return }
            if let resultDes = result {
                self.listDetailComic = resultDes.data?.results
                self.viewController?.reloadData()
                self.viewController?.hideLoading(view: (self.viewController?.view)!, animated: true)
            }
        } failure: { (error) in
            print(error?.httpClientError as Any)
        }
    }

    func loadDetailSeries() {
        self.listSeries = nil
        self.viewController?.showLoading(view: (self.viewController?.view)!, animated: true)
        self.provider.fetchDetailSeries(id: "\(self.dataResult?.id ?? 0)") { [weak self] (result) in
            guard let self = self else { return }
            if let resultDes = result {
                self.listSeries = resultDes.data?.results
                self.viewController?.reloadData()
                self.viewController?.hideLoading(view: (self.viewController?.view)!, animated: true)
            }
        } failure: { (error) in
            print(error?.httpClientError as Any)
        }
    }

    internal func getHeaderInfoOfRow(completion: @escaping (ResultCharacter?) -> Void) {
        completion(dataResult)
    }

    internal func getArrayItemComics() -> Int {
        return listDetailComic?.count ?? 0
    }

    internal func getInfoComic(index: Int, completion: @escaping(ResultComic) -> Void) {
        completion(self.listDetailComic![index])
    }

    func getInfoSeries(completion: @escaping ([ResultSeries]?) -> Void) {
        completion(self.listSeries)
    }

    
    
    
    
    
    
}

//
//  ListComicsPresenter.swift
//  PruebaMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek
//

import Foundation

protocol ListComicsPresenterProtocolOutput: class {
    func loadComics()
    func getNumberOfRowCell() -> Int?
    func getModelDataCell(index: Int) -> ResultComics?
}

final class ListComicsPresenter: BasePresenter<ListComicsViewController, ListComicsRouterProtocolOutput> {
    
    var listComics: [ResultComics]? = []
    var provider: ListComicsProviderProtocol!
 
}



extension ListComicsPresenter: ListComicsPresenterProtocolOutput {
    
    internal func loadComics() {
        self.listComics = nil
        self.viewController?.showLoading(view: (self.viewController?.view)!, animated: true)
        self.provider.fetchListComics { [weak self] (result) in
            guard let self = self else { return }
            if let resultDes = result {
                self.listComics = resultDes.data?.results
                self.viewController?.reloadData()
                self.viewController?.hideLoading(view: (self.viewController?.view)!, animated: true)
            }
        } failure: { (error) in
            print(error?.httpClientError as Any)
        }
    }
    
    func getNumberOfRowCell() -> Int? {
        return self.listComics?.count ?? 0
    }
    
    func getModelDataCell(index: Int) -> ResultComics? {
        return self.listComics![index]
    }
}

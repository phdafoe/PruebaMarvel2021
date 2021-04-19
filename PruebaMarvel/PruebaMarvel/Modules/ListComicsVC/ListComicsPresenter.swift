//
//  ListComicsPresenter.swift
//  PruebaMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek
//

import Foundation

protocol ListComicsPresenterProtocolOutput: class {
//    func loadComics(with endpoint: ListEndPoint)
//    func getNumberOfRowCell() -> Int?
//    func getModelDataCell(index: Int) -> ResultComics?
}

final class ListComicsPresenter: BasePresenter<ListComicsViewPresenterInterface, ListComicsRouterProtocolOutput> {
    
    var listComics: [ResultComics]? = []
    var error: NSError?
    
//    var provider: ServiceManagerProtocol!
    
 
}



extension ListComicsPresenter: ListComicsPresenterProtocolOutput {
//    internal func loadComics(with endpoint: ListEndPoint) {
//        self.listComics = nil
//        self.provider.fetchListComics(from: endpoint) { [weak self] (result) in
//            guard let self = self else { return }
//            switch result {
//            case .success(let response):
//                self.listComics = response.data?.results
//                self.viewController?.reloadData()
//            case .failure(let error):
//                self.error = error as NSError
//            }
//        }
//    }
//    
//    func getNumberOfRowCell() -> Int? {
//        return self.listComics?.count ?? 0
//    }
//    
//    func getModelDataCell(index: Int) -> ResultComics? {
//        return self.listComics![index]
//    }
}

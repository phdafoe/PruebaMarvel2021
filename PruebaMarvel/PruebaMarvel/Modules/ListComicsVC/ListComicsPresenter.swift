//
//  ListComicsPresenter.swift
//  PruebaMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek
//

import Foundation

protocol ListComicsPresenterProtocolOutput: class {
    func loadComics()
}

final class ListComicsPresenter: BasePresenter<ListComicsViewController, ListComicsRouterProtocolOutput> {
    
    var listComics: [ComicsViewModel] = []
    //var comicsModels: [Any] = []
    var provider: ListComicsProviderProtocol!
    weak var tablePresenterDelegate: TablePresenterDelegate?
 
}

extension ListComicsPresenter: ListComicsPresenterProtocolOutput {
    
    
    internal func loadComics() {
        self.listComics = []
        self.viewController?.showLoading(view: (self.viewController?.view)!, animated: true)
        self.provider.fetchListComics { [weak self] (result) in
            guard let self = self else { return }
            if let resultDes = result {
                //self.listComics = resultDes.data?.results ?? []
                self.updateContent(businessModel: resultDes.data?.results ?? [])
                self.viewController?.hideLoading(view: (self.viewController?.view)!, animated: true)
            }
        } failure: { (error) in
            print(error?.httpClientError as Any)
        }
    }
    
    private func updateContent(businessModel: [ResultComics]) {
        listComics.removeAll()
        listComics = businessModel.map { ComicsViewModel(viewModel: $0 )}
        self.tablePresenterDelegate?.dataSourceUpdated()
    }
}

extension ListComicsPresenter: TablePresenterProtocol {
    
    func numberOfCells(_ tableType: TableType, section: Int) -> Int {
        return self.listComics.count
    }
    
    func object(_ tableType: TableType, indexPath: IndexPath) -> Any {
        self.listComics[indexPath.row]
    }
    
    
    
}

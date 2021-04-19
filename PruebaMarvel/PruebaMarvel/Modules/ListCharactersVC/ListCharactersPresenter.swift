//
//  ListCharactersPresenter.swift
//  PruebaMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek
//

import Foundation

protocol ListCharactersPresenterProtocolOutput : class {
    func loadCharacters()
    func getNumberOfRowCell() -> Int?
    func getModelDataCell(index: Int) -> ResultCharacter?
    func showDetailCharacterFromView(data: ResultCharacter)
}

final class ListCharactersPresenter: BasePresenter<ListCharactersViewController, ListCharactersRouterProtocolOutput> {
    
    var listCharacters: [ResultCharacter]? = []
    var provider: ListCharactersProviderProtocol!
 
}


extension ListCharactersPresenter: ListCharactersPresenterProtocolOutput {
    func showDetailCharacterFromView(data: ResultCharacter) {
        self.router?.showDetailCharacter(data: data)
    }
    
    
    internal func loadCharacters() {
        self.listCharacters = nil
        self.viewController?.showLoading(view: (self.viewController?.view)!, animated: true)
        provider.fetchListCharacters { (result) in
            if let resultDes = result {
                self.listCharacters = resultDes.data?.results
                self.viewController?.reloadData()
                self.viewController?.hideLoading(view: (self.viewController?.view)!, animated: true)
            }
        } failure: { (error) in
            print(error?.httpClientError as Any)
        }

    }
    
    internal func getNumberOfRowCell() -> Int? {
        return listCharacters?.count ?? 0
    }

    internal func getModelDataCell(index: Int) -> ResultCharacter? {
        return (listCharacters?[index])!
    }
}

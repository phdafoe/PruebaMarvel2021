//
//  ListCharactersPresenter.swift
//  PruebaMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek
//

import Foundation

protocol ListCharactersPresenterProtocolOutput : class {
    func loadCharacters(with endpoint: ListEndPoint)
    func getNumberOfRowCell() -> Int?
    func getModelDataCell(index: Int) -> ResultCharacter?
    func showDetailCharacterFromView(data: ResultCharacter)
}

final class ListCharactersPresenter: BasePresenter<ListCharactersViewController, ListCharactersRouterProtocolOutput> {
    
    var listCharacters: [ResultCharacter]? = []
    var error: NSError?
    var provider: ServiceManagerProtocol!
 
}


extension ListCharactersPresenter: ListCharactersPresenterProtocolOutput {
    func showDetailCharacterFromView(data: ResultCharacter) {
        self.router?.showDetailCharacter(data: data)
    }
    
    
    internal func loadCharacters(with endpoint: ListEndPoint) {
        self.listCharacters = nil
        self.provider.fetchListCharacters(from: endpoint) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.listCharacters = response.data?.results
                self.viewController?.reloadData()
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
    
    internal func getNumberOfRowCell() -> Int? {
        return listCharacters?.count ?? 0
    }

    internal func getModelDataCell(index: Int) -> ResultCharacter? {
        return (listCharacters?[index])!
    }
}

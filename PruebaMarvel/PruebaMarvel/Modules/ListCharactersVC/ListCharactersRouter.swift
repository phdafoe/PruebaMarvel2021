//
//  ListCharactersRouter.swift
//  PruebaMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek
//

import Foundation
import UIKit

protocol ListCharactersRouterProtocolOutput: class {
    func showDetailCharacter(data: ResultCharacter)
}

final class ListCharactersRouter: BaseRouter<ListCharactersPresenterProtocolOutput> {
}

extension ListCharactersRouter: ListCharactersRouterProtocolOutput {
    func showDetailCharacter(data: ResultCharacter) {
        let vc = DetailCharacterAssembly.buildViewController(dto: DetailCharacterCoordinatorDTO(data: data))
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

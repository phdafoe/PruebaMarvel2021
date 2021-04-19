//
//  ListComicsRouter.swift
//  PruebaMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek
//

import Foundation
import UIKit

protocol ListComicsRouterProtocolOutput: class {
    //func showDetailCharacter(data: ResultCharacter)
}

final class ListComicsRouter: BaseRouter<ListComicsPresenterProtocolOutput> {
}

extension ListComicsRouter: ListComicsRouterProtocolOutput {
//    func showDetailCharacter(data: ResultCharacter) {
//        let vc = DetailCharacterCoordinator().build(dto: DetailCharacterCoordinatorDTO(data: data))
//        self.viewController?.navigationController?.pushViewController(vc, animated: true)
//    }
    

}

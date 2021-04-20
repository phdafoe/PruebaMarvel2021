//
//  ListCharactersPresenterMock.swift
//  PruebaMarvelTests
//
//  Created by Andres Felipe Ocampo Eljaiek
//

import Foundation
@testable import PruebaMarvel

protocol ListPresenterMockProtocol: class {
    var count: Int { get }
    var isWasCalled: Bool { get }
}

class ListPresenterMock: ListCharactersPresenterProtocolOutput, ListPresenterMockProtocol {
    
    var listCharacters: [ResultCharacter]? = []
    var count: Int = 0
    var isWasCalled = false

    func loadCharacters() {
        self.count += 1
        self.isWasCalled = true
        
        listCharacters = [ResultCharacter(id: 0,
                                          name: "Marvel Previews (2017)",
                                          resultDescription: "The Marvel Age of Comics continues! This time around, Spidey meets his match against such classic villains as Electro and the Lizard, and faces the return of one of his first foes: the Vulture! Plus: Spider-Man vs. the Living Brain, Peter Parker's fight with Flash Thompson, and the wall-crawler tackles the high-flying Human Torch!",
                                          modified: "2018-01-22T15:42:11-0500",
                                          thumbnail: nil,
                                          resourceURI: nil,
                                          comics: nil,
                                          series: nil,
                                          stories: nil,
                                          events: nil,
                                          urls: nil)]
    }

    func getNumberOfRowCell() -> Int? {
        return listCharacters?.count
    }

    func getModelDataCell(index: Int) -> ResultCharacter? {
        return (listCharacters?[index])!
    }

    func showDetailCharacterFromView(data: ResultCharacter) {
        //
    }
    
    
    
}

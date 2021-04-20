//
//  ListCharactersProviderMock.swift
//  PruebaMarvelTests
//
//  Created by Andres Felipe Ocampo Eljaiek
//

import Foundation
@testable import PruebaMarvel

class ListCharactersProviderMock: ListCharactersProviderProtocol {
    
    public static var isFetchDataIsCalled = false
    public static var mockErrorInFetchListaCharatersResponse = false
    var arrayResultCharacter: ResultCharacter?
    var listCharacterModel: ListCharacteresModel?
    
    var arrayResultComics: ResultComics?
    var listComicsModel: ListComicsModel?
    
    func fetchListCharacters(completionSuccess: @escaping (ListCharacteresModel?) -> (), failure: @escaping (CustomErrorModel?) -> ()) {
        ListCharactersProviderMock.isFetchDataIsCalled = true
        var myArrayResultCharacter: [ResultCharacter] = []
        self.arrayResultCharacter = ResultCharacter(id: 82967,
                                                    name: "Marvel Previews (2017)",
                                                    resultDescription: "The Marvel Age of Comics continues! This time around, Spidey meets his match against such classic villains as Electro and the Lizard, and faces the return of one of his first foes: the Vulture! Plus: Spider-Man vs. the Living Brain, Peter Parker's fight with Flash Thompson, and the wall-crawler tackles the high-flying Human Torch!",
                                                    modified: "2018-01-22T15:42:11-0500",
                                                    thumbnail: nil,
                                                    resourceURI: "http://gateway.marvel.com/v1/public/comics/82967",
                                                    comics: nil,
                                                    series: nil,
                                                    stories: nil,
                                                    events: nil,
                                                    urls: nil)
        myArrayResultCharacter.append(self.arrayResultCharacter!)
        self.listCharacterModel = ListCharacteresModel(code: 200,
                                                       status: "OK",
                                                       copyright: "© 2021 MARVEL",
                                                       attributionText: "Data provided by Marvel. © 2021 MARVEL",
                                                       attributionHTML: "<a href=\"http://marvel.com\">Data provided by Marvel. © 2021 MARVEL</a>",
                                                       etag: "e2f7734f62d93429c7d983025f216833e52c9b09",
                                                       data: DataClassCharacters(offset: 0,
                                                                                 limit: 20,
                                                                                 total: 48381,
                                                                                 count: 20,
                                                                                 results: myArrayResultCharacter))
        if ListCharactersProviderMock.mockErrorInFetchListaCharatersResponse {
           completionSuccess(self.listCharacterModel)
        } else {
            failure(CustomErrorModel(httpClientError: .internalServerError, backendError: .unknownError))
        }
    }
    
}


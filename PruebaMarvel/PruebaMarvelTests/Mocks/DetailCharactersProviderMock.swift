//
//  DetailCharactersProviderMock.swift
//  PruebaMarvelTests
//
//  Created by Andres Felipe Ocampo Eljaiek on 20/4/21.
//

import Foundation
@testable import PruebaMarvel

class DetailCharactersProviderMock: DetailCharacterProviderProtocol {
 
    public static var isFetchDataIsCalled = false
    public static var mockErrorInFetchListaCharatersResponse = false
    
    var resultSeries: ResultSeries?
    var listDetailModel: DetailSeriesModel?
    
    var arrayResultSeries: [ResultSeries]?
    var detailSeriesModel: DetailSeriesModel?
    
    var detailComicModel: DetailComicModel?
    var arrayResultComics: [ResultComic]?
    var resultComic: ResultComic?
    
    func fetchDetailSeries(id: String, completionSuccess: @escaping (DetailSeriesModel?) -> (), failure: @escaping (CustomErrorModel?) -> ()) {
        DetailCharactersProviderMock.isFetchDataIsCalled = true
        var myArrayResultSeries: [ResultSeries] = []
        self.resultSeries = ResultSeries(id: 82967,
                                         title: "Marvel Previews (2017)",
                                         resultDescription: "The Marvel Age of Comics continues! This time around, Spidey meets his match against such classic villains as Electro and the Lizard, and faces the return of one of his first foes: the Vulture! Plus: Spider-Man vs. the Living Brain, Peter Parker's fight with Flash Thompson, and the wall-crawler tackles the high-flying Human Torch!",
                                         resourceURI: nil,
                                         urls: nil,
                                         startYear: nil,
                                         endYear: nil,
                                         rating: nil,
                                         type: nil,
                                         modified: nil,
                                         thumbnail: nil,
                                         creators: nil,
                                         characters: nil,
                                         stories: nil,
                                         comics: nil,
                                         events: nil,
                                         next: nil,
                                         previous: nil)
        myArrayResultSeries.append(self.resultSeries!)
        self.listDetailModel = DetailSeriesModel(code: 200,
                                                 status: "OK",
                                                 copyright: "© 2021 MARVEL",
                                                 attributionText: "Data provided by Marvel. © 2021 MARVEL",
                                                 attributionHTML: "<a href=\"http://marvel.com\">Data provided by Marvel. © 2021 MARVEL</a>",
                                                 etag: "e2f7734f62d93429c7d983025f216833e52c9b09",
                                                 data: DataClassSeries(offset: 0,
                                                                       limit: 20,
                                                                       total: 48381,
                                                                       count: 20,
                                                                       results: myArrayResultSeries))
        if DetailCharactersProviderMock.mockErrorInFetchListaCharatersResponse {
            completionSuccess(self.listDetailModel)
        } else {
            failure(CustomErrorModel(httpClientError: .internalServerError, backendError: .unknownError))
        }
    }
    
    func fetchDetailCharacter(id: String, completionSuccess: @escaping (DetailComicModel?) -> (), failure: @escaping (CustomErrorModel?) -> ()) {
        DetailCharactersProviderMock.isFetchDataIsCalled = true
        var myArrayResultComic: [ResultComic] = []
        self.resultComic = ResultComic(id: 82967,
                                       digitalId: 0,
                                       title: "Marvel Previews (2017)",
                                       issueNumber: 1,
                                       variantDescription: "The Marvel Age of Comics continues! This time around, Spidey meets his match against such classic villains as Electro and the Lizard, and faces the return of one of his first foes: the Vulture! Plus: Spider-Man vs. the Living Brain, Peter Parker's fight with Flash Thompson, and the wall-crawler tackles the high-flying Human Torch!",
                                       resultDescription: "The Marvel Age of Comics continues! This time around, Spidey meets his match against such classic villains as Electro and the Lizard, and faces the return of one of his first foes: the Vulture! Plus: Spider-Man vs. the Living Brain, Peter Parker's fight with Flash Thompson, and the wall-crawler tackles the high-flying Human Torch!",
                                       modified: nil,
                                       isbn: nil,
                                       upc: nil,
                                       diamondCode: nil,
                                       ean: nil,
                                       issn: nil,
                                       format: nil,
                                       pageCount: nil,
                                       textObjects: nil,
                                       resourceURI: nil,
                                       urls: nil,
                                       series: nil,
                                       variants: nil,
                                       collections: nil,
                                       collectedIssues: nil,
                                       dates: nil,
                                       prices: nil,
                                       thumbnail: nil,
                                       images: nil,
                                       creators: nil,
                                       characters: nil,
                                       stories: nil,
                                       events: nil)
        myArrayResultComic.append(self.resultComic!)
        self.detailComicModel = DetailComicModel(code: 200,
                                                 status: "OK",
                                                 copyright: "© 2021 MARVEL",
                                                 attributionText: "Data provided by Marvel. © 2021 MARVEL",
                                                 attributionHTML: "<a href=\"http://marvel.com\">Data provided by Marvel. © 2021 MARVEL</a>",
                                                 etag: "e2f7734f62d93429c7d983025f216833e52c9b09",
                                                 data: DataClass(offset: 0,
                                                                 limit: 20,
                                                                 total: 48381,
                                                                 count: 20,
                                                                 results: myArrayResultComic))
        if DetailCharactersProviderMock.mockErrorInFetchListaCharatersResponse {
            completionSuccess(self.detailComicModel)
        } else {
            failure(CustomErrorModel(httpClientError: .internalServerError, backendError: .unknownError))
        }
    }
}

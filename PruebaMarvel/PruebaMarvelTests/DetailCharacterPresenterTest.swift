//
//  DetailCharacterPresenterTest.swift
//  PruebaMarvelTests
//
//  Created by Andres Felipe Ocampo Eljaiek
//

import XCTest
@testable import PruebaMarvel

class DetailCharacterPresenterTest: XCTestCase {
    
    var detailCharactersPresenter: DetailCharacterPresenterProtocolOutput! = DetailCharacterPresenter()
    var listDetailComic: [ResultComic]! = []
    var listSeries: [ResultSeries]! = []
    var providerMock: DetailCharacterProviderProtocol! = DetailCharactersProviderMock()
    var error: NSError?
    
    override func setUp() {
        self.detailCharactersPresenter = DetailCharacterPresenter()
        self.listDetailComic = [ResultComic]()
        self.providerMock = DetailCharactersProviderMock()
        DetailCharactersProviderMock.mockErrorInFetchListaCharatersResponse = false
    }
    
    override func tearDown() {
        self.detailCharactersPresenter = nil
        self.listDetailComic = nil
        self.providerMock = nil
        self.error = nil
    }
    
    func test_loadDetail_success() {
        let expect = expectation(description: "waiting")
        self.listDetailComic = nil
        self.providerMock.fetchDetailCharacter(id: "\(48888)") { [weak self] (result)in
            guard self != nil else { return }
            if let resultDes = result {
                XCTAssertNil(self?.listDetailComic)
                XCTAssertNotNil(resultDes)
                XCTAssertNotNil(resultDes.data)
                XCTAssertNotNil(resultDes.data?.results)
                self?.listDetailComic = resultDes.data?.results
                XCTAssertNotNil(self?.listDetailComic)
                XCTAssertGreaterThan((self?.listDetailComic.count)!, 0)
                expect.fulfill()
            }
        } failure: { (error) in
            XCTAssertNotNil(error)
            XCTAssertEqual(error, .init(httpClientError: HTTPClientError.ErrorType.internalServerError, backendError: BackendError.ErrorType.unknownError))
            expect.fulfill()
        }
        wait(for: [expect], timeout: 3)
    }
}

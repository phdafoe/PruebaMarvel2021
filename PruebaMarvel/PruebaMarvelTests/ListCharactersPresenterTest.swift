//
//  ListCharactersPresenterTest.swift
//  PruebaMarvelTests
//
//  Created by Andres Felipe Ocampo Eljaiek
//

import XCTest
@testable import PruebaMarvel

class ListCharactersPresenterTest: XCTestCase {
    
    var listCharacterPresenter: ListCharactersPresenterProtocolOutput! = ListCharactersPresenter()
    var listCharacters: [ResultCharacter]! = []
    var providerMock: ListCharactersProviderProtocol! = ListCharactersProviderMock()
    var error: NSError?
    
    override func setUp() {
        self.listCharacterPresenter = ListCharactersPresenter()
        self.listCharacters = [ResultCharacter]()
        self.providerMock = ListCharactersProviderMock()
        ListCharactersProviderMock.mockErrorInFetchListaCharatersResponse = false
    }
    
    override func tearDown() {
        self.listCharacterPresenter = nil
        self.listCharacters = nil
        self.providerMock = nil
        self.error = nil
    }

    func test_loadCharacters_success() {
        let expect = expectation(description: "waiting")
        self.listCharacters = nil
        self.providerMock.fetchListCharacters { [weak self] (result) in
            guard self != nil else { return }
            if let resultDes = result {
                XCTAssertNil(self?.listCharacters)
                XCTAssertNotNil(resultDes)
                XCTAssertNotNil(resultDes.data)
                XCTAssertNotNil(resultDes.data?.results)
                self?.listCharacters = resultDes.data?.results
                XCTAssertNotNil(self?.listCharacters)
                XCTAssertGreaterThan((self?.listCharacters.count)!, 0)
                expect.fulfill()
            }
        } failure: { (error) in
            XCTAssertNotNil(error)
            XCTAssertEqual(error, .init(httpClientError: HTTPClientError.ErrorType.internalServerError, backendError: BackendError.ErrorType.unknownError))
            expect.fulfill()
        }
        wait(for: [expect], timeout: 3)
    }
    
    func test_loadCharacters_fail() {
        ListCharactersProviderMock.mockErrorInFetchListaCharatersResponse = false
        let expect = expectation(description: "waiting")
        self.listCharacters = nil
        self.providerMock.fetchListCharacters { [weak self] (result) in
            guard self != nil else { return }
            if let resultDes = result {
                XCTFail("Expect success got \(resultDes) instead")
                expect.fulfill()
            }
        } failure: { (error) in
            XCTAssertNotNil(error)
            XCTAssertEqual(error, .init(httpClientError: HTTPClientError.ErrorType.internalServerError, backendError: BackendError.ErrorType.unknownError))
            expect.fulfill()
        }
        wait(for: [expect], timeout: 3)
    }
    
    
    func test_getNumberOfRowCell_Assert_is_never_nil() {
        let rowCell: Int = self.listCharacterPresenter.getNumberOfRowCell()!
        XCTAssertNotNil(rowCell)
    }
    
    func test_getNumberOfRowCell_Assert() {
        let expect = expectation(description: "waiting")
        self.listCharacters = nil
        self.providerMock.fetchListCharacters { [weak self] (result) in
            guard self != nil else { return }
            if let resultDes = result {
                XCTAssertNil(self?.listCharacters)
                XCTAssertNotNil(resultDes)
                XCTAssertNotNil(resultDes.data)
                XCTAssertNotNil(resultDes.data?.results)
                self?.listCharacters = resultDes.data?.results
                XCTAssertNotNil(self?.listCharacters)
                XCTAssertGreaterThan((self?.listCharacters.count)!, 0)
                expect.fulfill()
            }
        } failure: { (error) in
            XCTAssertNotNil(error)
            XCTAssertEqual(error, .init(httpClientError: HTTPClientError.ErrorType.internalServerError, backendError: BackendError.ErrorType.unknownError))
            expect.fulfill()
        }
        wait(for: [expect], timeout: 3)
    }
    
    func test_getModelDataCell() {
        
    }
    

}

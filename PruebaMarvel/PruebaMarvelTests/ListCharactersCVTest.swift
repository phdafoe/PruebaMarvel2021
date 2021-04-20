//
//  ListCharactersCVTest.swift
//  PruebaMarvelTests
//
//  Created by Andres Felipe Ocampo Eljaiek
//

import XCTest
@testable import PruebaMarvel


class ListCharactersCVTest: XCTestCase {
    
    var listChaartersVC: BaseViewController<ListCharactersPresenterProtocolOutput>!
    var presenter: ListPresenterMock! = ListPresenterMock()

    override func setUp() {
        self.listChaartersVC = ListCharactersAssembly.buildViewController()
        self.presenter = ListPresenterMock()
    }

    override func tearDown() {
        self.listChaartersVC = nil
        self.presenter = nil
    }
    
    func test_listCharactersViewController_success_presenter_mock() {
        
        self.listChaartersVC.presenter = nil
        XCTAssertNil(self.listChaartersVC.presenter)
        
        self.listChaartersVC.presenter = self.presenter
        XCTAssertNotNil(self.listChaartersVC.presenter)
        
    }
    
    func test_listCharactersViewController_viewDidLoad_call() {
        self.listChaartersVC.presenter = self.presenter
        XCTAssertEqual(self.presenter.count, 0)
        self.listChaartersVC.beginAppearanceTransition(true, animated: false)
        XCTAssertEqual(self.presenter.count, 1)
        XCTAssertTrue(self.presenter.isWasCalled)
        self.listChaartersVC.endAppearanceTransition()
    }
    
    
}

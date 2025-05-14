//
//  SearchFlowUITests.swift
//  Coolblue-IOS-demo
//
//  Created by Talha Öz on 14/05/2025.
//


import XCTest

final class SearchFlowUITests: XCTestCase {

    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testSearchView_isVisibleOnLaunch() {
        let app = XCUIApplication()
        app.launch()
        
        let title = app.navigationBars["Coolblue"]
        XCTAssertTrue(title.waitForExistence(timeout: 2), "Coolblue title not visible")

        let searchField = app.searchFields.firstMatch
        XCTAssertTrue(searchField.waitForExistence(timeout: 3), "Search bar not visible")
    }

    func test_searchForProduct_displaysResults() {

        let searchField = app.searchFields.firstMatch
        XCTAssertTrue(searchField.waitForExistence(timeout: 2))
        searchField.tap()
        searchField.typeText("iphone")

        // Tap search
        app.keyboards.buttons["Search"].tap()
//
//        let product = app.staticTexts["ProductName-1"]
//        XCTAssertTrue(product.waitForExistence(timeout: 5))
    }
}

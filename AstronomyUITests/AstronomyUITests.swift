//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Alexander Supe on 21.02.20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testSavingPhoto() {
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        app.buttons["PhotoDetailViewController.SaveButton"].tap()
        XCTAssertTrue(app.staticTexts["Photo Saved!"].exists)
    }
    
    func testChangingSol() {
        app.buttons.element(boundBy: 1).tap()
        XCTAssertTrue(XCUIApplication().navigationBars["Sol 16"].exists)
    }
    
    func testImageLoadingWhenScrolling() {
        app.swipeUp()
        app.swipeUp()
        XCTAssertFalse(app.cells.element(boundBy: 0).images.element(boundBy: 0) == app.cells.element(boundBy: 1).images.element(boundBy: 0))
    }
    
    func testDetailImages() {
        app.cells.element(boundBy: 0).tap()
        let first = app.images.element(boundBy: 0)
        app.buttons.element(boundBy: 0).tap()
        app.cells.element(boundBy: 1).tap()
        XCTAssertFalse(first == app.images.element(boundBy: 0))
    }
}

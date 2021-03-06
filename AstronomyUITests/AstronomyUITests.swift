//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Lambda_School_Loaner_268 on 3/19/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    let app = XCUIApplication()

    private var SaveButton: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.SaveButton"]
    
    }
    
    private var detailLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.SolDetailLabel"]
    }
    
    private var detailImageView: XCUIElement {
        return app.images["PhotoDetailViewController.ImageView"]
    }
    
    private var solDescription: XCUIElement?
    
    override func setUp() {
        
        app.launchArguments = ["UITesting"]
        solDescription = detailLabel
        app.launch()

        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSavePhoto() {
        // UI tests must launch the application that they test.
        
            let app = XCUIApplication()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        XCTAssert(app.buttons["PhotoDetailViewController.SaveButton"].isHittable)
        app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].isHittable)
        
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testViewNextSol() {
        XCUIApplication().navigationBars["Sol 15"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(solDescription != detailLabel)
        
    }
    
    func testViewPreviousSol() {
        XCUIApplication().navigationBars["Sol 15"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(solDescription != detailLabel)
                
    }
    
    func testCellHasImage() {
        XCUIApplication().collectionViews.children(matching: .cell).element(boundBy: 0).otherElements.containing(.image, identifier:"PhotoCollectionViewController.ImageView").element.tap()
            
        XCTAssert(detailImageView.exists)
        
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}

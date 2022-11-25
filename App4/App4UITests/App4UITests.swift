//
//  App4UITests.swift
//  App4UITests
//
//  Created by Adil Hussain on 25/11/2022.
//

import XCTest

final class App4UITests: XCTestCase {

    private var application: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        application = XCUIApplication()
    }

    func test_state_of_views_when_app_is_launched() throws {
        // When.
        application.launch()
        
        // Then.
        XCTAssertTrue(application.otherElements["RatingView"].exists)
        
        XCTAssertFalse(application.buttons["StarButton1"].isSelected)
        XCTAssertFalse(application.buttons["StarButton2"].isSelected)
        XCTAssertTrue(application.buttons["StarButton3"].isSelected)
        XCTAssertFalse(application.buttons["StarButton4"].isSelected)
        XCTAssertFalse(application.buttons["StarButton5"].isSelected)
        
        XCTAssertEqual("Your rating is 3", application.staticTexts["RatingText"].label)
    }
    
    func test_state_of_views_when_rating_changed() throws {
        // Given.
        application.launch()
        
        // When.
        application.buttons["StarButton4"].tap()
        
        // Then.
        
        XCTAssertFalse(application.buttons["StarButton1"].isSelected)
        XCTAssertFalse(application.buttons["StarButton2"].isSelected)
        XCTAssertFalse(application.buttons["StarButton3"].isSelected)
        XCTAssertTrue(application.buttons["StarButton4"].isSelected)
        XCTAssertFalse(application.buttons["StarButton5"].isSelected)
        
        XCTAssertEqual("Your rating is 4", application.staticTexts["RatingText"].label)
    }
}

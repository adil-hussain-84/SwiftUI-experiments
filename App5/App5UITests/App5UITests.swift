//
//  App5UITests.swift
//  App5UITests
//
//  Created by Adil Hussain on 21/01/2022.
//

import XCTest

class App5UITests: XCTestCase {
    
    var application: XCUIApplication!
    
    override func setUpWithError() throws {
        application = XCUIApplication()
        continueAfterFailure = false
    }
    
    // This test assumes that the device's Region is set to "United States"
    func test_date_picker() {
        // 1. Launch the app with an argument that fakes the current date in the app
        let date = Date.from(year: 2022, month: 1, day: 15, hour: 12, minute: 0)
        
        application.launchEnvironment["FakeDate"] = ISO8601DateFormatter().string(from: date)
        application.launch()
        
        // 2. Assert that the title text is at the foreground
        XCTAssertTrue(application.staticTexts["ContentViewTitleText"].isHittable)
        
        // 3. Show the DatePicker popup
        application.datePickers["DatePicker"].tap()
        
        // 4. Assert that the title text is no longer at the foreground
        XCTAssertFalse(application.staticTexts["ContentViewTitleText"].isHittable)
        
        // 5. Change the selected date
        application.datePickers.collectionViews.buttons["Friday, January 14"].tap()
        
        // 6. Dismiss the DatePicker popup
        application.datePickers["DatePicker"].tap()
        
        // 7. Assert that the title text is at the foreground again
        XCTAssertTrue(application.staticTexts["ContentViewTitleText"].isHittable)
        
        // 8. Assert that the text displayed in the DatePicker corresponds to the selected date
        // TODO
    }
    
    func test_tapping_date_picker_with_ui_test_recorder() {
        application.launch()
        
        // 1. Tap the "Record UI Test" button in Xcode
        // 2. Tap the DatePicker on the device (simulator or real device) to reveal the DatePicker popup
        // 3. Marvel at one of the following two error messages which Xcode will pop up instead:
        // 3a. "Timestamp Event Matching Error: Failed to find matching element"
        // 3b. "Lost recording connection with device"
        
        
    }
}

extension Date {
    
    static func from(year: Int,
                     month: Int,
                     day: Int,
                     hour: Int,
                     minute: Int) -> Date {

        let dateComponents = DateComponents(
            year: year,
            month: month,
            day: day,
            hour: hour,
            minute: minute
        )
        
        return Calendar(identifier: .gregorian).date(from: dateComponents)!
    }
}

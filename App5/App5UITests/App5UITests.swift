//
//  App5UITests.swift
//  App5UITests
//
//  Created by Adil Hussain on 21/01/2022.
//

import XCTest

final class App5UITests: XCTestCase {
    
    private var application: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        application = XCUIApplication()
    }
    
    /// This test function taps on a ``DatePicker`` to reveal the calendar-style popup,
    /// chooses a date in the popup and then dismisses the popup by force tapping on the ``DatePicker``.
    ///
    /// This test assumes that the device's Region is set to "United States".
    func test_date_picker_1() {
        // 1. Launch the app with an argument that fakes the current date in the app
        let date = Date.from(year: 2022, month: 11, day: 26, hour: 12, minute: 0)
        
        application.launchEnvironment["FakeDate"] = ISO8601DateFormatter().string(from: date)
        application.launch()
        
        let titleText = application.staticTexts["TitleText"]
        let datePicker = application.datePickers["DatePicker"]
        let datePickerButton = datePicker.buttons["Date Picker"]
        let datePickerCollectionViewsQuery = application.datePickers.collectionViews
        
        // 2. Assert that the title text is at the foreground
        XCTAssertTrue(titleText.isHittable)
        
        // 3. Show the DatePicker popup
        datePicker.tap()
        
        // 4. Assert that the title text is no longer at the foreground
        XCTAssertFalse(titleText.isHittable)
        
        // 5. Change the selected date
        datePickerCollectionViewsQuery.buttons["Friday, 25 November"].tap()
        
        // 6. Dismiss the DatePicker popup
        datePicker.forceTap()
        
        // 7. Assert that the title text is at the foreground again
        XCTAssertTrue(titleText.isHittable)
        
        // 8. Assert that the text displayed in the DatePicker corresponds to the selected date
        XCTAssertEqual(datePickerButton.value as? String, "25 Nov 2022")
    }
    
    /// This test function taps on a ``DatePicker`` to reveal the calendar-style popup,
    /// chooses a date in the popup and then dismisses the popup by tapping on the `"PopoverDismissRegion"` button.
    ///
    /// This test assumes that the device's Region is set to "United States".
    func test_date_picker_2() {
        // 1. Launch the app with an argument that fakes the current date in the app
        let date = Date.from(year: 2022, month: 11, day: 26, hour: 12, minute: 0)
        
        application.launchEnvironment["FakeDate"] = ISO8601DateFormatter().string(from: date)
        application.launch()
        
        let titleText = application.staticTexts["TitleText"]
        let datePicker = application.datePickers["DatePicker"]
        let datePickerButton = datePicker.buttons["Date Picker"]
        let datePickerCollectionViewsQuery = application.datePickers.collectionViews
        
        // 2. Assert that the title text is at the foreground
        XCTAssertTrue(titleText.isHittable)
        
        // 3. Show the DatePicker popup
        datePicker.tap()
        
        // 4. Assert that the title text is no longer at the foreground
        XCTAssertFalse(titleText.isHittable)
        
        // 5. Change the selected date
        datePickerCollectionViewsQuery.buttons["Friday, 25 November"].tap()
        
        // 6. Dismiss the DatePicker popup
        application.buttons["PopoverDismissRegion"].tap()
        
        // 7. Assert that the title text is at the foreground again
        XCTAssertTrue(titleText.isHittable)
        
        // 8. Assert that the text displayed in the DatePicker corresponds to the selected date
        XCTAssertEqual(datePickerButton.value as? String, "25 Nov 2022")
    }
    
    /// This test function demonstrates that the Xcode UI Test Recorder falls over itself when a ``DatePicker`` is tapped.
    func test_tapping_date_picker_with_ui_test_recorder() {
        
        // 1. Place the cursor in this test function
        // 2. Tap the "Record UI Test" button in Xcode
        // 3. Tap the DatePicker on the device (simulator or real device) to reveal the DatePicker popup
        // 4. Marvel at one of the following two error messages which Xcode will pop up instead:
        // 4a. "Timestamp Event Matching Error: Failed to find matching element"
        // 4b. "Lost recording connection with device"
        
    }
}

extension XCUIElement {
    func forceTap() {
        if (isHittable) {
            tap()
        } else {
            let coordinate = coordinate(withNormalizedOffset: CGVector(dx:0.0, dy:0.0))
            coordinate.tap()
        }
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

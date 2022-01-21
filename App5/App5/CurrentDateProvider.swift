//
//  CurrentDateProvider.swift
//  App5
//
//  Created by Adil Hussain on 21/01/2022.
//

import Foundation

class CurrentDateProvider {
    
    static func get() -> Date {
        if let fakeDate = ProcessInfo.processInfo.environment["FakeDate"] {
            return ISO8601DateFormatter().date(from: fakeDate)!
        } else {
            return Date()
        }
    }
}

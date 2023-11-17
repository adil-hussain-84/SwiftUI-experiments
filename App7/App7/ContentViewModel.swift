//
//  ContentViewModel.swift
//  App7
//
//  Created by Adil Hussain on 17/11/2023.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    private let name: String
    
    init(name: String) {
        self.name = name
    }
    
    var greeting: String {
        "Hello \(name)"
    }
}

//
//  MyNumber.swift
//  App3
//
//  Created by Adil Hussain on 03/09/2021.
//

import Foundation

struct MyNumber: Identifiable, Hashable {

    let number: Int
    
    init(_ number: Int) {
        self.number = number
    }
    
    var id: Int {
        return number
    }
}

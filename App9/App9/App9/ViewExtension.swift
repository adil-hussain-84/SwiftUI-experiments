//
//  ViewExtension.swift
//  App9
//
//  Created by Adil Hussain on 04/01/2026.
//  Copyright © 2026 Tazkiya Tech. All rights reserved.
//

import SwiftUI

extension View {
    
    /// Hides this view conditionally.
    @ViewBuilder
    func hidden(_ shouldHide: Bool) -> some View {
        if shouldHide {
            self.hidden()
        } else {
            self
        }
    }
    
    /// Applies the `transform` function if `condition` is `true`.
    @ViewBuilder
    func `if`<Content: View>(
        _ condition: Bool,
        transform: (Self) -> Content,
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}


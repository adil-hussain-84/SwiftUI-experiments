//
//  DetailView.swift
//  App8
//
//  Created by Adil Hussain on 04/04/2025.
//

import SwiftUI

struct DetailView: View {
    
    private let title: String
    private let message: String
    private let onButtonTapped: () -> Void
    
    init(title: String,
         message: String,
         onButtonTapped: @escaping () -> Void) {
        self.title = title
        self.message = message
        self.onButtonTapped = onButtonTapped
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Text(title)
            Button {
                onButtonTapped()
            } label: {
                Text("Tap me to make a call\nto my parent view controller")
                    .multilineTextAlignment(.center)
            }
            Text("Swipe me down\nin portrait mode to dismiss.")
                .multilineTextAlignment(.center)
            Text(message)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    DetailView(
        title: "Title",
        message: "Message",
        onButtonTapped: {}
    )
}

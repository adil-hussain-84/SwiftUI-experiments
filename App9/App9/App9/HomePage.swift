//
//  HomePage.swift
//  App9
//
//  Created by Adil Hussain on 29/12/2025.
//

import SwiftUI

struct HomePage: View {
    
    let pageNumber: Int
    let headerText: String
    let footerText: String
    let focusedPageNumber: AccessibilityFocusState<Int?>.Binding
    let shouldShowPreviousPageButton: Bool
    let shouldShowNextPageButton: Bool
    let scrollToPreviousPage: (() -> Void)
    let scrollToNextPage: (() -> Void)
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0,
        ) {
            HStack {
                Button(action: { scrollToPreviousPage() }) {
                    Image(systemName: "chevron.left")
                }
                .buttonStyle(.plain)
                .disabled(!shouldShowPreviousPageButton)
                .hidden(!shouldShowPreviousPageButton)
                Spacer()
                Text(verbatim: headerText)
                    .accessibilityFocused(focusedPageNumber, equals: pageNumber)
                Spacer()
                Button(action: { scrollToNextPage() }) {
                    Image(systemName: "chevron.right")
                }
                .buttonStyle(.plain)
                .disabled(!shouldShowNextPageButton)
                .hidden(!shouldShowNextPageButton)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            Text(verbatim: "Some text")
                .padding()
            Spacer()
            Text(verbatim: footerText)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.secondarySystemBackground))
        }
    }
}

#Preview {
    @AccessibilityFocusState var focusedPageNumber: Int?
    
    HomePage(
        pageNumber: 1,
        headerText: "Header 1",
        footerText: "Footer 1",
        focusedPageNumber: $focusedPageNumber,
        shouldShowPreviousPageButton: true,
        shouldShowNextPageButton: true,
        scrollToPreviousPage: {},
        scrollToNextPage: {},
    )
}

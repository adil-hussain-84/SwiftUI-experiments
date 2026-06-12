//
//  Page.swift
//  App9
//
//  Created by Adil Hussain on 29/12/2025.
//

import SwiftUI

struct Page: View {
    
    let pageNumber: Int
    let headerText: String
    let footerText: String
    let safeAreaInsets: EdgeInsets
    let accessibilityFocusedPageNumber: AccessibilityFocusState<Int?>.Binding
    let shouldShowPreviousPageButton: Bool
    let shouldShowNextPageButton: Bool
    let scrollToPreviousPage: (() -> Void)
    let scrollToNextPage: (() -> Void)
    
    private let horizontalPadding: CGFloat = 16
    
    var body: some View {
        print("Page \(pageNumber)")
        
        return VStack(
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
                    .accessibilityAddTraits(.isHeader)
                    .accessibilityFocused(accessibilityFocusedPageNumber, equals: pageNumber)
                Spacer()
                Button(action: { scrollToNextPage() }) {
                    Image(systemName: "chevron.right")
                }
                .buttonStyle(.plain)
                .disabled(!shouldShowNextPageButton)
                .hidden(!shouldShowNextPageButton)
            }
            .padding(.vertical)
            .padding(.leading, max(safeAreaInsets.leading, horizontalPadding))
            .padding(.trailing, max(safeAreaInsets.trailing, horizontalPadding))
            .background(Color(.secondarySystemBackground))
            Text(verbatim: "Some text")
                .padding(.vertical)
                .padding(.leading, max(safeAreaInsets.leading, horizontalPadding))
                .padding(.trailing, max(safeAreaInsets.trailing, horizontalPadding))
            Spacer()
            Text(verbatim: footerText)
                .frame(maxWidth: .infinity)
                .padding(.top, 16)
                .padding(.bottom, max(safeAreaInsets.bottom, 16))
                .padding(.leading, max(safeAreaInsets.leading, horizontalPadding))
                .padding(.trailing, max(safeAreaInsets.trailing, horizontalPadding))
                .background(Color(.secondarySystemBackground))
        }
    }
}

#Preview {
    @AccessibilityFocusState var accessibilityFocusedPageNumber: Int?
    
    GeometryReader { geometryProxy in
        Page(
            pageNumber: 1,
            headerText: "Header 1",
            footerText: "Footer 1",
            safeAreaInsets: geometryProxy.safeAreaInsets,
            accessibilityFocusedPageNumber: $accessibilityFocusedPageNumber,
            shouldShowPreviousPageButton: true,
            shouldShowNextPageButton: true,
            scrollToPreviousPage: {},
            scrollToNextPage: {},
        )
    }
}

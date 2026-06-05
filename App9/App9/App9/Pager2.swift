//
//  Pager2.swift
//  App9
//
//  Created by Adil Hussain on 31/05/2026.
//

import SwiftUI

struct Pager2: View {

    private let totalPages = 5
    private let renderRadius = 1

    @State private var scrollPosition: ScrollPosition
    @State private var renderAnchor: Int
    @AccessibilityFocusState private var focusedPageNumber: Int?

    init() {
        let initial = 3
        _scrollPosition = State(initialValue: ScrollPosition(id: initial))
        _renderAnchor = State(initialValue: initial)
    }

    var body: some View {
        GeometryReader { geometryProxy in
            let safeAreaInsets = geometryProxy.safeAreaInsets
            let pageWidth = geometryProxy.size.width + safeAreaInsets.leading + safeAreaInsets.trailing
            let pageHeight = geometryProxy.size.height + safeAreaInsets.bottom

            if pageWidth > 0 {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(1...totalPages, id: \.self) { pageNumber in
                            Group {
                                if shouldRender(pageNumber) {
                                    Page(
                                        pageNumber: pageNumber,
                                        headerText: "Header \(pageNumber)",
                                        footerText: "Footer \(pageNumber)",
                                        safeAreaInsets: safeAreaInsets,
                                        focusedPageNumber: $focusedPageNumber,
                                        shouldShowPreviousPageButton: pageNumber > 1,
                                        shouldShowNextPageButton: pageNumber < totalPages,
                                        scrollToPreviousPage: { scrollToPage(pageNumber - 1) },
                                        scrollToNextPage: { scrollToPage(pageNumber + 1) },
                                    )
                                } else {
                                    Color.clear
                                }
                            }
                            .id(pageNumber)
                            .frame(width: pageWidth, height: pageHeight)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.paging)
                .scrollPosition($scrollPosition)
                .onChange(of: scrollPosition) { _, newValue in
                    print("onChange(of: \(scrollPosition))")
                    // Only advance the render anchor when the scroll view reports a real
                    // page id; ignore transient nils so the target page never unmounts.
                    if let id = newValue.viewID(type: Int.self) {
                        renderAnchor = id
                    }
                }
                .ignoresSafeArea(edges: [.bottom, .horizontal])
                .task(id: pageWidth) {
                    print("task(id: \(pageWidth))")
                    // Re-snap to the current page once the scroll view has a real width,
                    // and after rotations when the page width changes.
                    scrollPosition.scrollTo(id: renderAnchor)
                }
            }
        }
        .navigationTitle("Pager2")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func shouldRender(_ page: Int) -> Bool {
        return abs(page - renderAnchor) <= renderRadius
    }

    private func scrollToPage(_ page: Int) {
        withAnimation(.easeInOut) { scrollPosition.scrollTo(id: page) }
    }
}

#Preview {
    NavigationStack {
        Pager2()
    }
}

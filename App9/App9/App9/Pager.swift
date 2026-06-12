//
//  Pager.swift
//  App9
//
//  Created by Adil Hussain on 31/05/2026.
//

import SwiftUI

struct Pager: View {
    
    private let totalPages = 5
    
    /// Determines how many pages to render before and after the current page.
    private let renderRadius = 1
    
    @State private var scrollPosition: ScrollPosition
    @State private var currentPageNumber: Int
    @AccessibilityFocusState private var accessibilityFocusedPageNumber: Int?
    
    init() {
        let initial = 3
        _scrollPosition = State(initialValue: ScrollPosition(id: initial))
        _currentPageNumber = State(initialValue: initial)
    }
    
    var body: some View {
        GeometryReader { geometryProxy in body(for: geometryProxy) }
            .navigationTitle("Pager")
            .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    private func body(for geometryProxy: GeometryProxy) -> some View {
        let safeAreaInsets = geometryProxy.safeAreaInsets
        let pageWidth = geometryProxy.size.width + safeAreaInsets.leading + safeAreaInsets.trailing
        
        ScrollView(.horizontal, showsIndicators: false) {
            // Deliberately using HStack and not LazyHStack because LazyHStack has issues snapping
            // the current page fully into view on screen orientation from portrait to landscape
            HStack(spacing: 0) {
                ForEach(1...totalPages, id: \.self) { pageNumber in
                    Group {
                        if shouldRender(pageNumber) {
                            Page(
                                pageNumber: pageNumber,
                                headerText: "Header \(pageNumber)",
                                footerText: "Footer \(pageNumber)",
                                safeAreaInsets: safeAreaInsets,
                                accessibilityFocusedPageNumber: $accessibilityFocusedPageNumber,
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
                    .containerRelativeFrame(.horizontal)
                    .accessibilityHidden(pageNumber != currentPageNumber)
                }
            }
            .scrollTargetLayout()
        }
        .ignoresSafeArea(edges: [.bottom, .horizontal])
        .scrollTargetBehavior(.paging)
        .scrollPosition($scrollPosition)
        .onChange(of: scrollPosition) { _, newScrollPosition in
            guard let newPageNumber = newScrollPosition.viewID(type: Int.self) else { return }
            
            guard (currentPageNumber != newPageNumber) else { return }
            
            currentPageNumber = newPageNumber
        }
        .onChange(of: currentPageNumber) { _, newPageNumber in
            let scrollPositionPageNumber = scrollPosition.viewID(type: Int.self)
            
            guard (scrollPositionPageNumber != newPageNumber) else { return }
            
            withAnimation { scrollPosition.scrollTo(id: newPageNumber) }
            
            Task(priority: .userInitiated) {
                // Sleep briefly to allow the page change animation to complete
                try? await Task.sleep(for: .seconds(0.3))
                accessibilityFocusedPageNumber = newPageNumber
            }
        }
        .task(id: pageWidth) {
            // Sleep briefly to allow the initial screen load
            // or subsequent screen orientation change to complete
            try? await Task.sleep(for: .seconds(0.1))
            // Re-snap to the current page once the scroll view has a real width,
            // and after rotations when the page width changes.
            scrollPosition.scrollTo(id: currentPageNumber)
        }
    }
    
    /// Determines whether to render the given page number as a `Page` or simply as `Color.clear`.
    private func shouldRender(_ pageNumber: Int) -> Bool {
        return abs(pageNumber - currentPageNumber) <= renderRadius
    }
    
    /// Updates the ``currentPageNumber`` value.
    ///
    /// The page change scroll animation is taken care of by the
    /// `.onChange(of: currentPageNumber) { ... }` modifier on the `ScrollView`.
    private func scrollToPage(_ pageNumber: Int) {
        currentPageNumber = pageNumber
    }
}

#Preview {
    NavigationStack {
        Pager()
    }
}

//
//  Pager1.swift
//  App9
//
//  Created by Adil Hussain on 31/05/2026.
//

import SwiftUI

struct Pager1: View {
    
    private let totalPages = 5
    
    @State private var selectedPage: Int = 1
    @AccessibilityFocusState private var focusedPageNumber: Int?
    
    var body: some View {
        GeometryReader { geometryProxy in
            TabView(selection: $selectedPage) {
                ForEach(1...totalPages, id: \.self) { pageNumber in
                    Page(
                        pageNumber: pageNumber,
                        headerText: "Header \(pageNumber)",
                        footerText: "Footer \(pageNumber)",
                        safeAreaInsets: geometryProxy.safeAreaInsets,
                        focusedPageNumber: $focusedPageNumber,
                        shouldShowPreviousPageButton: pageNumber > 1,
                        shouldShowNextPageButton: pageNumber < totalPages,
                        scrollToPreviousPage: { scrollToPage(pageNumber - 1) },
                        scrollToNextPage: { scrollToPage(pageNumber + 1) },
                    )
                    .tag(pageNumber)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea(edges: [.bottom, .horizontal])
            .onChange(of: selectedPage) { oldValue, newValue in
                Task {
                    // A tiny delay is needed to allow the page change animation to complete
                    try? await Task.sleep(nanoseconds: 200_000_000)
                    focusedPageNumber = newValue
                }
            }
        }
        .navigationTitle("Pager1")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func scrollToPage(_ page: Int) {
        withAnimation(.easeInOut) { selectedPage = page }
    }
}

#Preview {
    NavigationStack {
        Pager1()
    }
}

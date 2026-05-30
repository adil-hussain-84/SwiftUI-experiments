//
//  HomeScreen.swift
//  App9
//
//  Created by Adil Hussain on 23/12/2025.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var selectedPage: Int = 1
    @AccessibilityFocusState private var focusedPageNumber: Int?
    
    var body: some View {
        TabView(selection: $selectedPage) {
            HomePage(
                pageNumber: 1,
                headerText: "Header 1",
                footerText: "Footer 1",
                focusedPageNumber: $focusedPageNumber,
                shouldShowPreviousPageButton: false,
                shouldShowNextPageButton: true,
                scrollToPreviousPage: {},
                scrollToNextPage: { scrollToPage(2) },
            )
            .tag(1)
            
            HomePage(
                pageNumber: 2,
                headerText: "Header 2",
                footerText: "Footer 2",
                focusedPageNumber: $focusedPageNumber,
                shouldShowPreviousPageButton: true,
                shouldShowNextPageButton: true,
                scrollToPreviousPage: { scrollToPage(1) },
                scrollToNextPage: { scrollToPage(3) },
            )
            .tag(2)
            
            HomePage(
                pageNumber: 3,
                headerText: "Header 3",
                footerText: "Footer 3",
                focusedPageNumber: $focusedPageNumber,
                shouldShowPreviousPageButton: true,
                shouldShowNextPageButton: false,
                scrollToPreviousPage: { scrollToPage(2) },
                scrollToNextPage: {},
            )
            .tag(3)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .tabViewStyle(.page(indexDisplayMode: .never))
        .ignoresSafeArea()
        .onChange(of: selectedPage) { oldValue, newValue in
            Task {
                // A tiny delay is needed to allow the page change animation to complete
                try? await Task.sleep(nanoseconds: 200_000_000)
                focusedPageNumber = newValue
            }
        }
    }
    
    private func scrollToPage(_ page: Int) {
        withAnimation(.easeInOut) {
            selectedPage = page
        }
    }
}

#Preview {
    NavigationStack {
        HomeScreen()
    }
}

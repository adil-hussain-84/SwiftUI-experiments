//
//  ContentView.swift
//  App5
//
//  Created by Adil Hussain on 21/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedDate = CurrentDateProvider.get()
    
    var body: some View {
        VStack {
            Text("Select a date")
                .font(.title)
                .accessibilityIdentifier("TitleText")
            DatePicker("Date Selected", selection: $selectedDate, displayedComponents: [.date])
                .accessibilityIdentifier("DatePicker")
                .datePickerStyle(.compact)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

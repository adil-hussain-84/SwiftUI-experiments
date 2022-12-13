//
//  ContentView.swift
//  App4
//
//  Created by Adil Hussain on 04/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rating: Int = 3
    
    var body: some View {
        VStack {
            Text("Enter your rating")
                .accessibilityAddTraits(.isHeader)
                .font(.headline)
            RatingView(rating: $rating)
                .accessibilityIdentifier("RatingView")
                .padding([.top, .bottom])
            Text(String("Your rating is \(rating)"))
                .accessibilityIdentifier("RatingText")
                .font(.body)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

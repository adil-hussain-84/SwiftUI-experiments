//
//  ContentView.swift
//  App4
//
//  Created by Adil Hussain on 04/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var rating: Int = 3
    
    var body: some View {
        VStack {
            Text("Enter your rating")
                .font(.headline)
            RatingView(rating: $rating)
                .padding([.top, .bottom])
            Text(String("Your rating is \(rating)"))
                .font(.body)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

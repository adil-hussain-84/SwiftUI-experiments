//
//  RatingView.swift
//  App4
//
//  Created by Adil Hussain on 04/11/2022.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { number in
                Image(systemName: getSystemSymbolImageNameForStar(number))
                    .imageScale(.large)
                    .onTapGesture { rating = number }
            }
        }
    }
    
    private func getSystemSymbolImageNameForStar(_ number: Int) -> String {
        if (number <= rating) {
            return "star.fill"
        } else {
            return "star"
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}

//
//  RatingView.swift
//  App4
//
//  Created by Adil Hussain on 04/11/2022.
//

import SwiftUI

struct RatingView: View {
    
    private let numberOfStars = 5
    
    @Binding private var rating: Int
    
    init(rating: Binding<Int>) {
        self._rating = rating
    }
    
    var body: some View {
        HStack {
            ForEach(1...numberOfStars, id: \.self) { number in
                Image(systemName: getImageNameForStar(number))
                    .accessibilityAddTraits(getAccessibilityTraitsToAddForStar(number))
                    .accessibilityHint(getAccessibilityHintForStar(number))
                    .accessibilityIdentifier("StarButton\(number)")
                    .accessibilityLabel(getAccessibilityLabelForStar(number))
                    .accessibilityRemoveTraits(.isImage)
                    .foregroundColor(.accentColor)
                    .imageScale(.large)
                    .onTapGesture { rating = number }
            }
        }.accessibilityElement(children: .contain)
    }
    
    private func getAccessibilityHintForStar(_ number: Int) -> String {
        if number != rating {
            return "Changes the rating"
        } else {
            return ""
        }
    }
    
    private func getAccessibilityLabelForStar(_ number: Int) -> String {
        return "Star \(number) of \(numberOfStars)"
    }
    
    private func getAccessibilityTraitsToAddForStar(_ number: Int) -> AccessibilityTraits {
        if (number == rating) {
            return [.isSelected, .isButton]
        } else {
            return [.isButton]
        }
    }
    
    private func getImageNameForStar(_ number: Int) -> String {
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

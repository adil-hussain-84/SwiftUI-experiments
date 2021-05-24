//
//  DetailView.swift
//  App1
//
//  Created by Adil Hussain on 21/05/2021.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Hello, World!")
            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationTitle("Detail")
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

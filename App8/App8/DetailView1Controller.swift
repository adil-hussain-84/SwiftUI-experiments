//
//  DetailView1Controller.swift
//  App8
//
//  Created by Adil Hussain on 04/04/2025.
//

import SwiftUI
import UIKit

/// This `UIViewController` represents the incorrect way to create a reference from a SwiftUI view to its parent view controller.
class DetailView1Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let accountView = DetailView(
            title: "DetailView with strong reference to parent",
            message: "When I am dismissed,\nI will stick around in memory.",
            onButtonTapped: { self.onButtonTapped() } // the strong reference to 'self' in the closure is the problem
        )
        let hostingController = UIHostingController(rootView: accountView)
        
        addChild(hostingController, boundTo: view)
    }
    
    private func onButtonTapped() {
        print("Button tapped")
    }
    
    deinit {
        print("DetailView1Controller.deinit")
    }
}

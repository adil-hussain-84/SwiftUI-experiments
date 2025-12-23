//
//  DetailView2Controller.swift
//  App8
//
//  Created by Adil Hussain on 04/04/2025.
//

import SwiftUI
import UIKit

/// This `UIViewController` represents the correct way to create a reference from a SwiftUI view to its parent view controller.
class DetailView2Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let accountView = DetailView(
            title: "DetailView with weak reference to parent",
            message: "When I am dismissed,\nI will disappear from memory.",
            onButtonTapped: { [weak self] in self?.onButtonTapped() } // the weak reference to 'self' prevents a reference cycle
        )
        let hostingController = UIHostingController(rootView: accountView)
        
        addChild(hostingController, boundTo: view)
    }
    
    private func onButtonTapped() {
        print("Button tapped")
    }
    
    deinit {
        print("DetailView2Controller.deinit")
    }
}

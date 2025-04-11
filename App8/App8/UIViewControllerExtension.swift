//
//  UIViewControllerExtension.swift
//  App8
//
//  Created by Adil Hussain on 04/04/2025.
//

import UIKit

extension UIViewController {
    
    /// Adds `viewController` as a child of this `UIViewController`
    /// and binds the top, bottom, trailing and leading anchors of `viewController`
    /// to the top, bottom, trailing and leading anchors of `view`.
    ///
    /// - Precondition: `view` is a subview of this `UIViewController`.
    ///
    /// - Parameters:
    ///   - viewController: The `UIViewController` that is to be added to this `UIViewController`.
    ///   - view: The `UIView` to which `viewController`'s anchors will be bound.
    func addChild(_ viewController: UIViewController, boundTo view: UIView) {
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            viewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

//
//  ViewController.swift
//  App2
//
//  Created by Adil Hussain on 24/05/2021.
//

import SwiftUI
import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
    }
    
    @IBAction func pushDetailViewButtonTapped(_ sender: Any) {
        let targetHistoryView = DetailView()
        let hostingController = UIHostingController(rootView: targetHistoryView)
        
        navigationController?.pushViewController(hostingController, animated: true)
    }
    
    @IBAction func presentDetailViewButtonTapped(_ sender: Any) {
        let targetHistoryView = DetailSheetView()
        let hostingController = UIHostingController(rootView: targetHistoryView)
        
        present(hostingController, animated: true, completion: nil)
    }
}

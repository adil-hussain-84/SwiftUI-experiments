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
        let detailView = DetailView()
        let hostingController = UIHostingController(rootView: detailView)
        
        navigationController?.pushViewController(hostingController, animated: true)
    }
    
    @IBAction func presentDetailViewButtonTapped(_ sender: Any) {
        let detailSheetView = DetailSheetView()
        let hostingController = UIHostingController(rootView: detailSheetView)
        
        present(hostingController, animated: true, completion: nil)
    }
}

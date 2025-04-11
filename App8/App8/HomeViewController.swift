//
//  HomeViewController.swift
//  App8
//
//  Created by Adil Hussain on 04/04/2025.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var presentDetailView1Button: UIButton!
    @IBOutlet weak var presentDetailView2Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentDetailView1Button.setTitle("Present DetailView\nwith strong reference to parent", for: [])
        presentDetailView2Button.setTitle("Present DetailView\nwith weak reference to parent", for: [])
        
        presentDetailView1Button.titleLabel?.textAlignment = .center
        presentDetailView2Button.titleLabel?.textAlignment = .center
    }
    
    @IBAction func presentDetailView1Tapped(_ sender: Any) {
        present(DetailView1Controller(), animated: true, completion: nil)
    }
    
    @IBAction func presentDetailView2Tapped(_ sender: Any) {
        present(DetailView2Controller(), animated: true, completion: nil)
    }
}

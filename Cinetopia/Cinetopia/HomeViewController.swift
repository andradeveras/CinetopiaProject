//
//  ViewController.swift
//  Cinetopia
//
//  Created by Leonardo de Andrade Veras on 05/07/24.
//

import UIKit

class HomeViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        let label = UILabel()
        label.text = "Hello World"
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        // Do any additional setup after loading the view.
        
        view.addSubview(label)
    }


}

 

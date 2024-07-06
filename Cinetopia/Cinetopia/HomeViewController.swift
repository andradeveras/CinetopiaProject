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
        addSubViews()
        setupConstraints()
        
    }

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Filmes Populares"
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        
        return label
    }()
    
    private func addSubViews(){
        view.addSubview(label)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32)
        ])
    }
}

 

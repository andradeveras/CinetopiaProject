//
//  ViewController.swift
//  Cinetopia
//
//  Created by Leonardo de Andrade Veras on 05/07/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.logo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var coupleImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.couple)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true //Mantem a qualidade da imagem em diferentes telas
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var WelcomeLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "O lugar ideal para buscar, salvar e organizar seus filmes favoritos!"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .accent
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var welcomeButtom: UIButton = {
        let buttom = UIButton()
        buttom.translatesAutoresizingMaskIntoConstraints = false
        buttom.setTitle("Quero começar!", for: .normal)
        buttom.backgroundColor = .buttonBackground
        buttom.setTitleColor(.background, for: .normal)
        buttom.titleLabel?.font = .boldSystemFont(ofSize: 20)
        buttom.layer.cornerRadius = 32
        buttom.addTarget(self, action: #selector(buttonPressed), for:
                .touchUpInside)

        return buttom
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: 
                                        [logoImageView, coupleImageView, WelcomeLabel, welcomeButtom])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical //Coloca para o eixo vertical
        stackView.spacing = 32
        stackView.alignment = .center
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        addSubViews()
        setupConstraints()
        
        
    }
    
    @objc private func buttonPressed(){
        print("Botao pressionado")
        navigationController?.pushViewController(MoviesViewController(), animated: true)
    }
    
    private func addSubViews(){
        view.addSubview(stackView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -64),
            welcomeButtom.heightAnchor.constraint(equalToConstant: 64),
            welcomeButtom.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 64),
            welcomeButtom.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -64)
            
            
            /*logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            logoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            coupleImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 32),
            coupleImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            WelcomeLabel.topAnchor.constraint(equalTo: coupleImageView.bottomAnchor, constant: 32),
            WelcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            WelcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            WelcomeLabel.centerXAnchor.constraint(equalTo: coupleImageView.safeAreaLayoutGuide.centerXAnchor),
            
            welcomeButtom.topAnchor.constraint(equalTo: WelcomeLabel.bottomAnchor,constant: 32),
            welcomeButtom.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 64),
            welcomeButtom.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -64),
            welcomeButtom.heightAnchor.constraint(equalToConstant: 64)*/
        ])
        
    }
}

 

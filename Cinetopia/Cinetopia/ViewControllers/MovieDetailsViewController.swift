//
//  MovieDetailsViewController.swift
//  Cinetopia
//
//  Created by Leonardo de Andrade Veras on 10/07/24.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var showMovieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.title
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 45, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var showMoviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: movie.image)
        imageView.layer.cornerRadius = 32
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    private lazy var userRatingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Classificação dos usuários: \(movie.rate)"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        
        return label
        }()
    
    private lazy var synopsisLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white.withAlphaComponent(0.75)
        label.textAlignment = .center
        label.text = movie.synopsis
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        addSubViews()
        setupConstraints()
        // Do any additional setup after loading the view.
        
    }
    
    private func addSubViews(){
        view.addSubview(showMovieTitleLabel)
        view.addSubview(showMoviePosterImageView)
        view.addSubview(userRatingLabel)
        view.addSubview(synopsisLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            showMovieTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            showMovieTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            showMovieTitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            showMoviePosterImageView.topAnchor.constraint(equalTo: showMovieTitleLabel.bottomAnchor, constant: 32),
            showMoviePosterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showMoviePosterImageView.heightAnchor.constraint(equalToConstant: 264),
            showMoviePosterImageView.widthAnchor.constraint(equalToConstant: 192),
            
            userRatingLabel.topAnchor.constraint(equalTo: showMoviePosterImageView.bottomAnchor, constant: 32.0),
            userRatingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            synopsisLabel.topAnchor.constraint(equalTo: userRatingLabel.bottomAnchor, constant: 32.0),
            synopsisLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            synopsisLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
            
        ])
    }
    
    
   

        // Configure the view for the selected state
    }

    



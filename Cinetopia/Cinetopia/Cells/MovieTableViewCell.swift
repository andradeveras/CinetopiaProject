//
//  MovieTableViewCell.swift
//  Cinetopia
//
//  Created by Leonardo de Andrade Veras on 10/07/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    private lazy var movieTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Avatar"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var movieReleaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Lançamento: 10/02/2020"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white.withAlphaComponent(0.5)
        
        return label
    }()
    
    
    func congifureCell(movie: Movie){
        movieTitleLabel.text = movie.title
        //moviePosterImageView.image = UIImage(named: movie.image)
        if let imageUrl = URL(string: movie.image) {
                URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
                    if let error = error {
                        print("Erro ao carregar a imagem: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let data = data else {
                        print("Dados da imagem estão vazios.")
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self.moviePosterImageView.image = UIImage(data: data)
                    }
                }.resume()
            } else {
                print("URL da imagem inválida: \(movie.image)")
                // Você pode definir uma imagem padrão aqui se a URL for inválida
                self.moviePosterImageView.image = UIImage(named: "default_movie_poster")
            }
        movieReleaseDateLabel.text = "Lançamento: \(movie.releaseDate)"
        
    }
    
    private func addSubviews() {
        addSubview(moviePosterImageView)
        addSubview(movieTitleLabel)
        addSubview(movieReleaseDateLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            moviePosterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            moviePosterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            moviePosterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 100),// Ajuste a largura conforme necessário
            moviePosterImageView.heightAnchor.constraint(equalToConstant: 150), // Altura proporcional à largura

            
            movieTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -16),
            movieTitleLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 16),
            movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            movieReleaseDateLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 8),
            movieReleaseDateLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 16)
            
            
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        backgroundColor = .background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


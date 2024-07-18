//
//  MoviesViewController.swift
//  Cinetopia
//
//  Created by Leonardo de Andrade Veras on 07/07/24.
//

import UIKit

class MoviesViewController: UIViewController {
    
    private var filteredMovies: [Movie] = []
    private var isSearchActive: Bool = false
    private let movieService: MovieService = MovieService()
    private var movies: [Movie] = []
    
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self //O self representa a class moviesViewController, sendo a fonte de dados para a tabela
        tableView.delegate = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "movieCell")
        return tableView
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = true
        searchBar.placeholder = "Search"
        //searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.textColor = .white
        searchBar.delegate = self
        
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        setupNavigationBar()
        addSubViews()
        setupConstraints()
        fetchMovies()
        
    }
    
    private func setupNavigationBar(){
        title = "Filmes populares"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        
        navigationItem.setHidesBackButton(true, animated: true)//remove back button
        navigationItem.titleView = searchBar
    }
    
    private func fetchMovies() {
        //Vamos chamar a funcao getMovies do MovieService quando ela estiver pronta
         movieService.getmovies { movies in
            guard let movies else {
                return
            }
             DispatchQueue.main.async {
                 self.movies = movies
                 self.tableView.reloadData()
             }
            
        }
    }
    
    private func addSubViews(){
        view.addSubview(tableView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MoviesViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearchActive ? filteredMovies.count : movies.count
    }//Retorna a Quantidade de linhas que a tabela terá...
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         if let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell {
             let movie = isSearchActive ? filteredMovies[indexPath.row] : movies[indexPath.row]
             cell.congifureCell(movie: movie)
             cell.selectionStyle = .none
             return cell
         }

            

//cell.textLabel?.text = names[indexPath.row]
// var configuration = cell.defaultContentConfiguration()
//         configuration.text = movies[indexPath.row].title
//         configuration.textProperties.color = .white
//         cell.contentConfiguration = configuration
//         cell.backgroundColor = .clear
         
         
        return UITableViewCell()
    }// Retona as celulas da tabela criada
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movie = isSearchActive ? filteredMovies[indexPath.row] : movies[indexPath.row]
        let detailsVC = MovieDetailsViewController(movie: movie)
        navigationController?.pushViewController(detailsVC, animated: true)
        
    }
}

extension MoviesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearchActive = false
        } else {
            isSearchActive = true
            filteredMovies = movies.filter({ Movie in
                Movie.title.lowercased().contains(searchText.lowercased())
            })
        }
        tableView.reloadData()
    }
}

//
//  MoviesViewController.swift
//  Cinetopia
//
//  Created by Leonardo de Andrade Veras on 07/07/24.
//

import UIKit

class MoviesViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self //O self representa a class moviesViewController, sendo a fonte de dados para a tabela
        tableView.delegate = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "movieCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        setupNavigationBar()
        addSubViews()
        setupConstraints()
        
    }
    
    private func setupNavigationBar(){
        title = "Filmes populares"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        
        navigationItem.setHidesBackButton(true, animated: true)//remove back button
    }
    
    private func addSubViews(){
        view.addSubview(tableView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
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
        return movies.count
    }//Retorna a Quantidade de linhas que a tabela terá...
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         if let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell {
             cell.congifureCell(movie: movies[indexPath.row])
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
        let detailsVC = MovieDetailsViewController(movie: movies[indexPath.row])
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

//
//  MoviesViewController.swift
//  Cinetopia
//
//  Created by Leonardo de Andrade Veras on 07/07/24.
//

import UIKit

class MoviesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        setupNavigationBar()
        
    }
    
    private func setupNavigationBar(){
        title = "Filmes populares"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        
        navigationItem.setHidesBackButton(true, animated: true)//remove back button
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

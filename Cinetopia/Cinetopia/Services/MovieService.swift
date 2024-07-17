//
//  MovieService.swift
//  Cinetopia
//
//  Created by Leonardo de Andrade Veras on 17/07/24.
//

import Foundation


struct MovieService {
    func getmovies() {
        let urlString = "http://localhost:3000/movies"
        guard let url = URL(string: urlString) else {
            // Desembrulha esta opicional, caso não tenho um valor correspondente ele sai da funcao
            return
        }
        
        //URLSession -> Esta classe nos permite fazer requisições de serviços externos
        /*Estamos desembrulhando as nossas variáveis. Primeiramente, estamos desembrulhando a nossa variável data, estamos verificando se há algo dentro dela.
        Em seguida, estamos realizando as seguintes ações: verificando se a nossa variável `response` é do tipo `HTTPURLResponse` e, ao mesmo tempo, estamos garantindo, por meio desta vírgula, que o nosso `statusCode` na resposta é `200`, indicando que tudo ocorreu conforme o esperado. Se não for o caso, isto é, em um cenário `else`, simplesmente vamos retornar e sair da nossa função.*/
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else {
                return
            }
            do {
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                print(movies)
            } catch(let error){
                print(error)
            }
            
        }
        
        task.resume()
    }
}

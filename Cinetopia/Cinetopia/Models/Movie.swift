//
//  Movie.swift
//  Cinetopia
//
//  Created by Leonardo de Andrade Veras on 10/07/24.
//

import Foundation

struct Movie {
    let id: Int
    let title: String
    let image: String
    let synopsis: String
    let rate: Double
    let releaseDate: String
}

let movies: [Movie] = [
    Movie(id: 1, title: "Avatar", image: "AvatarImage", synopsis: "No exuberante mundo alienígena de Pandora vivem os Na'vi, seres que parecem ser primitivos, mas são altamente evoluídos. Como o ambiente do planeta é tóxico, foram criados os avatares, corpos biológicos controlados pela mente humana que se movimentam livremente em Pandora. Jake Sully, um ex-fuzileiro naval paralítico, volta a andar através de um avatar e se apaixona por uma Na'vi. Esta paixão leva Jake a lutar pela sobrevivência de Pandora.", rate: 9.4, releaseDate: "18/12/2009"),
    Movie(id: 2, title: "Vingadores: Ultimato", image: "VingadoresUltimatoImage", synopsis: "Após Thanos eliminar metade das criaturas vivas, os Vingadores têm de lidar com a perda de amigos e entes queridos. Com Tony Stark vagando perdido no espaço sem água e comida, Steve Rogers e Natasha Romanov lideram a resistência contra o titã louco.", rate: 9.2, releaseDate: "25/04/2019"),
    Movie(id: 3, title: "Titanic", image: "TitanicImage", synopsis: "Um artista pobre e uma jovem rica se conhecem e se apaixonam na fatídica viagem inaugural do Titanic em 1912. Embora esteja noiva do arrogante herdeiro de uma siderúrgica, a jovem desafia sua família e amigos em busca do verdadeiro amor.", rate: 9.3, releaseDate: "16/06/1998")
]

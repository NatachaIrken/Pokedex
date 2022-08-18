//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 17-08-22.
//

import Foundation

class PokemonListViewModel {

    var refreshData = { () -> () in }

    var dataArray: [PokemonListResponse] = [] {
        didSet {
            refreshData()
        }
    }

//    func retriveDataList()  {
//
//        let BASE_URL = Endpoints.urlBase + Endpoints.endpoints.pokemonList
//
//        guard let url = URL(string: BASE_URL) else { return }
//
//    URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//        guard let json = data else { return }
//
//        do {
//            let decoder = JSONDecoder()
//            self.dataArray = try decoder.decode([PokemonListResponse].self, from: json)
//        } catch let error {
//            print("Ha ocurrido un error: \(error.localizedDescription)")
//        }
//
//        }.resume()
//
//    }
}

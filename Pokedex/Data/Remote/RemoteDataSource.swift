//
//  RemoteDataSource.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 17-08-22.
//

import Foundation


class RemoteDataSource: RemoteDataSourceProtocol {

    static let shared = RemoteDataSource()

    let BASE_URL = Endpoints.urlBase + Endpoints.endpoints.pokemonList
    //New Function
    func fetchPokemon(completion: @escaping ([PokemonListDTO]?) -> ()) {


        guard let url = URL(string: BASE_URL) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in

           guard let data = data else { return }

            if let safeData = data.parseData(deleteString: "null,") {
                do {
                    let decoder = JSONDecoder()
                    let dataArray = try decoder.decode([PokemonListDTO].self, from: safeData)
                    completion(dataArray)
                } catch let error {
                    completion(nil)
                    print("Ha ocurrido un error: \(error.localizedDescription)")
                }

            }

        }.resume()
    }
}



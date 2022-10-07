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

    func fetchPokemon(completion: @escaping (Result<[PokemonListDTO], PokemonError>) -> ()) {
        guard let url = URL(string: BASE_URL) else {
            return completion(.failure(.malformedUrl))
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                return completion(.failure(.apiError))
            }

            guard let data = data else {
                return completion(.failure(.emptyError))
            }

            if let safeData = data.parseData(deleteString: "null,") {
                do {
                    let decoder = JSONDecoder()
                    let dataArray = try decoder.decode([PokemonListDTO].self, from: safeData)
                    completion(.success(dataArray))
                } catch _ {
                    completion(.failure(.decodeError))
                }
            }
        }.resume()
    }
}

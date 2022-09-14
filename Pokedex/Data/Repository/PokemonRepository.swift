//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 18-08-22.
//

import Foundation

struct PokemonRepository: PokemonRepositoryProtocol {

    var dataSource: RemoteDataSourceProtocol
    
// siempre protocolo en el init
    init(dataSource: RemoteDataSourceProtocol) {
        self.dataSource = dataSource
    }

    func fetchPokemon(completion: @escaping ([PokemonListModel]?) -> ()) {

        dataSource.fetchPokemon(completion: { pokemonListDTO in
            let pokemonListModel = pokemonListDTO?.map { pokemonDTO in

                PokemonListModel(
                    attack: pokemonDTO.attack,
                    defense: pokemonDTO.defense,
                    description: pokemonDTO.description,
                    height: pokemonDTO.height,
                    id: pokemonDTO.id,
                    imageUrl: pokemonDTO.imageUrl,
                    name: pokemonDTO.name,
                    type: pokemonDTO.type,
                    weight: pokemonDTO.weight
                )
            }
            completion(pokemonListModel)
            print("REPOSITORY",pokemonListModel)
        })
    }
}


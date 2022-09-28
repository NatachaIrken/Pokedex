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

    func fetchPokemon(completion: @escaping ([PokemonModel]?) -> ()) {

        dataSource.fetchPokemon(completion: { pokemonListDTO in
            let pokemonListModel = pokemonListDTO?.map { pokemonDTO in

                PokemonModel(
                    attack: pokemonDTO.attack,
                    defense: pokemonDTO.defense,
                    description: pokemonDTO.description,
                    evolutionChain: pokemonDTO.evolutionChainDTO?.map { evolutionChainDTO in
                        return EvolutionChainModel(id: evolutionChainDTO.id, name: evolutionChainDTO.name)
                    },
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


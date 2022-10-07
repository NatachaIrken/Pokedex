//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 17-08-22.
//

import Foundation

protocol PokemonListViewModelProtocol  {

    var getPokemonCallback: (([PokemonModel]?) -> Void)? { get set }

    func getPokemon(completion: @escaping([PokemonModel]?) -> ())
}

class PokemonListViewModel: PokemonListViewModelProtocol {

    init(fetchPokemonUseCase: FetchPokemonUseCase) {
        self.fetchPokemonUseCase = DIContainer.fetchPokemonUseCase
    }

    func getPokemon(completion: @escaping ([PokemonModel]?) -> ()) {
        fetchPokemonUseCase.execute { pokemonList in
            if pokemonList != nil {
                completion(pokemonList)
            } else {
                completion([])
            }
        }
    }

    var getPokemonCallback: (([PokemonModel]?) -> Void)?

    var pokemonModel: [PokemonModel]?

    let fetchPokemonUseCase: FetchPokemonUseCase
}

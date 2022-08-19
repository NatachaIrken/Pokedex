//
//  FetchPokemonUseCase.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 18-08-22.
//

import Foundation


struct FetchPokemonUseCase {

    var pokemonRepository: PokemonRepositoryProtocol

    init(pokemonRepository: PokemonRepositoryProtocol) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute(completion: @escaping([PokemonListModel]?) -> ()) {
        pokemonRepository.fetchPokemon(completion: completion)
    }
}

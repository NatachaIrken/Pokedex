//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 17-08-22.
//

import Foundation

protocol PokemonListViewModelProtocol  {
    var getPokemonCallback: (([PokemonModel]?) -> Void)? { get set }
    func getPokemon(completion: @escaping(Result<[PokemonModel], PokemonError>) -> ())
}

class PokemonListViewModel: PokemonListViewModelProtocol {
    init(fetchPokemonUseCase: FetchPokemonUseCase) {
        self.fetchPokemonUseCase = DIContainer.fetchPokemonUseCase
    }
    
    func getPokemon(completion: @escaping (Result<[PokemonModel], PokemonError>) -> ()) {
        fetchPokemonUseCase.execute { result in
            switch result {
            case .success(let pokemonList):
                completion(.success(pokemonList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    var getPokemonCallback: (([PokemonModel]?) -> Void)?
    var pokemonModel: [PokemonModel]?
    let fetchPokemonUseCase: FetchPokemonUseCase
}

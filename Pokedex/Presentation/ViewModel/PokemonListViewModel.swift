//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 17-08-22.
//

import Foundation

protocol PokemonListViewModelProtocol  {

    var getPokemonCallback: (([PokemongitModel]?) -> Void)? { get set }

    func getPokemon(completion: @escaping([PokemonModel]?) -> ())
}

class PokemonListViewModel: PokemonListViewModelProtocol {

    func getPokemon(completion: @escaping ([PokemonModel]?) -> ()) {
        fetchPokemonUseCase.execute { pokemonList in
//            self.getPokemonCallback?(pokemonList)
            completion(pokemonList)
//            print(pokemonList)
        }
    }

    var getPokemonCallback: (([PokemonModel]?) -> Void)?

    var pokemonModel: [PokemonModel]?

    let fetchPokemonUseCase: FetchPokemonUseCase

    init(fetchPokemonUseCase: FetchPokemonUseCase) {
        self.fetchPokemonUseCase = fetchPokemonUseCase
    }
}


//infracestructura para que el view model tenga los casos de uso como dependencias para llamar al repositorio.
 // hacer protocol viewmodel, agregar la funcion necesaria


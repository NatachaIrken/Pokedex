//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 17-08-22.
//

import Foundation

protocol PokemonListViewModelProtocol  {

    var getPokemonCallback: (([PokemonListModel]?) -> Void)? { get set }

    func getPokemon()
}

class PokemonListViewModel: PokemonListViewModelProtocol {

    var getPokemonCallback: (([PokemonListModel]?) -> Void)?

    let fetchPokemonUseCase: FetchPokemonUseCase

    init(fetchPokemonUseCase: FetchPokemonUseCase) {
        self.fetchPokemonUseCase = fetchPokemonUseCase
    }

    func getPokemon() {
        fetchPokemonUseCase.execute { pokemonList in
            self.getPokemonCallback?(pokemonList)
        }
    }
}


//infracestructura para que el view model tenga los casos de uso como dependencias para llamar al repositorio.
 // hacer protocol viewmodel, agregar la funcion necesaria


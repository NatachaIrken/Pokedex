//
//  PokemolListProtocol.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 17-08-22.
//

import Foundation

protocol RemoteDataSourceProtocol {
    func fetchPokemon(completion:@escaping(Result<[PokemonListDTO], PokemonError>) -> ())
}


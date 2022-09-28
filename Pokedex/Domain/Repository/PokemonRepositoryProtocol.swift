//
//  PokemonRepositoryProtocol.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 18-08-22.
//

import Foundation


protocol PokemonRepositoryProtocol {

    // repo puerta entrada y salida datos desde el dominio
    func fetchPokemon(completion:@escaping([PokemonModel]?) -> ())
}

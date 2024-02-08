//
//  PokemonListModel.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 18-08-22.
//

import Foundation

struct PokemonModel: Identifiable {
    let attack: Int
    let defense: Int
    let description: String
    var evolutionChain: [EvolutionChainModel]?
    let height: Int
    let id: Int
    let imageUrl: String
    let name: String
    let type: String
    let weight: Int
}

struct EvolutionChainModel: Decodable {
    var id : String?
    var name: String?
    var imageUrl: String?
}

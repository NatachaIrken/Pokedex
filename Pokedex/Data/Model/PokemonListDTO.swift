//
//  PokemonListResponse.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 17-08-22.
//

import Foundation

struct PokemonListDTO: Decodable, Identifiable {
    let attack: Int
    let defense: Int
    let description: String
    let height: Int
    let id: Int
    let imageUrl: String
    let name: String
    let type: String
    let weight: Int
//    let evolutionChain: [EvolutionChain]?

    enum CodingKeys: String, CodingKey {
        case attack
        case defense
        case description
//        case evolutionChain
        case height
        case id
        case imageUrl
        case name
        case type
        case weight
    }
}

//struct EvolutionChain: Decodable {
//    var id : String?
//    var name: String?
//}

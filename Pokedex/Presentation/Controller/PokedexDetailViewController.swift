//
//  PokedexList+ViewController.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 21-09-22.
//

import Foundation
import UIKit

class PokedexDetailViewController: UIViewController {

    var pokeDescription = UILabel()
    var pokemonModel: PokemonListModel?

    override func viewDidLoad() {
        title = pokemonModel?.name
        view.backgroundColor = .white
        prepareLabel()
    }

    private func prepareLabel() {
        pokeDescription.translatesAutoresizingMaskIntoConstraints = false
        pokeDescription.text = pokemonModel?.description.capitalized
        pokeDescription.numberOfLines = 0
        view.addSubview(pokeDescription)
        NSLayoutConstraint.activate([
            pokeDescription.topAnchor.constraint(equalTo: view.topAnchor),
            pokeDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pokeDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pokeDescription.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


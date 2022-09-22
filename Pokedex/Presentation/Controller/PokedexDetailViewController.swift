//
//  PokedexList+ViewController.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 21-09-22.
//

import Foundation
import UIKit
import SDWebImage


class PokedexDetailViewController: UIViewController {

    var pokeDescription = UILabel()
    var pokeImage = SDAnimatedImageView()
    var pokemonModel: PokemonListModel?

    override func viewDidLoad() {
        title = pokemonModel?.name.capitalized
        view.backgroundColor = .white
        showImage()
        prepareLabel()
    }

    func showImage() {
        view.addSubview(pokeImage)
        view.addSubview(pokeDescription)
        let url = URL(string: pokemonModel?.imageUrl ?? "")
        pokeImage.translatesAutoresizingMaskIntoConstraints = false
        guard url != nil else { return }
        pokeImage.sd_setImage(with: url)
        pokeImage.contentMode = .scaleAspectFit

        NSLayoutConstraint.activate([
            pokeImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            pokeImage.heightAnchor.constraint(equalToConstant: 300),
            pokeImage.widthAnchor.constraint(equalToConstant: 300),
            pokeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokeImage.bottomAnchor.constraint(equalTo: pokeDescription.topAnchor, constant: 10)
        ])
    }

    func prepareLabel() {
        pokeDescription.translatesAutoresizingMaskIntoConstraints = false
        pokeDescription.text = pokemonModel?.description.capitalized
        pokeDescription.numberOfLines = 0

        NSLayoutConstraint.activate([
            pokeDescription.topAnchor.constraint(equalTo: pokeImage.bottomAnchor, constant: 10),
            pokeDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pokeDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pokeDescription.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200)
        ])
    }
}


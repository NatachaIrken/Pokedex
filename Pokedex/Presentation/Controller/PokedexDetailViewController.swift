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
    var pokemonModel: PokemonModel?
    let tableViewDetail = UITableView()
    var imagePokemonEvolutions = [String]()
    let containerImage = UIView()

    override func viewDidLoad() {
        title = pokemonModel?.name.capitalized
        view.backgroundColor = .white
        showImage()
        prepareLabel()
        configureTableViewDetail()
    }

    func showImage() {
        view.addSubview(pokeImage)
        view.addSubview(pokeDescription)
        let url = URL(string: pokemonModel?.imageUrl ?? "")
        pokeImage.translatesAutoresizingMaskIntoConstraints = false
        guard url != nil else { return }
        pokeImage.sd_setImage(with: url)
        pokeImage.contentMode = .scaleAspectFit

        pokeImage.backgroundColor = .lightText
        pokeImage.layer.cornerRadius = 15.0

        pokeImage.layer.shadowColor = UIColor.black.cgColor
        pokeImage.layer.shadowOpacity = 0.6
        pokeImage.layer.shadowOffset = .zero
        pokeImage.layer.shadowRadius = 25
        pokeImage.layer.shouldRasterize = true


        NSLayoutConstraint.activate([
            pokeImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            pokeImage.heightAnchor.constraint(equalToConstant: 300),
            pokeImage.widthAnchor.constraint(equalToConstant: 300),
            pokeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokeImage.bottomAnchor.constraint(equalTo: pokeDescription.topAnchor, constant: -10)
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
            //pokeDescription.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200)
        ])
    }

    func configureTableViewDetail() {
        view.addSubview(tableViewDetail)
        tableViewDetail.translatesAutoresizingMaskIntoConstraints = false
        tableViewDetail.dataSource = self
        tableViewDetail.delegate = self
        tableViewDetail.layer.cornerRadius = 15.0



        tableViewDetail.layer.shadowColor = UIColor.black.cgColor
        tableViewDetail.layer.shadowOpacity = 0.9
        tableViewDetail.layer.shadowOffset = .zero
        tableViewDetail.layer.shadowRadius = 30
        tableViewDetail.layer.shouldRasterize = true
        tableViewDetail.layer.borderWidth = 0.2
        tableViewDetail.layer.borderColor = UIColor.gray.cgColor

        NSLayoutConstraint.activate([
            tableViewDetail.topAnchor.constraint(equalTo: pokeDescription.bottomAnchor, constant: 10),
            tableViewDetail.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:  20),
            tableViewDetail.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableViewDetail.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -2)
        ])
    }
}

extension PokedexDetailViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemonModel?.evolutionChain?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = pokemonModel?.evolutionChain?[indexPath.row].name?.capitalized
        cell.detailTextLabel?.text = pokemonModel?.evolutionChain?[indexPath.row].id
        let url = URL(string: pokemonModel?.evolutionChain?[indexPath.row].imageUrl ?? "")
        cell.imageView as? SDAnimatedImageView
        cell.imageView?.sd_setImage(with: url)
        
        return cell

    }

}

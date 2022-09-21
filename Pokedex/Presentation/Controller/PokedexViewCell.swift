//
//  PokedexViewCell.swift
//  Pokedex
//
//  Created by Victoria Saldaña on 20-09-22.
//

import Foundation
import UIKit

class PokedexViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(detailLabel)
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(ImageView)
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

  /*  func prepareCell() {
        
        profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true profileImageView.widthAnchor.constraint(equalToConstant:70).isActive = true profileImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
    } */

    let profileImageView: UIImageView = {
             let image = UIImageView()
             image.contentMode = .scaleAspectFill
             image.translatesAutoresizingMaskIntoConstraints = false
             image.layer.cornerRadius = 35
             image.clipsToBounds = true
            return image
         }()

    let nameLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
    }()

    let detailLabel: UILabel = {
      let label = UILabel()
      label.font = UIFont.boldSystemFont(ofSize: 14)
      label.layer.cornerRadius = 5
      label.clipsToBounds = true
      label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()

    let containerView: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true
      return view
    }()

    let ImageView: UIImageView = {
         let pokeImag = UIImageView()
        pokeImag.contentMode = .scaleAspectFill
        pokeImag.translatesAutoresizingMaskIntoConstraints = false
        pokeImag.layer.cornerRadius = 13
        pokeImag.clipsToBounds = true
         return pokeImag
     }()
}

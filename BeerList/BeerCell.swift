//
//  BeerCell.swift
//  BeerList
//
//  Created by 류성두 on 2020/01/12.
//  Copyright © 2020 Sungdoo. All rights reserved.
//

import Foundation
import UIKit
import ModelKit
import SDRemoteImageView

class BeerCell: UITableViewCell {
    @IBOutlet private var beerImageView: SDRemoteImageView!
    @IBOutlet private var titleLabel: UILabel!

    func update(with beer:Beer) {
        titleLabel.text = beer.name
        guard let imageURL = beer.imageURL else { return }
        guard let url = URL(string: imageURL) else { return }
        beerImageView.loadImage(from: url)
    }

}

//
//  MovieSearchCell.swift
//  MovieBrowser
//
//  Created by jonathan thornburg on 3/12/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation
import UIKit

class MovieSearchCell: UITableViewCell {
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    
    func configureFor(_ viewModel: MovieCellViewModel) {
        releaseDateLabel.text = viewModel.dateText
        titleLabel.text = viewModel.titleText
        voteAverageLabel.text = viewModel.voteAverageText
    }
    
}

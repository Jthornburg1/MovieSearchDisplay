//
//  MovieDetailViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/26/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var detailViewModel: MovieDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewModel?.imageUpdatable = self
        configureUI()
        detailViewModel?.fetchImage()
    }
    
    private func configureUI() {
        titleLabel.text = detailViewModel?.titleText
        dateLabel.text = detailViewModel?.releaseDateText
        overviewLabel.text = detailViewModel?.overviewText
    }
    
}

/// It seemed like overkill for this exercise, but image-updating for this view would've be a good argument for a publisher-subscriber pattern.
extension MovieDetailViewController: ImageUpdatable {
    
    func upDate(image: UIImage) {
        imageView.image = image
    }
    
}

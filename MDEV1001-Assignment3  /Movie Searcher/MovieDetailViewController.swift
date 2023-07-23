//
//  MovieDetailViewController.swift
//  Movie Searcher
//
//  Created by Gurwinder Singh on 2023-07-23.
//  Copyright © 2023 ASN GROUP LLC. All rights reserved.
import UIKit

class MovieDetailViewController: UIViewController {

    var movie: DetailedMovie

    init(movie: DetailedMovie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Add a UIScrollView to allow scrolling through movie details
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(scrollView)

        let containerView = UIView() // Container view for all the details
        scrollView.addSubview(containerView)

        let margin: CGFloat = 20
        var offsetY: CGFloat = margin

        // Movie poster image view
        let posterImageView = UIImageView(frame: CGRect(x: margin, y: offsetY, width: view.frame.width - 2 * margin, height: 400))
        posterImageView.contentMode = .scaleAspectFit
        if let url = URL(string: movie.Poster), let data = try? Data(contentsOf: url) {
            posterImageView.image = UIImage(data: data)
        }
        containerView.addSubview(posterImageView)

        // Title label
        offsetY += posterImageView.frame.height + margin
        let titleLabel = createLabel(text: movie.Title, fontSize: 24, offsetY: offsetY, containerView: containerView)
        containerView.addSubview(titleLabel)

        // Year label
        offsetY += titleLabel.frame.height + margin
        let yearLabel = createLabel(text: "Year: \(movie.Year)", fontSize: 16, offsetY: offsetY, containerView: containerView)
        containerView.addSubview(yearLabel)

        // Rated label
        offsetY += yearLabel.frame.height + margin
        let ratedLabel = createLabel(text: "Rated: \(movie.Rated)", fontSize: 16, offsetY: offsetY, containerView: containerView)
        containerView.addSubview(ratedLabel)

        // Released label
        offsetY += ratedLabel.frame.height + margin
        let releasedLabel = createLabel(text: "Released: \(movie.Released)", fontSize: 16, offsetY: offsetY, containerView: containerView)
        containerView.addSubview(releasedLabel)

        // Runtime label
        offsetY += releasedLabel.frame.height + margin
        let runtimeLabel = createLabel(text: "Runtime: \(movie.Runtime)", fontSize: 16, offsetY: offsetY, containerView: containerView)
        containerView.addSubview(runtimeLabel)

        // Genre label
        offsetY += runtimeLabel.frame.height + margin
        let genreLabel = createLabel(text: "Genre: \(movie.Genre)", fontSize: 16, offsetY: offsetY, containerView: containerView)
        containerView.addSubview(genreLabel)

        // Director label
        offsetY += genreLabel.frame.height + margin
        let directorLabel = createLabel(text: "Director: \(movie.Director)", fontSize: 16, offsetY: offsetY, containerView: containerView)
        containerView.addSubview(directorLabel)

        // Actors label
        offsetY += directorLabel.frame.height + margin
        let actorsLabel = createLabel(text: "Actors: \(movie.Actors)", fontSize: 16, offsetY: offsetY, containerView: containerView)
        containerView.addSubview(actorsLabel)

        // Plot label
        offsetY += actorsLabel.frame.height + margin
        let plotLabel = createLabel(text: "Plot: \(movie.Plot)", fontSize: 16, offsetY: offsetY, containerView: containerView)
        plotLabel.numberOfLines = 0
        containerView.addSubview(plotLabel)

        // IMDb Rating label
        offsetY += plotLabel.frame.height + margin
        let imdbRatingLabel = createLabel(text: "IMDb Rating: \(movie.imdbRating)", fontSize: 16, offsetY: offsetY, containerView: containerView)
        containerView.addSubview(imdbRatingLabel)

        // Production label
        offsetY += imdbRatingLabel.frame.height + margin
        let productionLabel = createLabel(text: "Production: \(movie.Production)", fontSize: 16, offsetY: offsetY, containerView: containerView)
        containerView.addSubview(productionLabel)

        // Adjust content size for scrolling
        containerView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: offsetY + margin)
        scrollView.contentSize = containerView.frame.size
    }

    private func createLabel(text: String, fontSize: CGFloat, offsetY: CGFloat, containerView: UIView) -> UILabel {
        let label = UILabel(frame: CGRect(x: 20, y: offsetY, width: view.frame.width - 40, height: 0))
        label.text = text
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.sizeToFit()
        return label
    }
}

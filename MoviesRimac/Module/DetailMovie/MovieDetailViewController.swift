//
//  MovieDetailViewController.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 15/08/23.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let punctuationMovieLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    } ()
    
    private let movieTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    } ()
    
    private let descriptionMovie: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.sizeToFit()
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        
        
        return label
    } ()
    
    private let dateReleaseMovie: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    } ()
    
    private let scrollView: UIScrollView = {
       let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        
        
        return scrollview
    } ()
    
    private let scrollContent: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            movieTitle,
            descriptionMovie,
            dateReleaseMovie
        ])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        
        
        stackView.backgroundColor = UIColor.clear
        
        return stackView
    }()

    private let presenter: MovieDetailPresenterProtocol
    init(presenter: MovieDetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupView()
        setupConstraints()
        
        presenter.showDetailMovie()
    }
    
    
    private func setupView() {
        view.backgroundColor = .white
        
       
        
    }
    
    private func setupConstraints() {
        
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let scrollContentGuide = scrollView.contentLayoutGuide
        let scrollFrameGuide = scrollView.frameLayoutGuide
        
        scrollView.addSubview(scrollContent)
        scrollContent.fillSuperview()
        
        scrollContent.addSubview(movieImageView)
        scrollContent.addSubview(punctuationMovieLabel)
        scrollContent.addSubview(verticalStackView)
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollContent.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor),
            scrollContent.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor),
            scrollContent.topAnchor.constraint(equalTo: scrollContentGuide.topAnchor),
            scrollContent.bottomAnchor.constraint(equalTo: scrollContentGuide.bottomAnchor),
            
            scrollContent.leadingAnchor.constraint(equalTo: scrollFrameGuide.leadingAnchor),
            scrollContent.trailingAnchor.constraint(equalTo: scrollFrameGuide.trailingAnchor),
            scrollContent.heightAnchor.constraint(equalToConstant: view.frame.height),
            
            movieImageView.centerXAnchor.constraint(equalTo: scrollContent.centerXAnchor),
            
            movieImageView.topAnchor.constraint(equalTo: scrollContent.topAnchor, constant: 50),
            movieImageView.widthAnchor.constraint(equalToConstant: 200),
            movieImageView.heightAnchor.constraint(equalToConstant: 400),
            
            punctuationMovieLabel.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -16),
            punctuationMovieLabel.topAnchor.constraint(equalTo: scrollContent.topAnchor, constant: 30),
            
            verticalStackView.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 8),
            verticalStackView.bottomAnchor.constraint(equalTo: scrollContent.bottomAnchor, constant: -16),
            verticalStackView.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -16),
            verticalStackView.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 16)

        ])
        
        
    }

}

extension MovieDetailViewController: MovieDetailViewProtocol {
    func showMovieDetail(data: MovieModel?) {
        punctuationMovieLabel.text = data?.voteAverageString
        movieTitle.text = data?.title
        descriptionMovie.text = data?.overview
        dateReleaseMovie.text = data?.dateReleaseString
        movieImageView.af.setImage(withURL: getUrl(data?.posterPath ?? ""))
    }
    
}

//
//  MovieTableViewCell.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 14/08/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var titleMovieLabel: UILabel!{
        didSet {
            titleMovieLabel.text = ""
        }
    }
    
    @IBOutlet weak var punctuationLabel: UILabel!{
        didSet {
            punctuationLabel.text = ""
        }
    }
    
    @IBOutlet weak var dateLabel: UILabel!{
        didSet {
            dateLabel.text = ""
        }
    }
    
    var data: MovieModel! {
        
        didSet {
            titleMovieLabel.text = data.title
            punctuationLabel.text = data.voteAverageString
            dateLabel.text = data.dateReleaseString
            movieImage.af.setImage(withURL: getUrl(data.posterPath ?? ""))
            setupView()
        }
        
    }
    
    private func setupView() {
        
        
        
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

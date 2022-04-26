//
//  MusicCollectionViewCell.swift
//  AVMusicPlayer
//
//  Created by Macservis on 25/04/22.
//

import UIKit

class MusicCollectionViewCell: UICollectionViewCell {
    static let identifier = "MyMusicCell"
    
    let nmImageView: UIImageView = {
     let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
     return imageView
    }()
    
    
    let nmNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name"
        label.font = UIFont(name: "Arial-BoldMT", size: 30)
        label.textColor = UIColor.label
        return label
    }()
    
    
    let nmArtistLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Artist"
        label.font = UIFont(name: "AvenirNext-Regular", size: 20)
        label.textColor = UIColor.label
        return label
    }()
    
   
    let nmStackview: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
      setViews()
      setConstraints()
    }
    
    func  setViews(){
       
        contentView.backgroundColor = UIColor.systemBackground
        
        contentView.layer.cornerRadius = 10
        
        nmStackview.addArrangedSubview(nmNameLabel)
        nmStackview.addArrangedSubview(nmArtistLabel)
        
        nmNameLabel.leftAnchor.constraint(equalTo: nmStackview.leftAnchor).isActive = true
        nmNameLabel.rightAnchor.constraint(equalTo: nmStackview.rightAnchor).isActive = true
        
        nmArtistLabel.leftAnchor.constraint(equalTo: nmStackview.leftAnchor).isActive = true
        nmArtistLabel.rightAnchor.constraint(equalTo: nmStackview.rightAnchor).isActive = true
        
        addSubview(nmImageView)
        addSubview(nmStackview)
       
   
    }
    
    func setConstraints() {
        
        nmImageView.topAnchor.constraint(equalTo: topAnchor,constant: 20).isActive = true
        nmImageView.leftAnchor.constraint(equalTo: leftAnchor,constant: 10).isActive = true
        nmImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        nmImageView.rightAnchor.constraint(equalTo: rightAnchor,constant: -10).isActive = true
        
        
        

        nmStackview.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        nmStackview.topAnchor.constraint(equalTo: nmImageView.bottomAnchor, constant: 20).isActive = true
        nmStackview.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        nmStackview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    }
    
    
    
}

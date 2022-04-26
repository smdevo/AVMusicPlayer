//
//  HomeTableViewCell.swift
//  AVMusicPlayer
//
//  Created by Macservis on 22/04/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    static let identifier = "HomeMusicCell"
    
    let nmImageView: UIImageView = {
     let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
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
        
        nmImageView.leftAnchor.constraint(equalTo: leftAnchor,constant: 10).isActive = true
        nmImageView.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.75).isActive = true
        nmImageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75).isActive = true
        
        nmImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        
        nmStackview.leftAnchor.constraint(equalTo: nmImageView.rightAnchor, constant: 10).isActive = true
        nmStackview.heightAnchor.constraint(equalTo: nmImageView.heightAnchor).isActive = true
        nmStackview.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        nmStackview.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
    }
}

extension UIButton{

    func setImageTintColor(_ color: UIColor) {
        let tintedImage = self.imageView?.image?.withRenderingMode(.alwaysTemplate)
        self.setImage(tintedImage, for: .normal)
        self.tintColor = color
    }

}

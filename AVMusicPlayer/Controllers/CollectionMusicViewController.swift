//
//  CollectionMusicViewController.swift
//  AVMusicPlayer
//
//  Created by Macservis on 25/04/22.
//

import UIKit

class CollectionMusicViewController: UIViewController {

    let songs = HomeViewController().createMusic()
    
    
    let nmcollectionView: UICollectionView = {
           let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
           layout.minimumInteritemSpacing = 10
           layout.minimumLineSpacing = 10
        
        if UIScreen.main.bounds.width > 500 {
            layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 40) / 3, height: (UIScreen.main.bounds.height - 100) / 4)
        }else{
           layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 30) / 2, height: (UIScreen.main.bounds.height - 100) / 3)
        }
           layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
           
           let collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
           collectionView.translatesAutoresizingMaskIntoConstraints = false
        //collectionView.backgroundColor = UIColor.systemGray6
       collectionView.backgroundView = UIImageView(image: UIImage(named: "im_background1"))
           return collectionView
       }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
      
       setCollectionView()
       startFunction()
    }
    
    
   
    
     
    func setCollectionView() {
        nmcollectionView.delegate = self
        nmcollectionView.dataSource = self
        nmcollectionView.register(MusicCollectionViewCell.self, forCellWithReuseIdentifier: MusicCollectionViewCell.identifier)
    }
    
    
    
    func startFunction() {
        view.backgroundColor = UIColor.white
        self.view.addSubview(nmcollectionView)
        startNavigation()
    }
    
    
    func  startNavigation() {
        title  = "Collections"
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}



extension CollectionMusicViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = songs[indexPath.row]
        let cell = nmcollectionView.dequeueReusableCell(withReuseIdentifier: MusicCollectionViewCell.identifier, for: indexPath) as! MusicCollectionViewCell
        cell.nmImageView.image = UIImage(named: item.image ?? "im1")
        cell.nmNameLabel.text = item.name
        cell.nmArtistLabel.text = item.artistName
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let position = indexPath.row
        
        let rvc = ResultViewController()
        
        rvc.position = position
        rvc.songs = songs
        
        
        let nrvc = UINavigationController(rootViewController: rvc)
 
       present(nrvc, animated: true)
    }
    
}

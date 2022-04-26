//
//  HomeViewController.swift
//  AVMusicPlayer
//
//  Created by Macservis on 22/04/22.
//

import UIKit



class HomeViewController: UIViewController {

    
    var songs: [Song] = []
    
    
    
    let nmtableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 120
        tableView.backgroundView = UIImageView(image: UIImage(named: "im_background1"))
         return tableView
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       startFunction()
    }
    

    func  startFunction() {
        
        view.backgroundColor = UIColor.white
        view.addSubview(nmtableView)
        
        
        songs = createMusic()
        settableView()
        startNavigation()
    }
    
    
    func createMusic() -> [Song] {
        var songs: [Song] = []

//Real songs
        songs.append(Song(name: "Uletay", artistName: "John", image: "im1"))
        songs.append(Song(name: "Acunma", artistName: "Helena", image: "im2"))
        songs.append(Song(name: "Etovaye", artistName: "Anna", image: "im3"))
        
        
        
//Reapet songs
        songs.append(Song(name: "Uletay", artistName: "John", image: "im1"))
        songs.append(Song(name: "Acunma", artistName: "Helena", image: "im2"))
        songs.append(Song(name: "Etovaye", artistName: "Anna", image: "im3"))
        songs.append(Song(name: "Uletay", artistName: "John", image: "im1"))
        songs.append(Song(name: "Acunma", artistName: "Helena", image: "im2"))
        songs.append(Song(name: "Etovaye", artistName: "Anna", image: "im3"))
        
        return songs
        
    }
    
    func settableView() {
        nmtableView.delegate = self
        nmtableView.dataSource = self
        nmtableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
    
    
    func startNavigation()  {
        title = "Musics"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}



extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = nmtableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        let song = songs[indexPath.row]
        
        cell.nmImageView.image = UIImage(named: song.image!)
        cell.nmNameLabel.text = song.name
        cell.nmArtistLabel.text = song.artistName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row + 1)
        
        let position = indexPath.row
  
        let rvc = ResultViewController()
        rvc.position = position
        rvc.songs = songs

        let nvc = UINavigationController(rootViewController: rvc)

        present(nvc, animated: true)
    }
  
}

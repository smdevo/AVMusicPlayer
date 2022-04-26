//
//  ViewController.swift
//  AVMusicPlayer
//
//  Created by Macservis on 22/04/22.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        setTabber()
    }

    func  setTabber() {
        
        tabBar.tintColor = UIColor.systemRed
        tabBar.backgroundColor = UIColor.white
        tabBar.barTintColor = UIColor.white
        
        let hvc = HomeViewController()
        let cvc = CollectionMusicViewController()
        
        let nhvc = UINavigationController(rootViewController: hvc)
        let ncvc = UINavigationController(rootViewController: cvc)
        
        nhvc.tabBarItem = UITabBarItem(title: "Musics", image: UIImage(named: "music"), selectedImage: UIImage(named: "music_s"))
        ncvc.tabBarItem = UITabBarItem(title: "Collections", image: UIImage(named: "favorite"), selectedImage: UIImage(named: "favorite_s"))
        
        
        
        viewControllers = [nhvc,ncvc]
    }
    
    

}


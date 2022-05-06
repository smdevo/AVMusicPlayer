//
//  ResultViewController.swift
//  AVMusicPlayer
//
//  Created by Macservis on 23/04/22.
//

import UIKit
import AVFoundation
import MediaPlayer

class ResultViewController: UIViewController {

    public var position: Int = 0
    public var songs: [Song] = []
   
    

        //   var player: AVAudioPlayer?
    var player: AVPlayer?
    
    let nmimageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.image = UIImage(named: "ic_music_result")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let nmPlaySlider: UISlider = {
      let slider = UISlider()
        slider.tag = 11
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.addTarget(self, action: #selector(targetSlider(slider:)), for: .valueChanged)
        slider.minimumTrackTintColor = UIColor.darkGray
        slider.setThumbImage(UIImage(named: "ic_thumb"), for: UIControl.State.normal)
        slider.maximumTrackTintColor = UIColor.systemGray2
        return slider
    }()
    
    let nmVolumeSlider: UISlider = {
      let slider = UISlider()
        slider.tag = 10
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.value = 0.5
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.addTarget(self, action: #selector(targetSlider(slider:)), for: .valueChanged)
        slider.thumbTintColor = UIColor.systemBlue
        slider.minimumTrackTintColor = UIColor.systemBlue
        slider.maximumTrackTintColor = UIColor.systemGray4
        slider.minimumValueImage = UIImage(systemName: "volume.slash.fill")
        slider.maximumValueImage = UIImage(systemName: "volume.3.fill")
        return slider
    }()
    
    let nmNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name"
        label.font = UIFont(name: "Arial-BoldMT", size: 35)
        label.textColor = UIColor(named: "LabelNAmeColor")
        return label
    }()
    
    
    let nmArtistLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Artist"
        label.font = UIFont(name: "AvenirNext-Regular", size: 20)
        label.textColor = UIColor(named: "ArtistNameTime")
        return label
    }()
    
    
    let nmStackview: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()
    
    let nmbackButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray6
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.contentMode = .scaleAspectFill
        button.tag = 1
        button.setImage(UIImage(systemName: "backward.end.fill"), for: .normal)
        button.setImageTintColor(.darkGray)
        button.setTitle("", for: .normal)
        button.setTitleColor(UIColor.darkGray, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(musicActions(sender:)), for: .touchUpInside)
        return button
    }()
    
    let nmnextButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray6
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.contentMode = .scaleAspectFill
        button.tag = 3
        button.setImage(UIImage(systemName: "forward.end.fill"), for: .normal)
        button.setImageTintColor(.darkGray)
        button.setTitle("", for: .normal)
        button.setTitleColor(UIColor.darkGray, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(musicActions(sender:)), for: .touchUpInside)
        return button
    }()
    
    
    let nm_pause_play_Button: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray5
        button.clipsToBounds = true
        button.layer.cornerRadius = 30
        button.contentMode = .scaleAspectFill
        button.tag = 2
        button.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        button.setImageTintColor(.darkGray)
        button.setTitle("", for: .normal)
        button.setTitleColor(UIColor.darkGray, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(musicActions(sender:)), for: .touchUpInside)
        return button
    }()
 
    
    let nmButtonsStackview: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
//MARK: - Bu yerda
    
    
    
    let nmvalueTimeLAbel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00 : 00"
        label.textAlignment = .left
        label.font = UIFont(name: "AvenirNext-Regular", size: 15)
        label.textColor = UIColor(named: "ArtistNameTime")
        return label
    }()
    
    
    let nmMaximumTimeLAbel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00 : 00"
        label.textAlignment = .right
        label.font = UIFont(name: "AvenirNext-Regular", size: 15)
        label.textColor = UIColor(named: "ArtistNameTime")
        return label
    }()
    
    
    
    let nmTimeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 140
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    
    
    //MARK: - Bu yerda

    let nm_umumStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        startFunction()
   }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.pause()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let player = player {
            player.play()
        }
    }
    
    
    //MARK: - Methods
    
    func startFunction() {
  
        setNavigation()
        setConstraints()
        configure()
    }
    
       
    func setNavigation() {
        view.backgroundColor = UIColor(named: "ViewColor")
        
        
        title = "Music"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(esc))
        navigationController?.navigationBar.tintColor = UIColor.red
    }
    
   
    
    
    func configure() {
    
       
    
        
        let song = songs[position]

        nmimageView.image = UIImage(named: song.image ?? "ic_music_result")
        nmNameLabel.text = song.name
        nmArtistLabel.text = song.artistName
        nm_pause_play_Button.setImage(UIImage(systemName: "pause.fill"), for: UIControl.State.normal)
        
        
        
        
        
      let urlString = Bundle.main.path(forResource: song.name, ofType: "mp3")


       

            guard let urlString = urlString else {
                print("url nil")
                return
            }


            player = AVPlayer(url: URL(fileURLWithPath: urlString))

        guard let player = player else {
            print("player nil")
            return
        }
        
        player.volume = nmVolumeSlider.value
        
            player.play()

        nmPlaySlider.maximumValue = Float((player.currentItem?.asset.duration.seconds) ?? 1)
        
        nmMaximumTimeLAbel.text = secondtoMinStr(second: Int(nmPlaySlider.maximumValue))
        
        player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1000), queue: DispatchQueue.main, using: { [self]
            (time) in
            self.nmPlaySlider.value = Float(time.seconds)
            self.nmvalueTimeLAbel.text = secondtoMinStr(second: Int(time.seconds))
            
            guard nmvalueTimeLAbel.text == nmMaximumTimeLAbel.text else {
                return
            }
            if position < songs.count - 1 {
                position += 1
                player.pause()
                configure()
            }
            else {
                //if player.timeControlStatus == .paused {
                nm_pause_play_Button.setImage(UIImage(systemName: "play.fill"), for: .normal)
                
                //}
            }
            print("utdi")
        })
        
        
        }

    func secondtoMinStr(second: Int) -> String {
        
        
        let minif = (second / 60) / 10  == 0 ? "0\(second / 60)" : "\(second / 60)"
        
        let secondif = (second % 60) / 10 == 0 ? "0\(second % 60)" : "\(second % 60)"
 
        return "\(minif) : \(secondif)"
    }
    
    
    
    func  setConstraints() {
        
        nmStackview.addArrangedSubview(nmNameLabel)
        nmStackview.addArrangedSubview(nmArtistLabel)
        
        nmNameLabel.leftAnchor.constraint(equalTo: nmStackview.leftAnchor).isActive = true
        nmNameLabel.rightAnchor.constraint(equalTo: nmStackview.rightAnchor).isActive = true
        
        nmArtistLabel.leftAnchor.constraint(equalTo: nmStackview.leftAnchor).isActive = true
        nmArtistLabel.rightAnchor.constraint(equalTo: nmStackview.rightAnchor).isActive = true
        
        
        nmButtonsStackview.addArrangedSubview(nmbackButton)
        nmButtonsStackview.addArrangedSubview(nm_pause_play_Button)
        nmButtonsStackview.addArrangedSubview(nmnextButton)
        
        nmbackButton.topAnchor.constraint(equalTo: nmButtonsStackview.topAnchor).isActive = true
        nmbackButton.bottomAnchor.constraint(equalTo: nmButtonsStackview.bottomAnchor).isActive = true
        
        nm_pause_play_Button.topAnchor.constraint(equalTo: nmButtonsStackview.topAnchor).isActive = true
        nm_pause_play_Button.bottomAnchor.constraint(equalTo: nmButtonsStackview.bottomAnchor).isActive = true
        
        nmnextButton.topAnchor.constraint(equalTo: nmButtonsStackview.topAnchor).isActive = true
        nmnextButton.bottomAnchor.constraint(equalTo: nmButtonsStackview.bottomAnchor).isActive = true
        
        
        nmTimeStackView.addArrangedSubview(nmvalueTimeLAbel)
        nmTimeStackView.addArrangedSubview(nmMaximumTimeLAbel)
        
        nmvalueTimeLAbel.topAnchor.constraint(equalTo: nmTimeStackView.topAnchor).isActive = true
        nmvalueTimeLAbel.bottomAnchor.constraint(equalTo: nmTimeStackView.bottomAnchor).isActive = true
        
        nmMaximumTimeLAbel.topAnchor.constraint(equalTo: nmTimeStackView.topAnchor).isActive = true
        nmMaximumTimeLAbel.bottomAnchor.constraint(equalTo: nmTimeStackView.bottomAnchor).isActive = true
        
        
        
        nm_umumStackView.addArrangedSubview(nmStackview)
        nm_umumStackView.addArrangedSubview(nmPlaySlider)
        nm_umumStackView.addArrangedSubview(nmTimeStackView)
        nm_umumStackView.addArrangedSubview(nmButtonsStackview)
        nm_umumStackView.addArrangedSubview(nmVolumeSlider)
        
        
        
        nmStackview.leftAnchor.constraint(equalTo: nm_umumStackView.leftAnchor).isActive = true
        nmStackview.rightAnchor.constraint(equalTo: nm_umumStackView.rightAnchor).isActive = true
        
        nmPlaySlider.leftAnchor.constraint(equalTo: nm_umumStackView.leftAnchor).isActive = true
        nmPlaySlider.rightAnchor.constraint(equalTo: nm_umumStackView.rightAnchor).isActive = true
        
        nmTimeStackView.leftAnchor.constraint(equalTo: nm_umumStackView.leftAnchor).isActive = true
        nmTimeStackView.rightAnchor.constraint(equalTo: nm_umumStackView.rightAnchor).isActive = true
        
        nmButtonsStackview.leftAnchor.constraint(equalTo: nm_umumStackView.leftAnchor).isActive = true
        nmButtonsStackview.rightAnchor.constraint(equalTo: nm_umumStackView.rightAnchor).isActive = true
        
        nmVolumeSlider.leftAnchor.constraint(equalTo: nm_umumStackView.leftAnchor).isActive = true
        nmVolumeSlider.rightAnchor.constraint(equalTo: nm_umumStackView.rightAnchor).isActive = true
        
        
        view.addSubview(nmimageView)
        view.addSubview(nm_umumStackView)
        
        nmimageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        nmimageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        nmimageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        nmimageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        
        nm_umumStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        nm_umumStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        nm_umumStackView.topAnchor.constraint(equalTo: nmimageView.bottomAnchor, constant: 20).isActive = true
        nm_umumStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true

    }
    
    
    
    //MARK: -  objc Methods
    
    @objc func musicActions(sender: UIButton) {
        switch sender.tag {
            
        case 1:
            if position > 0 {
                position -= 1
                if let player = player {
                    player.pause()
                }
                configure()
            }
            
        case 2:
            
            if player?.timeControlStatus == .playing{
                
                sender.setImage(UIImage(systemName: "play.fill"), for: .normal)
                player!.pause()
                
            }else {

                
                if nmMaximumTimeLAbel.text != nmvalueTimeLAbel.text {
                    sender.setImage(UIImage(systemName: "pause.fill"), for: .normal)
                    player!.play()
                }
                else {
                    configure()
                    sender.setImage(UIImage(systemName: "pause.fill"), for: .normal)
                }
                
                }
        case 3:
            if position < songs.count - 1 {
                position += 1
                if let player = player {
                    player.pause()
                }
                configure()
            }
        default: break
        }
 
    }
    
    
    
    
    
    
    
    @objc func targetSlider(slider: UISlider) {
        
        
        switch slider.tag {
        
        case 10:
            
            
        player?.volume = slider.value
        switch     slider.value {
        case 0:    slider.maximumValueImage = UIImage(systemName: "volume.slash.fill")
        case 0...0.24: slider.maximumValueImage = UIImage(systemName: "volume.fill")
        case 0.25...0.5:  slider.maximumValueImage = UIImage(systemName: "volume.1.fill")
        case 0.5...0.75: slider.maximumValueImage = UIImage(systemName: "volume.2.fill")
        case 0.75...1:    slider.maximumValueImage = UIImage(systemName: "volume.3.fill")
        default: break
            
        }
        
        case 11:
            player?.seek(to: CMTime(seconds: Double(slider.value), preferredTimescale: 1000))
            print(#function)
            
        default: break
            
            
        }
    }
    
    
    @objc func esc() {
        dismiss(animated: true)
    }
    
    
}

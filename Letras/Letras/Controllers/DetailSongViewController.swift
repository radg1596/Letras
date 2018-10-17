//
//  DetailSongViewController.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/16/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

class DetailSongViewController: UIViewController {
    
    @IBOutlet weak var songTextView: UITextView!
    
    var song: Song!
    var delegate: AddSongDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        songTextView.allowsEditingTextAttributes = false
        let navControllerSongTVC = tabBarController?.viewControllers?.last as? UINavigationController
        let songsTableVC =  navControllerSongTVC?.viewControllers.first! as? SongsTableViewController
        self.delegate = songsTableVC
        save()
        save()
        // Do any additional setup after loading the view.
    }
    
    func setupNavigationBar() {
        self.title = "\(song.name)-\(song.title)"
        songTextView.text = song.text
    }
    
    func save() {
        delegate?.added(song: song)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

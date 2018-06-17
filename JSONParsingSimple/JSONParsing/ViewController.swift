//
//  ViewController.swift
//  JSONParsingDecodable
//
//  Created by Ani Adhikary on 16/06/18.
//  Copyright © 2018 TheTechStory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var artistTableView: UITableView!
    
    let artists = Artist.artistsFromBundle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    func setupTableView() {
        artistTableView.delegate = self
        artistTableView.dataSource = self
        artistTableView.allowsSelection = false
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistCell", for: indexPath)
        let artist = artists[indexPath.row]
        cell.textLabel?.text = artist.name
        return cell
    }        
}


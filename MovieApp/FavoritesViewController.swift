//
//  FavoritesViewController.swift
//  MovieApp
//
//  Created by Mario Hosnjak on 05.05.2022..
//

import Foundation
import UIKit
import PureLayout
import MovieAppData

class FavoritesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        
        self.navigationController?.pushViewController(MovieDetailsViewController(), animated: true)
    }
}


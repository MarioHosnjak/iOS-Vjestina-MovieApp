//
//  myCollectionView.swift
//  MovieApp
//
//  Created by Mario Hosnjak on 11.04.2022..
//

import SwiftUI
import Foundation
import UIKit
import PureLayout
import MovieAppData

class MovieListView: UIView {
    
    var tableView: MovieGroupsTableView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        buildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViews() {
        tableView = MovieGroupsTableView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height - 120))
        addSubview(tableView)
    }
}

//
//  MovieGroupsTableView.swift
//  MovieApp
//
//  Created by Mario Hosnjak on 13.04.2022..
//

import Foundation
import UIKit
import MovieAppData

class MovieGroupsTableView: UITableView {
    
    let cellId = "cellid"
    
    var movieGroups : [GroupType] = []
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
            
        movieGroups = GroupType.allValues
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureTableView(){
      
        delegate = self
        dataSource = self
        register(MovieGroupsTableViewCell.self, forCellReuseIdentifier: cellId)
        rowHeight = 280
        separatorStyle = UITableViewCell.SeparatorStyle.none
        
    }
    
    
}


extension MovieGroupsTableView : UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieGroups.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = dequeueReusableCell(withIdentifier: cellId) as! MovieGroupsTableViewCell
        let group = movieGroups[indexPath.row]
        print(indexPath.row)
        cell.set(groupType: group)
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
}

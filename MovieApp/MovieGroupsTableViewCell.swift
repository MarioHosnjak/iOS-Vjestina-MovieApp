//
//  MovieGroupsTableViewCell.swift
//  MovieApp
//
//  Created by Mario Hosnjak on 13.04.2022..
//

import Foundation
import UIKit
import PureLayout
import MovieAppData

var filters : [FilterType] = []

class MovieGroupsTableViewCell: UITableViewCell {
    
    var mainView : UIView!
    var groupTitle : UILabel!
    var filterBarView : UIView!
    var group : MovieGroupCollectionView!
    
    let filterStackView: FilterStackView! = FilterStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
           
        buildViews()
    }
       
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(groupType : GroupType){
        groupTitle.text = groupType.title
        groupTitle.font = UIFont(name: "Proxima Nova", size: 24)
        groupTitle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        groupTitle.textColor = UIColor(red: 11/255, green: 37/255, blue: 63/255, alpha: 1)
        filters = groupType.filters
        
        filterStackView.setStackView(filters: filters)
        
        group.setGroupType(group : groupType)
    }
    
    func buildViews(){
        mainView = UIView()
        groupTitle = UILabel()
        group = MovieGroupCollectionView()
        
        addSubview(groupTitle)
        contentView.addSubview(filterStackView)
        contentView.addSubview(group)
        
        
//        CONSTRAINTS
        
        groupTitle.autoPinEdge(.leading, to: .leading, of: contentView, withOffset: 20)
        groupTitle.autoPinEdge(.top, to: .top, of: contentView, withOffset: 10)
        groupTitle.autoSetDimension(.height, toSize: 30)
        
        group.autoPinEdge(.top, to: .top, of: contentView, withOffset: 95)
        group.autoPinEdge(.leading, to: .leading, of: contentView)
        group.autoPinEdge(.trailing, to: .trailing, of: contentView)
        group.autoPinEdge(.bottom, to: .bottom, of: contentView)
        
        filterStackView.autoPinEdge(.top, to: .bottom, of: groupTitle)
        filterStackView.autoPinEdge(.leading, to: .leading, of: contentView, withOffset: 20)
        filterStackView.autoPinEdge(.trailing, to: .trailing, of: contentView, withOffset: -20)
        filterStackView.autoPinEdge(.bottom, to: .top, of: group)
        
    }
    
}

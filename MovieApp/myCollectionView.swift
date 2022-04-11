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

class myCollectionView: UIView {
    
    var tableView: UITableView!
    let cellIdentifier = "cellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        buildViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViews() {
//        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height))
//        self.addSubview(tableView)
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier) // 1.
//        tableView.dataSource = self // 2.
//        tableView.backgroundColor = .white
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.bounds.width + 200, height: self.bounds.height),
                                              collectionViewLayout: flowLayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.addSubview(collectionView)
        
    }
    
    private func addConstraints(){
        
    }
    
}
//extension myCollectionView: UITableViewDataSource { // 3.
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//            return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell: UITableViewCell = tableView.dequeueReusableCell(
////                withIdentifier: cellIdentifier,
////                    for: indexPath) // 4.
//        let cell = UITableViewCell()
//
//        tableView.rowHeight = 170
//
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
////        flowLayout.itemSize = CGSize(width: 100, height: 150)
//        flowLayout.scrollDirection = .horizontal
//
//        let viewPhotos = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height),
//                            collectionViewLayout: flowLayout)
//
//        viewPhotos.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
//        viewPhotos.dataSource = self
//        viewPhotos.delegate = self
//
//
//
//        cell.addSubview(viewPhotos)
//
//        return cell
//    }
//}


extension myCollectionView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        let urlString = Movies.all()[indexPath.row].imageUrl
        let url = URL(string: urlString)
        let image: UIImageView
        image = UIImageView()
        image.load(url: url!)
        image.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        
        cell.addSubview(image)
        
        cell.backgroundColor = .blue
        return cell
    }
}

extension myCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    // Logic when cell is selected
    }
}

extension myCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 150)
    }
}

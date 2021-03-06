//
//  MovieGroupCollectionView.swift
//  MovieApp
//
//  Created by Mario Hosnjak on 13.04.2022..
//

import UIKit
import MovieAppData

class MovieGroupCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout, UINavigationControllerDelegate  {
    
    var cellId = "cellID"
    var filters : [FilterType] = []
    var groupType : MovieGroup!
    var allMoviesInGroup : [MovieModel] = []

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        super.init(frame: .zero, collectionViewLayout : layout)
    
        
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCollectionView() {
        register(MovieGroupCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        backgroundColor = .white
        delegate = self
        dataSource = self
        contentInset = UIEdgeInsets(top: -10, left: 0, bottom:0, right: 0)
        self.isScrollEnabled = true
        self.setContentOffset(CGPoint(x: 0,y: 0), animated: true)
    }
    
    func setGroupType(group : GroupType) {
        filters = group.filters
        groupType = group.toMovieGroup
        setMoviesInGroup()
    }
    
    func setMoviesInGroup() {
        for movie in Movies.all() {
            if (movie.group.contains(groupType)) {
                allMoviesInGroup.append(movie)
            }
        }
    }
    
    
}

extension MovieGroupCollectionView : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 182)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allMoviesInGroup.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MovieGroupCollectionViewCell
        cell.layer.cornerRadius = 15
        cell.set(movie: allMoviesInGroup[indexPath.row])
        cell.isUserInteractionEnabled = true
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapFunc(sender: ))))
        return cell
    }
    
    @objc
    func tapFunc(sender: Any){
        print("row")
        let vc = MovieDetailsViewController()
        let vc2 = MovieListViewController()
        vc2.tapFunc1()
//        let nc = UINavigationController(rootViewController: MovieListViewController())
//        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by Mario Hosnjak on 09.04.2022..
//

import Foundation
import UIKit
import PureLayout
import MovieAppData

class MovieListViewController: UIViewController {
    
    var scrollView = UIScrollView()
    var contentView = UIView()
    
    var searchBar = SearchBarView()
    
    
    
    let cellIdentifier = "cellId"
    
    let cellSpacingHeight: CGFloat = 50
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 10/255, green: 70/255, blue: 110/255, alpha: 1.0)
        
        buildViews()
        addConstraints()
    }
    
    private func buildViews() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(searchBar)
        
        scrollView.backgroundColor = UIColor(red: 10/255, green: 70/255, blue: 110/255, alpha: 1.0)
        contentView.backgroundColor = .white
        contentView.autoSetDimension(.width, toSize: view.frame.width)
        
        searchBar.autoSetDimension(.width, toSize: view.frame.width * 0.9)
        searchBar.autoSetDimension(.height, toSize: 50)
        
        searchBar.searchBarTextField.addTarget(self, action: #selector(txtFieldSelected), for: UIControl.Event.editingDidBegin)
        searchBar.magGlassButton.addTarget(self, action: #selector(magGlSelected), for: .touchUpInside)
        
        
        tableView = UITableView(frame: CGRect(x: 0, y: 120, width: view.bounds.width, height: view.bounds.height - 130))
        contentView.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier) // 1.
        tableView.dataSource = self // 2.
        tableView.backgroundColor = .white
        tableView.isHidden = true
        
        let collectionView = myCollectionView(frame: CGRect(x: 0, y: 120, width: view.bounds.width, height: view.bounds.height - 130))
        contentView.addSubview(collectionView)
        
//        collectionView.frame = CGRect(x: 0, y: 130, width: view.bounds.width, height: view.bounds.height)
             
    }
    
    private func addConstraints(){
        
        scrollView.autoPinEdgesToSuperviewEdges()
        
        contentView.autoPinEdgesToSuperviewEdges()
        contentView.autoPinEdge(toSuperviewSafeArea: .top, withInset: 0)
        contentView.autoPinEdge(toSuperviewEdge: .leading)
        contentView.autoPinEdge(toSuperviewEdge: .trailing)
        contentView.autoSetDimension(.height, toSize: view.bounds.height)
        
        searchBar.autoPinEdge(toSuperviewSafeArea: .top, withInset: 10)
        searchBar.autoPinEdge(.leading, to: .leading, of: contentView, withOffset: view.frame.width * 0.05)
        
    }
    
    @objc func txtFieldSelected(){
        tableView.isHidden = false
    }
    @objc func magGlSelected(){
        tableView.isHidden = true
    }
}

extension MovieListViewController: UITableViewDataSource { // 3.
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return Movies.all().count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: UITableViewCell = tableView.dequeueReusableCell(
//                withIdentifier: cellIdentifier,
//                    for: indexPath) // 4.
        let cell = UITableViewCell()
        
        tableView.rowHeight = 170
        tableView.separatorStyle = .none
        
        // Apply rounded corners
        contentView.layer.cornerRadius = 5.0
        contentView.layer.masksToBounds = true
        // Set masks to bounds to false to avoid the shadow
        // from being clipped to the corner radius
        cell.layer.cornerRadius = 5.0
        cell.layer.masksToBounds = false
        
        // How blurred the shadow is
        cell.layer.shadowRadius = 8.0
        // The color of the drop shadow
        cell.layer.shadowColor = UIColor.black.cgColor
        // How transparent the drop shadow is
        cell.layer.shadowOpacity = 0.15
        // How far the shadow is offset from the UICollectionViewCell’s frame
        cell.layer.shadowOffset = CGSize(width: 0, height: 5)

        
        let row = indexPath.section
        
        let urlString = Movies.all()[row].imageUrl
        let url = URL(string: urlString)
        let image: UIImageView
        image = UIImageView()
        image.load(url: url!)
        image.frame = CGRect(x: 10, y: 10, width: 100, height: 150)
        
        let title = "\(Movies.all()[row].title) (\(Movies.all()[row].year))"
        let titleLabel = UILabel(frame: CGRect(x: 125, y: 10, width: view.frame.width - 100 - 20 - 20.0, height: 70))
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.numberOfLines = 2
        
        let desc = Movies.all()[row].description
        let descLabel = UILabel(frame: CGRect(x: 125, y: 60, width: view.frame.width - 100 - 20 - 20.0, height: 100))
        descLabel.text = desc
        descLabel.font = UIFont.systemFont(ofSize: 15)
        descLabel.numberOfLines = 5
        
        cell.addSubview(image)
        cell.addSubview(titleLabel)
        cell.addSubview(descLabel)
        
        
//        var cellConfig = UIListContentConfiguration() // 5.
//
//
//        cell.contentConfiguration = cellConfig
        return cell
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

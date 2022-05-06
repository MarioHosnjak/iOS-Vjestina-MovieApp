//
//  MovieGroupCollectionViewCell.swift
//  MovieApp
//
//  Created by Mario Hosnjak on 13.04.2022..
//

import Foundation
import UIKit
import PureLayout
import MovieAppData


class MovieGroupCollectionViewCell: UICollectionViewCell{
    
    var MovieImage: UIImageView!
    var bgCircleImg : UIImageView!
    var heartButton : UIButton!
    var mainView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
            
        buildViews()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViews(){
        
        
        
        mainView = UIView()
        addSubview(mainView)
        
        MovieImage = UIImageView()
        mainView.addSubview(MovieImage)
        
        bgCircleImg = UIImageView(image: UIImage(named: "circle.fill"))
        bgCircleImg.tintColor = .black
        bgCircleImg.layer.opacity = 0.4
        MovieImage.addSubview(bgCircleImg)
        
        heartButton = UIButton()
        heartButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        heartButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .selected)
        heartButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .highlighted)
        heartButton.tintColor = .white
        bgCircleImg.addSubview(heartButton)
        
        heartButton.addTarget(self, action: #selector(heartBtnClick), for: .touchUpInside)
        heartButton.isUserInteractionEnabled = true
        
        
        self.layer.cornerRadius = 15
        
        mainView.backgroundColor = UIColor.gray.withAlphaComponent(0.06)
        mainView.layer.cornerRadius = 15
                
        MovieImage.contentMode = .scaleAspectFill
        MovieImage.clipsToBounds = true
        MovieImage.layer.cornerRadius = 15
        
        mainView.autoPinEdgesToSuperviewEdges()
//        MovieImage.autoPinEdgesToSuperviewEdges()
        MovieImage.autoPinEdge(.top, to: .top, of: mainView, withOffset: 5)
        MovieImage.autoPinEdge(.leading, to: .leading, of: mainView, withOffset: 6)
        MovieImage.autoPinEdge(.trailing, to: .trailing, of: mainView, withOffset: -6)
        MovieImage.autoPinEdge(.bottom, to: .bottom, of: mainView, withOffset: -7)
        
        bgCircleImg.autoPinEdge(.top, to: .top, of: MovieImage, withOffset: 5)
        bgCircleImg.autoPinEdge(.leading, to: .leading, of: MovieImage, withOffset: 5)
        bgCircleImg.autoSetDimensions(to: CGSize(width: 30, height: 30))
        
        heartButton.autoPinEdge(.top, to: .top, of: bgCircleImg, withOffset: 2.5)
        heartButton.autoPinEdge(.leading, to: .leading, of: bgCircleImg, withOffset: 2.5)
        heartButton.autoSetDimensions(to: CGSize(width: 25, height: 25))
        
    }
    
    func set(movie : MovieModel) {
        guard let url = URL(string: movie.imageUrl) else {return}
        MovieImage.image = UIImage(data: try! Data(contentsOf: url))
    }
    
    @objc func heartBtnClick(sender: UIButton!){
        print("CLICK!")
        if(sender.isSelected == true) {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
}

//
//  FilterStackView.swift
//  MovieApp
//
//  Created by Mario Hosnjak on 13.04.2022..
//

import Foundation
import UIKit
import MovieAppData


class FilterStackView: UIStackView {
      
    func setStackView(filters: [FilterType]){
        
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillProportionally

        var prolaz = 0
        
        if(self.subviews.count == 0){
            for val in filters {
                let filterLabelButton = UIButton()
                filterLabelButton.setTitle(val.title, for: .normal)
                filterLabelButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
                filterLabelButton.setTitleColor(.darkGray, for: .normal)
                
                let selectedBlue = UIColor(red: 11/255, green: 37/255, blue: 63/255, alpha: 1)
                let string = val.title
                let attributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: selectedBlue,
                    .underlineStyle: NSUnderlineStyle.single.rawValue,
                    .underlineColor: selectedBlue,
                    .font: UIFont.boldSystemFont(ofSize: 20)
                ]
                let attributedString = NSAttributedString(string: string, attributes: attributes)
                
                let attr: [NSAttributedString.Key: Any] = [:]
                let nonAttributedString = NSAttributedString(string: string, attributes: attr)
                
                filterLabelButton.setAttributedTitle(attributedString, for: .selected)
                filterLabelButton.setAttributedTitle(nonAttributedString, for: .normal)
                filterLabelButton.contentHorizontalAlignment = .left
                
                filterLabelButton.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
                if prolaz == 0 {
                    filterLabelButton.isSelected = true
                }
                prolaz+=1
                self.addArrangedSubview(filterLabelButton)
            }
        }
    }
    
    @objc func btnClicked(sender: UIButton!){
        for objects in self.subviews {
            if let object = objects as? UIButton {
                object.isSelected = false
            }
        }
        sender.isSelected = true
    }
        
}

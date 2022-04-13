//
//  SearchBarView.swift
//  MovieApp
//
//  Created by Mario Hosnjak on 10.04.2022..
//

import SwiftUI
import Foundation
import UIKit
import PureLayout

class SearchBarView: UIView {
    
    var searchBarTextField = UITextField()
    var magGlassButton = UIButton()
    var cancelButton = UIButton()
    var xButton = UIButton()
    
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
        
        addSubview(searchBarTextField)
        addSubview(magGlassButton)
        addSubview(cancelButton)
        addSubview(xButton)
        
        self.backgroundColor = UIColor(red: 0.917, green: 0.917, blue: 0.921, alpha: 1)
        self.layer.cornerRadius = 10
        
        searchBarTextField.attributedPlaceholder = NSAttributedString("Search")
        searchBarTextField.addTarget(self, action: #selector(textFieldSelected2), for: UIControl.Event.editingDidBegin)
        
        magGlassButton.autoSetDimension(.width, toSize: 20.31)
        magGlassButton.setBackgroundImage(UIImage(named: "magnifyingglass"), for: .normal)
        magGlassButton.setBackgroundImage(UIImage(named: "magnifyingglass"), for: .selected)
        magGlassButton.addTarget(self, action: #selector(didCancelButtonClick2), for: .touchUpInside)
        
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.black, for: .normal)
//        cancelButton.backgroundColor = .yellow
        cancelButton.isHidden = true
        cancelButton.addTarget(self, action: #selector(didCancelButtonClick2), for: .touchUpInside)
        
        xButton.setBackgroundImage(UIImage(named: "xmark"), for: .normal)
        xButton.setBackgroundImage(UIImage(named: "xmark"), for: .selected)
        xButton.autoSetDimension(.width, toSize: 10)
        xButton.autoSetDimension(.height, toSize: 10)
        xButton.isHidden = true
        xButton.addTarget(self, action: #selector(didXButtonnClick2), for: .touchUpInside)
        
    }
    
    private func addConstraints(){
        
        searchBarTextField.autoPinEdge(.leading, to: .trailing, of: magGlassButton, withOffset: 15)
        searchBarTextField.autoPinEdge(.top, to: .top, of: self, withOffset: 5)
        searchBarTextField.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: -5)
        searchBarTextField.autoPinEdge(.trailing, to: .trailing, of: self, withOffset: -50)
        
        magGlassButton.autoPinEdge(.leading, to: .leading, of: self, withOffset: 15)
        magGlassButton.autoPinEdge(.top, to: .top, of: self, withOffset: 15)
        magGlassButton.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: -15)
        
        cancelButton.autoPinEdge(.top, to: .top, of: self, withOffset: 5)
        cancelButton.autoPinEdge(.leading, to: .trailing, of: self, withOffset: 10)
        cancelButton.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: -5)
        
//        cancelButton.autoSetDimension(.width, toSize: 80)
        
        xButton.autoPinEdge(.trailing, to: .trailing, of: self, withOffset: -15)
        xButton.autoPinEdge(.top, to: .top, of: self, withOffset: 20)
        
    }

    @objc func textFieldSelected2(){
        for constraint in self.constraints {
            if constraint.firstAttribute == .width {
                constraint.constant = self.superview!.frame.width * 0.7
            }
        }
        cancelButton.isEnabled = true
        cancelButton.isUserInteractionEnabled = true
        cancelButton.isHidden = false
        xButton.isHidden = false
        
    }
    

    @objc public func didCancelButtonClick2(){
        self.endEditing(true)
        cancelButton.isHidden = true
        xButton.isHidden = true
        searchBarTextField.text = ""
        for constraint in self.constraints {
            if constraint.firstAttribute == .width {
                constraint.constant = self.superview!.frame.width * 0.9
                }
        }
    }
    

    @objc func didSearchButtonClick2(){
        self.endEditing(true)
        cancelButton.isHidden = true
        xButton.isHidden = true
        searchBarTextField.text = ""
        for constraint in self.constraints {
            if constraint.firstAttribute == .width {
                constraint.constant = self.superview!.frame.width * 0.9
                }
        }
    }
    

    @objc func didXButtonnClick2(){
        searchBarTextField.text = ""
    }

    
}

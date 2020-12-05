//
//  PopUpWindow.swift
//  MSU-Student-Link
//
//  Created by Ruchika Gupta on 12/4/20.
//

import Foundation
import UIKit


class PopUpWindow: UIView {

   
    fileprivate let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Today share your story with : "
        return label
    }()
    
    fileprivate let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Today you have been matched with"
        return label
    }()

   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
  }

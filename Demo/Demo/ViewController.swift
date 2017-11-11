//
//  ViewController.swift
//  Demo
//
//  Created by Paolo Cuscela on 10/11/17.
//  Copyright © 2017 Paolo Cuscela. All rights reserved.
//

import UIKit
import Caliber

class ViewController: UIViewController {

    let header = UIImageView()
    let blurRect = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    let summary = UILabel()
    let backgroundIV = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup your views and add them to a superview.
        setup()
        view.addSubview(header)
        view.addSubview(backgroundIV)
        backgroundIV.addSubview(blurRect)
        blurRect.contentView.addSubview(summary)
        
        // Add Constrains.
        header.caliber  .top(with: view, .top, offset: -20)
                        .left(with: view, .left)
                        .right(with: view, .right)
                        .aspect = 2560/1080
        
        backgroundIV.caliber    .top(with: header, .bottom, offset: 20)
                                    .left(with: view, .left, offset: 20)
                                    .right(with: view, .right, offset: -20)
                                    .bottom(with: view, .bottom, offset: -20)
                                    .ok()
        
        blurRect.caliber    .bottom(with: backgroundIV, .bottom, offset: -20)
                            .right(with: backgroundIV, .right, offset: -20)
                            .left(with: backgroundIV, .left, offset: 20)
                            .height = 60
        
        summary.caliber.fit(inside: blurRect.contentView)
        
    }
    
    func setup(){
        
        header.image = #imageLiteral(resourceName: "Header")
        header.contentMode = .scaleAspectFill
        header.clipsToBounds = true
        
        backgroundIV.image = #imageLiteral(resourceName: "background")
        backgroundIV.contentMode = .scaleAspectFill
        backgroundIV.layer.cornerRadius = 20
        backgroundIV.clipsToBounds = true
        
        blurRect.layer.cornerRadius = 20
        blurRect.clipsToBounds = true
        
        summary.text = "Implementing AutoLayout constrains programmatically made dead simple."
        summary.textColor = UIColor.white
        summary.numberOfLines = 2
        summary.font = UIFont.boldSystemFont(ofSize: summary.font.pointSize)
        summary.textAlignment = .center
        summary.adjustsFontSizeToFitWidth = true
    }

}


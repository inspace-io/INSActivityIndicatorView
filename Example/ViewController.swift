//
//  ViewController.swift
//  Example
//
//  Created by Dawid Płatek on 31/10/2019.
//  Copyright © 2019 Inspace Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var indicatorViews: [INSActivityIndicatorView]!
    
    @IBOutlet private var linearIndicatorView: INSActivityIndicatorView!
    @IBOutlet private var easeInIndicatorView: INSActivityIndicatorView!
    @IBOutlet private var easeOutIndicatorView: INSActivityIndicatorView!
    @IBOutlet private var easeInOutIndicatorView: INSActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        linearIndicatorView.timingFunction = CAMediaTimingFunction(name: .linear)
        easeInIndicatorView.timingFunction = CAMediaTimingFunction(name: .easeIn)
        easeOutIndicatorView.timingFunction = CAMediaTimingFunction(name: .easeOut)
        easeInOutIndicatorView.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        indicatorViews.forEach { (indicatorView) in
            indicatorView.startAnimating()
        }
        
        let indicatorView = INSActivityIndicatorView()
        indicatorView.frame.size = CGSize(width: 60, height: 60)
        indicatorView.center = view.center
        
        view.addSubview(indicatorView)
        
        indicatorView.startAnimating()
    }
}


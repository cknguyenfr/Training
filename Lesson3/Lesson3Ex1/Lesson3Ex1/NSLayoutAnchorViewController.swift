//
//  NSLayoutAnchorViewController.swift
//  Lesson3Ex1
//
//  Created by Can Khac Nguyen on 7/11/18.
//  Copyright © 2018 Can Khac Nguyen. All rights reserved.
//

import UIKit

class NSLayoutAnchorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let redView = UIView()
        redView.backgroundColor = UIColor.red
        self.view.addSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        redView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        redView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2).isActive = true
        
        let blueView = UIView()
        blueView.backgroundColor = UIColor.cyan
        self.view.addSubview(blueView)
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 0).isActive = true
        blueView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        blueView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        
        let orangeView = UIView()
        orangeView.backgroundColor = UIColor.orange
        self.view.addSubview(orangeView)
        orangeView.translatesAutoresizingMaskIntoConstraints = false
        orangeView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 0).isActive = true
        orangeView.leadingAnchor.constraint(equalTo: blueView.trailingAnchor, constant: 0).isActive = true
        orangeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        orangeView.heightAnchor.constraint(equalTo: blueView.heightAnchor, multiplier: 1/2).isActive = true
        
        let greenView = UIView()
        greenView.backgroundColor = UIColor.green
        self.view.addSubview(greenView)
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.topAnchor.constraint(equalTo: orangeView.bottomAnchor, constant: 0).isActive = true
        greenView.leadingAnchor.constraint(equalTo: blueView.trailingAnchor, constant: 0).isActive = true
        greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        greenView.widthAnchor.constraint(equalTo: orangeView.widthAnchor, multiplier: 1/2).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

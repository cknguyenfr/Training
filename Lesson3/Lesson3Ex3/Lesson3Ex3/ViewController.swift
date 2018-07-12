//
//  ViewController.swift
//  Lesson3Ex3
//
//  Created by Can Khac Nguyen on 7/12/18.
//  Copyright © 2018 Can Khac Nguyen. All rights reserved.
//

import UIKit
class MyButton : UIButton{
    open override func draw(_ rect: CGRect) {
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2.0
        self.clipsToBounds = true
        layer.masksToBounds = true
        layer.cornerRadius = 10.0
    }
}
class MyViewContainer: UIView {
    override func draw(_ rect: CGRect) {
        self.clipsToBounds = true
        layer.masksToBounds = true
        layer.cornerRadius = 10.0
    }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

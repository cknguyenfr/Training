//
//  ViewController.swift
//  CalculateAutolayout
//
//  Created by Can Khac Nguyen on 7/10/18.
//  Copyright © 2018 Can Khac Nguyen. All rights reserved.
//

import UIKit

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
class ZeroButton : UIButton{
    override func draw(_ rect: CGRect) {
        self.titleEdgeInsets = UIEdgeInsets(top: self.bounds.size.height / 2, left: self.bounds.size.width / 4, bottom: self.bounds.size.height / 2, right: 0)
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1.0
    }
}
extension UIButton{
    open override func draw(_ rect: CGRect) {
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1.0
    }
}


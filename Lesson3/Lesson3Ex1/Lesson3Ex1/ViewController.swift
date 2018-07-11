//
//  ViewController.swift
//  Lesson3Ex1
//
//  Created by Can Khac Nguyen on 7/11/18.
//  Copyright © 2018 Can Khac Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func btnChangeToNSLayoutConstrainsClicked(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NSLayoutConstrainViewController") as! NSLayoutConstrainViewController
        self.present(vc, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension UIButton{
    open override func draw(_ rect: CGRect) {
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1.0
    }
}

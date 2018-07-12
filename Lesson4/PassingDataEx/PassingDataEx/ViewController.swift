//
//  ViewController.swift
//  PassingDataEx
//
//  Created by Can Khac Nguyen on 7/12/18.
//  Copyright © 2018 Can Khac Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfResult: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "VC A"
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(tapBG(recognizer:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapBG(recognizer: UITapGestureRecognizer){
        tfResult.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let des = segue.destination as? ViewControllerB{
            des.resultStr = (tfResult.text == nil) ? "..." : tfResult.text!
        }
    }
    
    @IBAction func btnChangeViewClicked(_ sender: Any) {
        tfResult.endEditing(true)
    }
    
}

class MyButton : UIButton{
    override func draw(_ rect: CGRect) {
        layer.masksToBounds = true
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
    }
}

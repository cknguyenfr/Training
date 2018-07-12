//
//  ViewControllerC.swift
//  PassingDataEx
//
//  Created by Can Khac Nguyen on 7/12/18.
//  Copyright © 2018 Can Khac Nguyen. All rights reserved.
//

import UIKit
class ViewControllerC: UIViewController {
    @IBOutlet weak var lblResult: UILabel!
    var resultStr : String?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lblResult.text = resultStr
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension ViewControllerC : ViewControllerBDelegate{
    func passData(data: String) {
        resultStr = data
    }
}

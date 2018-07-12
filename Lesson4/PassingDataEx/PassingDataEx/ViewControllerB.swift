//
//  ViewControllerB.swift
//  PassingDataEx
//
//  Created by Can Khac Nguyen on 7/12/18.
//  Copyright © 2018 Can Khac Nguyen. All rights reserved.
//

import UIKit
protocol ViewControllerBDelegate : class{
    func passData(data: String)
}
class ViewControllerB: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    weak var delegate : ViewControllerBDelegate?
    var resultStr : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        lblResult.text = resultStr
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btnChangeViewClicked(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewControllerC") as! ViewControllerC
        self.delegate = vc
        self.navigationController?.pushViewController(vc, animated: true)
        if let delegate = self.delegate{
            delegate.passData(data: resultStr)
        }
    }
}

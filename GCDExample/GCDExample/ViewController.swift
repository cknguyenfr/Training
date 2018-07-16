//
//  ViewController.swift
//  GCDExample
//
//  Created by Can Khac Nguyen on 7/16/18.
//  Copyright © 2018 Can Khac Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblInfo: UITableView!
    
    var data : [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("start")
        DispatchQueue.global(qos: .userInitiated).async {
            let group = DispatchGroup()
            DispatchQueue.global().async {
                group.enter()
                print("Task A done")
                group.leave()
            }
            DispatchQueue.global().async {
                group.enter()
                print("Task B done")
                group.leave()
            }
            group.wait(timeout: DispatchTime.now() + 5)
            group.notify(queue: DispatchQueue.main, execute: {
                print("end")
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GitInfoCell") as? GitInfoCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}

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
    
    var data : [GitInfo] = [GitInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblInfo.estimatedRowHeight = 80
        self.tblInfo.rowHeight = UITableViewAutomaticDimension
        self.tblInfo.separatorStyle = .none
        let router = APIRouter()
        router.delegate = self
        router.getInfoFromGitAPI()
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        cell.lblName.text = data[indexPath.row].name
        cell.lblDescription.text = (data[indexPath.row].description == nil) ? " " : data[indexPath.row].description!
        cell.lblOwnerID.text = (data[indexPath.row].ownerID == nil) ? "" : String(data[indexPath.row].ownerID!)
        return cell
    }
}
extension ViewController: APIRouterDelegate{
    func completionWithData(data: [GitInfo]) {
        DispatchQueue.main.async {
            self.data = data
            self.tblInfo.reloadData()
        }
    }
}

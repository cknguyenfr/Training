//
//  ViewController.swift
//  TableViewPj
//
//  Created by Can Khac Nguyen on 7/13/18.
//  Copyright © 2018 Can Khac Nguyen. All rights reserved.
//

import UIKit
class Song{
    var image : UIImage!
    var title : String!
    var description : String!
    
    init(image: UIImage, title: String, description: String) {
        self.image = image
        self.title = title
        self.description = description
    }
    
}
class ViewController: UIViewController {

    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var tblList: UITableView!
    
    var listSong = [Song]()
    var listLine = [[Song]]()
    let NUMBER_SECTION = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareData()
        tblList.delegate = self
        tblList.dataSource = self
        tblList.estimatedSectionFooterHeight = 120
        tblList.rowHeight = UITableViewAutomaticDimension
        tblList.separatorStyle = .none
        tblList.addSubview(refreshControl)
    }

    func prepareData(){
        let songA = Song(image: #imageLiteral(resourceName: "avatarTypeC"), title: "Too good at goodbyes", description: "It's sad but it's true")
        let songB = Song(image: #imageLiteral(resourceName: "avatarTypeA"), title: "I'm not the only one", description: "qưerty uiop ádf ghjkl zxcvbnm qẻio adkfjk kandf xnvlakdf oieqe")
        let songC = Song(image: #imageLiteral(resourceName: "avatarTypeB"), title: "Lost star Sugar Girls like you Animal Payphone", description: "jjjjjjj kkkkk llll")
        for _ in 0..<3{
            listSong = [Song]()
            listSong.append(songA)
            listSong.append(songB)
            listSong.append(songC)
            listLine.append(listSong)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // pull to refresh
    lazy var refreshControl : UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.blue
        refreshControl.addTarget(self, action: #selector(handleRefeshAction(_:)), for: UIControlEvents.valueChanged)
        return refreshControl
        
    }()
    
    @objc func handleRefeshAction(_ refreshControl: UIRefreshControl){
        self.tblList.reloadData()
        self.refreshControl.endRefreshing()
    }

    //action handle swipe
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            self.listLine[indexPath.section].remove(at: indexPath.row)
            self.tblList.deleteRows(at: [indexPath], with: .fade)
            completion(true)
        }
        action.image = #imageLiteral(resourceName: "deleteSwipe")
        action.backgroundColor = UIColor.red
        return action
    }
    
    func loadMore(){
        let songA = Song(image: #imageLiteral(resourceName: "avatarTypeC"), title: "Too good at goodbyes", description: "It's sad but it's true")
        for _ in 0..<10{
            listLine[2].append(songA)
        }
        self.tblList.reloadData()
    }
    @IBAction func btnEditClicked(_ sender: Any) {
        self.tblList.isEditing = !self.tblList.isEditing
        if self.tblList.isEditing{
            btnEdit.setTitle("Cancel", for: .normal)
        }else{
            btnEdit.setTitle("Edit", for: .normal)
        }
        
        self.tblList.reloadData()
    }
}
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return NUMBER_SECTION
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listLine[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.lblTitle.text = listLine[indexPath.section][indexPath.row].title
        cell.lblDescription.text = listLine[indexPath.section][indexPath.row].description
        cell.imvAvatar.image = listLine[indexPath.section][indexPath.row].image
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.lightGray
        
        let lblTitle = UILabel()
        lblTitle.textColor = UIColor.white
        if section == 0{
            lblTitle.text = "SAM SMITH"
        }else if section == 1{
            lblTitle.text = "ADAM LEVIN"
        }else{
            lblTitle.text = "RANDOM"
        }
        header.addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.leftAnchor.constraint(equalTo: header.leftAnchor, constant: 10).isActive = true
        lblTitle.centerYAnchor.constraint(equalTo: header.centerYAnchor, constant: 0).isActive = true
        lblTitle.centerXAnchor.constraint(equalTo: header.centerXAnchor, constant: 0).isActive = true
        lblTitle.topAnchor.constraint(equalTo: header.topAnchor, constant: 10).isActive = true
        
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if listLine[section].count == 0{
            return 0
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let songMove = listLine[sourceIndexPath.section][sourceIndexPath.row]
        listLine[destinationIndexPath.section].insert(songMove, at: destinationIndexPath.row)
        listLine[sourceIndexPath.section].remove(at: sourceIndexPath.row)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let lastItem = listLine[2].count
        if indexPath.section == 2 && indexPath.row == lastItem - 1{
            loadMore()
        }
    }
}

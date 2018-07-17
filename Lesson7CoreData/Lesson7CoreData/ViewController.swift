//
//  ViewController.swift
//  Lesson7CoreData
//
//  Created by Can Khac Nguyen on 7/17/18.
//  Copyright © 2018 Can Khac Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tblPeople: UITableView!
    
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfID: UITextField!
    
    let DATATABLE = "PersonData"
    var people = [PersonData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tblPeople.estimatedRowHeight = 80
        tblPeople.rowHeight = UITableViewAutomaticDimension
        tblPeople.separatorStyle = .none
        tfAge.keyboardType = .numberPad
        tfID.keyboardType = .numberPad
        people = CoreDataManager.shared.showAll(table: DATATABLE)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnInsertClicked(_ sender: Any) {
        guard let id = Int(tfID.text!), let age = Int(tfAge.text!), let name = tfName.text else {
            UIAlertView(title: "Warning", message: "Fill all information before inserting", delegate: self, cancelButtonTitle: "OK", otherButtonTitles: "").show()
            return
        }
        
        let person = Person(id: id, name: name, age: age)
        if CoreDataManager.shared.insertPersonTo(table: DATATABLE, person: person){
            tfID.text = ""
            tfName.text = ""
            tfAge.text = ""
            people = CoreDataManager.shared.showAll(table: DATATABLE)!
            tblPeople.reloadData()
        }
    }
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            CoreDataManager.shared.deletePerson(table: self.DATATABLE, _id: Int(self.people[indexPath.row].id))
            self.people.remove(at: indexPath.row)
            self.tblPeople.deleteRows(at: [indexPath], with: .fade)
            completion(true)
        }
        action.image = #imageLiteral(resourceName: "deleteButton")
        action.backgroundColor = UIColor.red
        return action
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell") as? PersonCell else {
            return UITableViewCell()
        }
        cell.lblID.text = String(people[indexPath.row].id)
        cell.lblName.text = people[indexPath.row].name
        cell.lblAge.text = String(people[indexPath.row].age)
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }
}
extension UIButton{
    open override func draw(_ rect: CGRect) {
        layer.borderColor = UIColor.orange.cgColor
        layer.borderWidth = 1.0
    }
}
extension ViewController: UIAlertViewDelegate, UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}

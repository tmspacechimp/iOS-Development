//
//  TableViewController.swift
//  ContactBook
//
//  Created by tato maisuradze on 05.01.22.
//

import UIKit

class ContactSection {
    var id: String
    var header: ContactHeaderModel?
    var contacts = [ContactCellModel]()
    
    init(id: String, header: ContactHeaderModel, contacts: [ContactCellModel] ){
        self.header = header
        self.contacts = contacts
        self.id = id
    }
}



class TableViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var numberField: UITextField!
    @IBOutlet var button : UIButton!
    
    
    private var data = [ContactSection]()
    private var nameText: String?
    private var lastNameText: String?
    private var numberText: String?
    private var showFavourites : Bool = false
    
    let possibleNumberChars: Set = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.keyboardDismissMode = .interactive
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: "ContactCell", bundle: nil),
            forCellReuseIdentifier: "ContactCell"
        )
        tableView.register(
            UINib(nibName: "ContactHeader", bundle: nil),
            forHeaderFooterViewReuseIdentifier: "ContactHeader"
        )
        
        createContacts()
        
        }
     
    private func createContacts(){
        data = [
            ContactSection(
                id: "a",
                header: ContactHeaderModel(title: "a"),
                contacts: [
                    ContactCellModel(firstName: "aba", lastName: "he", number: "123123"),
                    ContactCellModel(firstName: "abel", lastName: "truj", number: "12883123")
                ]
            ),
            ContactSection(
                id: "b",
                header: ContactHeaderModel(title: "b"),
                contacts: [
                    ContactCellModel(firstName: "baba", lastName: "he", number: "1323123"),
                    ContactCellModel(firstName: "babel", lastName: "truj", number: "128843123")
                ]
            ),
            ContactSection(
                id: "c",
                header: ContactHeaderModel(title: "c"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "d",
                header: ContactHeaderModel(title: "d"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "e",
                header: ContactHeaderModel(title: "e"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "f",
                header: ContactHeaderModel(title: "f"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "g",
                header: ContactHeaderModel(title: "g"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "h",
                header: ContactHeaderModel(title: "h"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "i",
                header: ContactHeaderModel(title: "i"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "j",
                header: ContactHeaderModel(title: "j"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "k",
                header: ContactHeaderModel(title: "k"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "l",
                header: ContactHeaderModel(title: "l"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "m",
                header: ContactHeaderModel(title: "m"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "n",
                header: ContactHeaderModel(title: "n"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "o",
                header: ContactHeaderModel(title: "o"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "p",
                header: ContactHeaderModel(title: "p"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "q",
                header: ContactHeaderModel(title: "q"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "r",
                header: ContactHeaderModel(title: "r"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "s",
                header: ContactHeaderModel(title: "s"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "t",
                header: ContactHeaderModel(title: "t"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "u",
                header: ContactHeaderModel(title: "u"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "v",
                header: ContactHeaderModel(title: "v"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "w",
                header: ContactHeaderModel(title: "w"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "x",
                header: ContactHeaderModel(title: "x"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "y",
                header: ContactHeaderModel(title: "y"),
                contacts: [
                ]
            ),
            ContactSection(
                id: "z",
                header: ContactHeaderModel(title: "z"),
                contacts: [
                ]
            )
        ]
    }
    
    @IBAction func add(){
        let name = nameField.text ?? ""
        let lastName = lastNameField.text ?? ""
        let number = numberField.text ?? ""
        guard let id = lastName.isEmpty == false ? lastName.first : name.first else { return }
        guard name.isEmpty == false && validateNumber(number) else {return}
        if let sectionIndex = data.firstIndex(where: {$0.id == String(id)}){
            data[sectionIndex].contacts.append(ContactCellModel(firstName: name, lastName: lastName, number: number))
            data[sectionIndex].contacts.sort(by: {
                if($0.lastName.isEmpty && $1.lastName.isEmpty){return $0.firstName < $1.firstName}
                else if ($0.lastName.isEmpty) {return $0.firstName < $1.lastName}
                else if ($1.lastName.isEmpty) {return $0.lastName < $1.firstName}
                else {return $0.lastName < $1.lastName}
            })
            tableView.reloadSections(IndexSet(integer: sectionIndex), with: .automatic)
            nameField.text = nil
            lastNameField.text = nil
            numberField.text = nil
            nameField.resignFirstResponder()
            lastNameField.resignFirstResponder()
            numberField.resignFirstResponder()
            
        }
        
        
    }
    
    func validateNumber(_ number: String) -> Bool {
        if (number.isEmpty){return false}
        for char in number {
            if (possibleNumberChars.contains(String(char)) == false)
                {return false}
        }
        return true
    }
    
    func deleteContact(_ indexPath: IndexPath){
        data[indexPath.section].contacts.remove(at: indexPath.row)
        data[indexPath.section].contacts.sort(by: {
            if($0.lastName.isEmpty && $1.lastName.isEmpty){return $0.firstName < $1.firstName}
            else if ($0.lastName.isEmpty) {return $0.firstName < $1.lastName}
            else if ($1.lastName.isEmpty) {return $0.lastName < $1.firstName}
            else {return $0.lastName < $1.lastName}
        })
        tableView.reloadSections(IndexSet(integer: indexPath.section), with: .automatic)
    }
    
    @objc func firstNameTextChanged(textField: UITextField){
        nameText = textField.text
    }
    
    @objc func lastNameTextChanged(textField: UITextField){
        lastNameText = textField.text
    }
    
    @objc func numberTextChanged(textField: UITextField){
        numberText = textField.text
    }
    
    
    @IBAction func openAlert(){
        
        let alert = UIAlertController(
            title: "New Contact",
            message: "",
            preferredStyle: .alert
        )
        alert.addTextField{ [unowned self] textField in
            textField.placeholder = "First Name"
            textField.keyboardType = .default
            textField.addTarget(self, action: #selector(self.firstNameTextChanged(textField:)), for: .editingChanged)
        }
        alert.addTextField{ [unowned self] textField in
            textField.placeholder = "Last Name"
            textField.keyboardType = .default
            textField.addTarget(self, action: #selector(self.lastNameTextChanged(textField: )), for: .editingChanged)
        }
        alert.addTextField{ [unowned self] textField in
            textField.placeholder = "Number"
            textField.keyboardType = .decimalPad
            textField.addTarget(self, action: #selector(numberTextChanged(textField:)), for: .editingChanged)
        }
        alert.addAction(
            UIAlertAction(
                title: "Submit",
                style: .default,
                handler: { [unowned self] _ in
                    let name = nameText ?? ""
                    let lastName = lastNameText ?? ""
                    let number = numberText ?? ""
                    guard name.isEmpty == false && validateNumber(number) else {
                        nameText = nil
                        lastNameText = nil
                        numberText = nil
                        return
                        
                    }
                    guard let id = lastName.isEmpty == false ? lastName.first : name.first else {
                        nameText = nil
                        lastNameText = nil
                        numberText = nil
                        return
                        
                    }
                    
                    if let sectionIndex = data.firstIndex(where: {$0.id == String(id)}){
                        data[sectionIndex].contacts.append(ContactCellModel(firstName: name, lastName: lastName, number: number))
                        data[sectionIndex].contacts.sort(by: {
                            if($0.lastName.isEmpty && $1.lastName.isEmpty){return $0.firstName < $1.firstName}
                            else if ($0.lastName.isEmpty) {return $0.firstName < $1.lastName}
                            else if ($1.lastName.isEmpty) {return $0.lastName < $1.firstName}
                            else {return $0.lastName < $1.lastName}
                        })
                        tableView.reloadSections(IndexSet(integer: sectionIndex), with: .automatic)
                        nameText = nil
                        lastNameText = nil
                        numberText = nil
                    }
                }
            )
        )
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
//     @IBAction func changeFavouriteStatus() {
//       showFavourites = true
//       tableView.reloadData()
//       // functionality not complete
//    }
    
    
}


extension TableViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].contacts.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerModel = data[section].header else {return nil}
        let header =  tableView.dequeueReusableHeaderFooterView(withIdentifier: "ContactHeader")
        if let contactHeader = header as? ContactHeader {
            contactHeader.configure(with: headerModel)
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return data[section].contacts.count == 0 ? 0 : 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        if let contactCell = cell as? ContactCell{
            contactCell.configure(with: data[indexPath.section].contacts[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        
        return UISwipeActionsConfiguration(actions: [
            UIContextualAction(style: .destructive, title: "Delete", handler: { _,_,_ in
                self.deleteContact(indexPath)
            }),
        ])
    }
}

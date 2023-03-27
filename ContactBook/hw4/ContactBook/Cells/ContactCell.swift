//
//  ContactCell.swift
//  ContactBook
//
//  Created by tato maisuradze on 05.01.22.
//

import UIKit

struct ContactCellModel {
    var firstName: String = ""
    var lastName: String = ""
    var number: String = ""
    var isFavourite: Bool = false
    
    init(firstName: String, lastName: String, number: String){
        self.firstName = firstName
        self.lastName = lastName
        self.number = number
    }
    
}

class ContactCell: UITableViewCell {
    
    @IBOutlet private var label : UILabel!

    private var model: ContactCellModel!
    
    func configure(with model: ContactCellModel){
        label.text = model.firstName + " " + model.lastName
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

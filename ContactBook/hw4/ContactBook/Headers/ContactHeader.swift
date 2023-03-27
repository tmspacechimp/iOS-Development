//
//  ContactHeader.swift
//  ContactBook
//
//  Created by tato maisuradze on 05.01.22.
//

import UIKit

struct ContactHeaderModel {
    var title: String
    
    init(title: String){
        self.title = title
    }
}


class ContactHeader: UITableViewHeaderFooterView {
    
    @IBOutlet var label: UILabel!
    
    func configure(with model: ContactHeaderModel){
        label.text = model.title
    }
}

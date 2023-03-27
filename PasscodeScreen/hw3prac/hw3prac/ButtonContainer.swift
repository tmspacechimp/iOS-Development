//
//  ButtonContainer.swift
//  hw3prac
//
//  Created by tato maisuradze on 10.12.21.
//

import UIKit

class ButtonContainer : UIView {
    
    @IBOutlet var contentView : UIView!
    @IBOutlet var numberView : UIView!
    @IBOutlet var lettersView : UIView!
    @IBOutlet var numberLabel : UILabel!
    @IBOutlet var lettersLabel : UILabel!
    @IBOutlet var button : UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setup()
    }
    
    func commonInit(){
        let bundle = Bundle(for: tm1.self)
        bundle.loadNibNamed("tm1", owner: self, options: nil)
        
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(contentView)
    }
    
    func setup(){
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.white.cgColor
    }
}


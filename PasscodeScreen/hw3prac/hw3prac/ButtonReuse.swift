//
//  ButtonReuse.swift
//  hw3prac
//
//  Created by tato maisuradze on 10.12.21.
//

import UIKit

class ButtonReuse : UIView {
    
    @IBOutlet var contentView : UIView!
    @IBOutlet var subContentView : UIView!
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
        let bundle = Bundle(for: ButtonReuse.self)
        bundle.loadNibNamed("ButtonReuse", owner: self, options: nil)
        
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(contentView)
    }
    
    func setup(){
        
    }
    
    func setNumber( number : String ){
        numberLabel.text = number
    }
    
    func setLetters( letters : String){
        lettersLabel.text = letters
    }
    
    func getNumber() -> String {
        return numberLabel.text!
    
    }
}

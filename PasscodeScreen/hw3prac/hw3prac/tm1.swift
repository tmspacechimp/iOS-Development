//
//  tm1.swift
//  hw3prac
//
//  Created by tato maisuradze on 10.12.21.
//

import UIKit

class tm1 : UIView {
    
    @IBOutlet var contentView : UIView!
    
    @IBOutlet var insideView : UIView!
    
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
        
    }
}

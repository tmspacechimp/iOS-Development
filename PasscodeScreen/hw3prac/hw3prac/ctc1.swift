//
//  ctc1.swift
//  hw3prac
//
//  Created by tato maisuradze on 05.12.21.
//

import UIKit

class ctc1: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var cttc1 : UIView!
    @IBOutlet weak var circ1 : UIView!
    let nibName = "ctc1"
       
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
       
       func commonInit() {
           let bundle = Bundle(for: ctc1.self)
           bundle.loadNibNamed("ctc1", owner: self, options: nil)
           
           self.frame = bounds
           self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
           addSubview(circ1)
       }
       
      
    func setup(){
        circ1.backgroundColor = .black
    }

}

//
//  ViewController.swift
//  hw3prac
//
//  Created by tato maisuradze on 05.12.21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var backgroundImage : UIImageView!
    @IBOutlet var numberButtons : [ButtonReuse]!
    @IBOutlet var cv : UIView!
    @IBOutlet var circles : [UIImageView]!
    @IBOutlet var delete : UIButton!
    
    var curpass : String = ""
    let corpass : String = "1111"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        backgroundImage.addSubview(cv)
        
        var count : Int = 0
        for _ in numberButtons {
            numberButtons[count].setNumber( number : String(count))
            count += 1
        }
        
        setLetters();
        
        
    }
    
    func setLetters(){
        numberButtons[2].setLetters(letters: "ABC")
        numberButtons[3].setLetters(letters: "DEF")
        numberButtons[4].setLetters(letters: "GHI")
        numberButtons[5].setLetters(letters: "JKL")
        numberButtons[6].setLetters(letters: "MNO")
        numberButtons[7].setLetters(letters: "PQRS")
        numberButtons[8].setLetters(letters: "TUV")
        numberButtons[9].setLetters(letters: "WXYZ")
        
    }
    
    func buttonClicked(_ sender: AnyObject?) {
        if sender === numberButtons[0].button {
            addToPass(num: "0")
        } else if sender === numberButtons[1].button{
            addToPass(num: "0")
        } else if sender ===  numberButtons[2].button {
            addToPass(num: "0")
            
        } else  if sender === numberButtons[3].button {
            addToPass(num: "0")
            
        } else if sender === numberButtons[4].button {
            addToPass(num: "0")
            
        } else if sender ===  numberButtons[5].button {
            addToPass(num: "0")
            
        } else if sender === numberButtons[6].button {
            addToPass(num: "0")
        } else if sender === numberButtons[7].button {
            addToPass(num: "0")
            
        } else if sender ===  numberButtons[8].button {
            addToPass(num: "0")
            
        } else if sender ===  numberButtons[9].button {
            addToPass(num: "0")
        } else {
            
        }
        
    }
    
    
    
    func addToPass(num : String) {
        if (curpass.count < 3){
            curpass += num
            updateSize(count : curpass.count)
        } else {
            curpass += num
            updateSize(count : curpass.count)
            checkPass()
        }
    }
    
    func updateSize(count : Int){
        var cnt = count
        for circle in circles {
            if (cnt == 0){
                circle.isHidden = true
            } else{
                circle.isHidden = false
                cnt -= 1
            }
        }
    }
    
    func deleteFromPass(){
        if(curpass.count != 0){
            curpass = String(curpass.dropLast())
            updateSize(count: curpass.count)
        }
    }
    
    func checkPass(){
        if( corpass == curpass){
            goToNextPage()
        }
    }
    
    func goToNextPage(){
        // TODO
    }
    
    
}



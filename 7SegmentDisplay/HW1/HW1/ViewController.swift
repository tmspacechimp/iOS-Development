//
//  ViewController.swift
//  HW1
//
//  Created by tato maisuradze on 19.10.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet
    var firstDigitSegments : [UIView]!
    @IBOutlet
    var secondDigitSegments : [UIView]!
    @IBOutlet
    var thirdDigitSegments : [UIView]!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numberToBeDisplayed : Int = 780
        let numToStr = String(numberToBeDisplayed)
        let allComps : [[UIView]] = [firstDigitSegments, secondDigitSegments, thirdDigitSegments]
        var i = 0
        for component in allComps{
            
        let range = numToStr.index(numToStr.startIndex, offsetBy: i)...numToStr.index(numToStr.startIndex, offsetBy: i)
            
            displayDigit(digit: String(numToStr[range]), component: component)
            i+=1
        }
    }
    
    func displayDigit(digit : String, component: [UIView]){
        let arr = getDigitSegmentsArray(char: digit)
        for segment in arr {
            component[segment].backgroundColor = .black
        }
    }
    
    func getDigitSegmentsArray( char : String) -> [Int]{
        switch char {
        case "1" : return [Segments.VerticalNE.rawValue, Segments.VerticalSE.rawValue]
        case "2" : return [Segments.HorizontalTop.rawValue,Segments.VerticalNE.rawValue,
                           Segments.HorizontalMid.rawValue,Segments.VerticalSW.rawValue,
                           Segments.HorizontalBot.rawValue]
        case "3" : return [Segments.HorizontalTop.rawValue,Segments.VerticalNE.rawValue,
                           Segments.HorizontalMid.rawValue, Segments.VerticalSE.rawValue,
                           Segments.HorizontalBot.rawValue]
        case "4" : return [Segments.VerticalNE.rawValue, Segments.VerticalNW.rawValue, Segments.VerticalSE.rawValue, Segments.HorizontalMid.rawValue]
        case "5" : return [Segments.VerticalNW.rawValue, Segments.VerticalSE.rawValue, Segments.HorizontalBot.rawValue, Segments.HorizontalMid.rawValue,        Segments.HorizontalTop.rawValue]
        case "6" : return [Segments.VerticalNW.rawValue, Segments.VerticalSE.rawValue, Segments.HorizontalBot.rawValue, Segments.HorizontalMid.rawValue,        Segments.HorizontalTop.rawValue, Segments.VerticalSW.rawValue]
        case "7" : return [Segments.VerticalNE.rawValue, Segments.VerticalSE.rawValue, Segments.HorizontalTop.rawValue ]
            
        case "8" : return Array(0...6)
            
        case "9" : return [Segments.HorizontalTop.rawValue,Segments.VerticalNE.rawValue,
                           Segments.HorizontalMid.rawValue, Segments.VerticalSE.rawValue,
                           Segments.HorizontalBot.rawValue, Segments.VerticalNW.rawValue]
        case "0" : return [Segments.VerticalNE.rawValue, Segments.VerticalNW.rawValue, Segments.HorizontalTop.rawValue, Segments.HorizontalBot.rawValue,
            Segments.VerticalSE.rawValue, Segments.VerticalSW.rawValue]
        default : return []
        }
    }
    
    enum Segments : Int{
        case HorizontalTop
        case HorizontalMid
        case HorizontalBot
        case VerticalNW
        case VerticalSW
        case VerticalNE
        case VerticalSE
    }


}


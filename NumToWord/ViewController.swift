//
//  ViewController.swift
//  NumToWord
//
//  Created by Andy Wu on 1/25/17.
//  Copyright © 2017 Andy Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var numberInput: UITextField!

    @IBOutlet weak var letterOutput: UILabel!
    
    var wordArray = [String]()
    
    var currIndex: Int = 0
    
    var charIndex: Int = 0
    
    @IBAction func convert() {
        
        self.wordArray.removeAll()
        
        self.currIndex = 0
        
        var numStr: String = numberInput.text!
        
        let lev = ["","Thousand","Million","Billion"]
        
        var lcnt = 0;
        
        
        
        while(true){
        
            let cnt = numStr.characters.count
            var wcout = self.wordArray.count
        
            if(cnt<=3){
                
                threeNums(numStrn: numStr)
                
                if(cnt == 3){
                    self.wordArray.insert("Hundred", at: self.wordArray.count-1)
                }
                
                
                
                self.wordArray.insert(lev[lcnt], at: wcout)
                
                break
            }
            
            let index = numStr.index(numStr.startIndex, offsetBy: cnt - 3)
            let three = numStr.substring(from: index)
            numStr = numStr.substring(to: index)
            
            threeNums(numStrn: three)
            if(self.wordArray.count-wcout>0){
                
                let hindex = three.index(three.startIndex, offsetBy:1 )
                let h = three.substring(to:hindex)
                if(h != "0"){
                    self.wordArray.insert("Hundred", at: self.wordArray.count-1)
                }
                
                
                if(lcnt==0){
                    if(h != "0" ){
                        if(self.wordArray.count-wcout>2){
                            self.wordArray.insert("and", at: self.wordArray.count-2)
                        }
                    }
                    else {
                        self.wordArray.append("and")
                    }
                }
                else{
                    self.wordArray.insert(lev[lcnt], at: wcout)
                }
                
            }
            
            lcnt += 1
            
            
        
        
        }
        
       
        // Print Word Array At The End
        
        //print(self.wordArray)
        
        
        let newArray = self.wordArray.reversed()
        
        var finalStr: String = ""
        
        for item in newArray {
            finalStr += item
            finalStr += " "
        }
        
        //print(finalStr)
        self.letterOutput.text = finalStr
 
    }
    
    func twoNums (numStrn: String) {
        var numCount = numStrn.characters.count
        
        //Handle One and Tens Place
        while numCount != 0 {
            let index = numStrn.index(numStrn.startIndex, offsetBy: numCount - 1)
            let indexNum = Int(String(numStrn[index]))!
            
            if numCount == 2 {
                printOnesPlace(num:indexNum)
            }
            else if numCount == 1 {
                
                let index2 = numStrn.index(numStrn.startIndex, offsetBy: numCount)
                let indexNum2 = Int(String(numStrn[index2]))!
                
                if indexNum == 1 {
                    printTensPlace(num: (indexNum * 10) + indexNum2)
                }
                else {
                    printTensPlace(num: indexNum * 10)
                }
                
            }
            
            numCount -= 1
        }
        
    }
    
    
    func threeNums (numStrn: String) {
        var numCount = numStrn.characters.count
        
        if numCount == 1 {
            let firstNumStr = numStrn.startIndex
            let firstNum = Int(String(numStrn[firstNumStr]))!
            
            printOnesPlace(num: firstNum)
            
        }
        else if numCount == 2 {
            twoNums(numStrn: numStrn)
        }
        else if numCount > 2 {
            
            let firstNumChar = numStrn.startIndex
            let firstNum = Int(String(numStrn[firstNumChar]))!
            
            //Handle One and Tens Place
            while numCount > 1 {
                let index = numStrn.index(numStrn.startIndex, offsetBy: numCount - 1)
                let indexNum = Int(String(numStrn[index]))!
                
                if numCount == 3 {
                    printOnesPlace(num:indexNum)
                }
                else if numCount == 2 {
                    //printTensPlace(num: indexNum * 10)
                    
                    let index2 = numStrn.index(numStrn.startIndex, offsetBy: numCount)
                    let indexNum2 = Int(String(numStrn[index2]))!
                    
                    if indexNum == 1 {
                        printTensPlace(num: (indexNum * 10) + indexNum2)
                    }
                    else {
                        printTensPlace(num: indexNum * 10)
                    }
                    
                }
                numCount -= 1
                
            }
            
            //Handle Hundereds Place
           // printRestOfPlace(num: Int(pow(Double(10),Double(2))))
            
            printOnesPlace(num:firstNum)
        
        }
        
    }
    
    func printOnesPlace (num:Int) {
        var letterNum: String = ""
        
        switch num {
        case 1:
            letterNum = "One"
            break
        case 2:
            letterNum = "Two"
            break
        case 3:
            letterNum = "Three"
            break
        case 4:
            letterNum = "Four"
            break
        case 5:
            letterNum = "Five"
            break
        case 6:
            letterNum = "Six"
            break
        case 7:
            letterNum = "Seven"
            break
        case 8:
            letterNum = "Eight"
            break
        case 9:
            letterNum = "Nine"
            break
        default:
            break
        }
        
        if letterNum != "" {
            self.wordArray.append(letterNum)
        }
    }
    
    func printTensPlace (num: Int) {
        
        var letterNum: String = ""
        
        switch num {
        case 10:
            letterNum = ("Ten")
            break
        case 11:
            self.wordArray.removeLast()
            letterNum = ("Eleven")
            break
        case 12:
            self.wordArray.removeLast()
            letterNum = ("Twelve")
            break
        case 13:
            self.wordArray.removeLast()
            letterNum = ("Thirteen")
            break
        case 14:
            self.wordArray.removeLast()
            letterNum = ("Fourteen")
            break
        case 15:
            self.wordArray.removeLast()
            letterNum = ("Fifteen")
            break
        case 16:
            self.wordArray.removeLast()
            letterNum = ("Sixteen")
            break
        case 17:
            self.wordArray.removeLast()
            letterNum = ("Seventeen")
            break
        case 18:
            self.wordArray.removeLast()
            letterNum = ("Eighteen")
            break
        case 19:
            self.wordArray.removeLast()
            letterNum = ("Nineteen")
            break
        case 20:
            letterNum = ("Twenty")
            break
        case 30:
            letterNum = ("Thirty")
            break
        case 40:
            letterNum = ("Forty")
            break
        case 50:
            letterNum = ("Fifty")
            break
        case 60:
            letterNum = ("Sixty")
            break
        case 70:
            letterNum = ("Seventy")
            break
        case 80:
            letterNum = ("Eighty")
            break
        case 90:
            letterNum = ("Ninety")
            break
        default:
            break
        }
        
        if letterNum != "" {
            self.wordArray.append(letterNum)
        }
    }
    
    func printRestOfPlace (num: Int) {
        var letterNum: String = ""
        
        switch num {
        case 100:
            letterNum = "Hundred"
            break
        case 1000:
            letterNum = "Thousand"
            break
        case 10000:
            letterNum = "Thousand"
            break
        case 100000:
            letterNum = "Hundred"
            break
        case 1000000:
            letterNum = "Million"
            break
        case 100000000:
            letterNum = "Hundred"
            break
        case 1000000000:
            letterNum = "Billion"
            break
            
        default:
            break
        }
        
        if letterNum != "" {
            self.wordArray.append(letterNum)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

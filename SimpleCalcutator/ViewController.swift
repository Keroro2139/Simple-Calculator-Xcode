//
//  ViewController.swift
//  SimpleCalcutator
//
//  Created by informatics on 2/4/2560 BE.
//  Copyright © 2560 weerapat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ch : Bool = true
    var numberOnLabel : Double = 0
    var previousNumber : Double = 0
    var changeScreen : Bool = false
    var operate : Int = 0
    var checkOperate : Bool = true
    var keepNumber : Double = 0
    var ans :Double = 0
    var arrayOP : [String] = []
    var op : String = ""
    var OP : String = ""
    var show : Bool = false
    var check : Bool = false
    @IBOutlet weak var result: UILabel!
    @IBAction func ac(_ sender: Any) {
        result.text = "0"
        ch = true
        changeScreen = false
        numberOnLabel = 0
        previousNumber = 0
        operate = 0
        checkOperate = true
        keepNumber = 0
        ans = 0
        arrayOP = []
        op = ""
        OP = ""
        show = false
        check = false
    }
    
    @IBAction func dot(_ sender: Any) {
        if result.text == "0" {
            result.text = "0" + "."
            ch = false
        }
        else if ch && changeScreen {
            result.text = "0" + "."
            ch = false
            changeScreen = false
        }
        else if ch{
            result.text = result.text! + "."
            ch = false
        }
    }
    @IBAction func number(_ sender: UIButton) {
        if result.text == "0" || changeScreen {
            result.text = String(sender.tag)
            numberOnLabel = Double(result.text!)!
            changeScreen = false
        }
        else {
            result.text = result.text! + String(sender.tag)
            numberOnLabel = Double(result.text!)!
        }
        if !arrayOP.isEmpty {
            OP = arrayOP.remove(at: arrayOP.count-1)
            while !arrayOP.isEmpty {
                arrayOP.remove(at: arrayOP.count-1)
            }
        }
        checkOperate = true
    }
    @IBAction func operation(_ sender: UIButton) {
        if result.text != "Error" {
            if sender.tag == 10 {op = "+"}
            else if sender.tag == 11 {op = "-"}
            else if sender.tag == 12 {op = "*"}
            else if sender.tag == 13 {op = "/"}
            arrayOP.append(op)
            if sender.tag != 14 {
                previousNumber = Double(result.text!)!
                if sender.tag == 10 && checkOperate {
                    if OP == "+" {
                        ans = ans + previousNumber
                        show = true
                    }
                else if OP == "-" {
                        ans = ans - previousNumber
                        show = true
                    }
                    else if OP == "*" {
                        ans = ans * previousNumber
                        show = true
                    }
                    else if OP == "/" {
                        if previousNumber != 0 {
                            ans = ans / previousNumber
                            show = true
                        }
                        else if previousNumber == 0 {
                            check = true
                        }
                    }
                }
            else if sender.tag == 11 && checkOperate {
                if OP == "+" {
                    ans = ans + previousNumber
                    show = true
                }
                else if OP == "-" {
                    ans = ans - previousNumber
                    show = true
                }
                else if OP == "*" {
                    ans = ans * previousNumber
                    show = true
                }
                else if OP == "/" {
                    if previousNumber != 0 {
                        ans = ans / previousNumber
                        show = true
                    }
                    else if previousNumber == 0 {
                        check = true
                    }
                }
            }
            else if sender.tag == 12 && checkOperate {
                if OP == "+" {
                    ans = ans + previousNumber
                    show = true
                }
                else if OP == "-" {
                    ans = ans - previousNumber
                    show = true
                }
                else if OP == "*" {
                    ans = ans * previousNumber
                    show = true
                }
                else if OP == "/" {
                    if previousNumber != 0 {
                        ans = ans / previousNumber
                        show = true
                    }
                    else if previousNumber == 0 {
                        check = true
                    }
                }
            }
            else if sender.tag == 13 && checkOperate {
                if OP == "+" {
                    ans = ans + previousNumber
                    show = true
                }
                else if OP == "-" {
                    ans = ans - previousNumber
                    show = true
                }
                else if OP == "*" {
                    ans = ans * previousNumber
                    show = true
                }
                else if OP == "/" {
                    if previousNumber != 0 {
                        ans = ans / previousNumber
                        show = true
                    }
                    else if previousNumber == 0 {
                        check = true
                    }
                }
            }
            operate = sender.tag
        }
        else if sender.tag == 14 && checkOperate{
            if OP == "+" {
                ans = ans + numberOnLabel
                show = true
            }
            else if OP == "-" {
                ans = ans - numberOnLabel
                show = true
            }
            else if OP == "*" {
                ans = ans * numberOnLabel
                show = true
            }
            else if OP == "/" {
                if numberOnLabel != 0 {
                    ans = ans / numberOnLabel
                    show = true
                }
                else if numberOnLabel == 0 {
                    check = true
                }
            }
        }
        if show && !check {
            result.text = String(format: "%g", ans)
        }
        else if check {
            result.text = "Error"
        }
        else if !show {
            if operate == 10 {
                ans = ans + previousNumber
            }
            else if operate == 11 {
                ans = previousNumber - ans
            }
            else if operate == 12 {
                ans = 1 * previousNumber
            }
            else if operate == 13 {
                ans = previousNumber / 1
            }
        }
        }
        else if result.text == "Error" {
            result.text = "Error"
        }
        checkOperate = false
        changeScreen = true
        ch = true
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


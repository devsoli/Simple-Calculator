//
//  ViewController.swift
//  calculator
//
//  Created by Abolfazl Soltani on 3/28/22.
//

import UIKit

class ViewController: UIViewController {
    var Working:String="";
    @IBOutlet weak var resultLable: UILabel!
    @IBOutlet weak var CalculateWorkLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ClearAll();
        // Do any additional setup after loading the view.
    }
    func ClearAll(){
        Working     =    "";
        resultLable.text    =   "";
        CalculateWorkLable.text      =      "";
    }
    @IBAction func allClearTap(_ sender: Any) {
        ClearAll();
    }
    
    @IBAction func backTap(_ sender: Any) {
        
        if(!Working.isEmpty){
            Working.removeLast();
            CalculateWorkLable.text=Working;
        }
    }
    
    func addToWorkings(value:String){
        Working=Working+value;
        CalculateWorkLable.text=Working;
    }
    
    @IBAction func percentTap(_ sender: Any) {
        addToWorkings(value: "%");
    }
    
    @IBAction func divisiontap(_ sender: Any) {
        addToWorkings(value: "/");
    }
    
    @IBAction func multiplyTap(_ sender: Any) {
        addToWorkings(value: "*");
    }
    
    @IBAction func submissionTap(_ sender: Any) {
        addToWorkings(value: "-");
    }
    
    @IBAction func totalTab(_ sender: Any) {
        addToWorkings(value: "+");
    }
    
    @IBAction func equalTap(_ sender: Any) {
        if(validInput())
        {
            let checkedWorkingsForPercent = Working.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            CalculateWorkLable.text = resultString
        }
        else
        {
            let alert = UIAlertController(
                title: "ورودی نامعتبر",
                message: "لطفا عملگرهای ریاضی بدون اعداد وارد نکنید",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "باشه", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() ->Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in Working
        {
            if(specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if(index == 0)
            {
                return false
            }
            
            if(index == Working.count - 1)
            {
                return false
            }
            
            if (previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter (char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func oneTap(_ sender: Any) {
        addToWorkings(value: "1");
    }
    
    @IBAction func towTap(_ sender: Any) {
        addToWorkings(value: "2");
    }
    
    @IBAction func threeTap(_ sender: Any) {
        addToWorkings(value: "3");
    }
    
    @IBAction func fourTap(_ sender: Any) {
        addToWorkings(value: "4");
    }
    
    @IBAction func fiveTap(_ sender: Any) {
        addToWorkings(value: "5");
    }
    
    @IBAction func sixTap(_ sender: Any) {
        addToWorkings(value: "6");
    }
    
    @IBAction func sevenTap(_ sender: Any) {
        addToWorkings(value: "7");
    }
    
    @IBAction func eightTap(_ sender: Any) {
        addToWorkings(value: "8");
    }
    
    @IBAction func nineTap(_ sender: Any) {
        addToWorkings(value: "9");
    }
    
    @IBAction func dotTap(_ sender: Any) {
        addToWorkings(value: ".");
    }
    
    
    @IBAction func zeroTap(_ sender: Any) {
        addToWorkings(value: "0");
    }
}


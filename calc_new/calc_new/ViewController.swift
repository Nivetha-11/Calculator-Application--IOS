
import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen = ""
    var previous_Number  = ""
    var right_Number = ""
    var  output = ""
    var previousNumber = ""
    var second_value = ""
    
    var currentOperator:Operations = .null
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        resultLabel.text = ""
        
        
    }
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    @IBAction func numberPressed(_ sender: CurveButton) {
        if sender.tag <= 10 {
            numberOnScreen = "\(sender.tag - 1)"
            second_value = second_value + numberOnScreen
            // Checking values
            print("a1\(second_value)")
            print("a2\(numberOnScreen)")
            resultLabel.text = resultLabel.text! + numberOnScreen
            
        }
        else {
            numberOnScreen = "0"
            resultLabel.text = numberOnScreen
        }
        print((resultLabel.text)!)
        print (previousNumber)
        print(second_value)
        
    }
    
    
    @IBAction func operatorPressed(_ sender: CurveButton) {
        
        
        previousNumber  = (resultLabel.text)!
        
        switch sender.tag {
        case 16:
            resultLabel.text = resultLabel.text! + "+"
            currentOperator = Operations.addition
        case 15:
            resultLabel.text = resultLabel.text! + "-"
            currentOperator = Operations.subtraction
        case 14:
            resultLabel.text = resultLabel.text! + "*"
            currentOperator = Operations.multiplication
        case 13:
            resultLabel.text = resultLabel.text! + "/"
            currentOperator = Operations.division
        case 12:
            resultLabel.text = resultLabel.text! + "%"
            currentOperator = Operations.modulo
            
        default:
            return
        }
        second_value = ""
        print(currentOperator)
        print((resultLabel.text)!)
        print (previousNumber)
    }
    
    
    @IBAction func equalPressed(_ sender: CurveButton) {
        
        if numberOnScreen == ""{
            resultLabel.text = "Error :Must have a value"
        }
        else{
            calculation()
        }
    }
    
    
    @IBAction func decimalPressed(_ sender: CurveButton) {
        
        
        switch sender.tag{
        case 11:
            numberOnScreen = "."
            second_value = second_value + numberOnScreen
            resultLabel.text = resultLabel.text! + numberOnScreen
            
        default:
            return
        }
        
    }
    
    
    @IBAction func onAndResetPressed(_ sender: CurveButton) {
        
        if  sender.tag == 18{
            numberOnScreen = ""
            previousNumber = ""
            output = ""
            currentOperator = .null
            resultLabel.text = ""
            second_value = ""
            
        }
        else if sender.tag == 19 {
            resultLabel.text = previousNumber + currentOperator.rawValue
            numberOnScreen = ""
            second_value = ""
        }
        else {
            return
        }
        
    }
    
    func calculation(){
        
        if numberOnScreen != ""{
            
            
            let initial_value = Double(previousNumber)!
            let second_val = Double(second_value)!
            
            if currentOperator == Operations.addition{
                output = "\(initial_value + second_val)"
            }
            else if currentOperator == Operations.subtraction{
                output = "\(initial_value - second_val)"
            }
            else if currentOperator == Operations.multiplication{
                output = "\(initial_value * second_val)"
            }
            else if currentOperator == Operations.division{
                if second_val == 0{
                    // Error handling by 0 for division
                    resultLabel.text = "Second value cant be 0"
                    second_value = ""
                    return
                }
                else{
                    output = "\(initial_value / second_val)"
                }
            }
            else if currentOperator == Operations.modulo{
                if second_val == 0{
                    // Error handling by 0 for modulo
                    resultLabel.text = "Second value cant be 0"
                    second_value = ""
                    return
                }
                else{
                    
                    output = "\(initial_value.truncatingRemainder(dividingBy: second_val))"
                }
            }
            previousNumber = output
            resultLabel.text = output
        }
            
        else {
            previousNumber = numberOnScreen
            numberOnScreen = ""
            
        }
        
    }
    
}










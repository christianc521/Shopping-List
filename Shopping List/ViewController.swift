//
//  ViewController.swift
//  Shopping List
//
//  Created by Christian Cruz on 2/11/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var quantity: UITextField!
    @IBOutlet weak var list: UITextView!
    var tempList = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func newList(_ sender: UIButton) {
        list.text = "Your shopping list is empty"
    }
    
    @IBAction func newItem(_ sender: UIButton) {
        for textField in textFields {
            textField.text = ""
        }
    }
    
    @IBAction func add(_ sender: UIButton) {
        
        //add to shopping list
        if (desc.text != "" && quantity.text != "") {
            if let descText = desc.text {
                if let quantityText = quantity.text {
                    tempList += "\(quantityText)x \(descText)\n"
                }
            }
            //update the shopping list
            list.text = tempList
            for textField in textFields {
                textField.text = ""
            }
        }
        else {
            let alertController = UIAlertController(title: "Whoops!",
                                                    message: "That's an invalid input!", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK",
             style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
             present(alertController, animated: true,
             completion: nil)
            
        }
        
        
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        for textField in textFields {
            textField.resignFirstResponder()
        }
    }
    
    @IBAction func returnKeyPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
}


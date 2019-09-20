//
//  ViewController.swift
//  AlertAndActionSheetExample
//
//  Created by agreyson on 9/19/19.
//  Copyright © 2019 agreyson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "READY"
    }
    
    @IBAction func actionSheetButton(_ sender: UIButton) {
        showSimpleActionSheet(controller: self)
    }
    
    @IBAction func alertButton(_ sender: UIButton) {
        showSimpleAlert()
    }
    
    @IBAction func textFieldAlertButton(_ sender: UIButton) {
        showAlertWithTextField()
    }
    func showSimpleAlert() {
        // create the alert
        let alert = UIAlertController(title: "Alert", message: "This is an alert controller", preferredStyle: .alert)
        
        // create the "actions"
        let button1Action = UIAlertAction(title: "Alert button 1", style: .default, handler: { (_:UIAlertAction) in
            self.label.text = "Alert button 1 selected"
        })
        let button2Action = UIAlertAction(title: "Alert button 2", style: .default, handler: { (_:UIAlertAction) in
            self.label.text = "Alert button 2 selected"
        })
        
        // add the "actions" to the alert
        alert.addAction(button1Action)
        alert.addAction(button2Action)
        
        // present the alert
        self.present(alert, animated: true, completion: nil)
    }

    func showSimpleActionSheet(controller: UIViewController) {
        // create the action sheet
        let actionSheet = UIAlertController(title: "Action sheet", message: "This is an action sheet", preferredStyle: .actionSheet)
        
        // create the "actions"
        let button1Action = UIAlertAction(title: "Action sheet button 1", style: .default, handler: { (_:UIAlertAction) in
            self.label.text = "Action sheet button 1 selected"
        })
        let button2Action = UIAlertAction(title: "Action sheet button 2", style: .default, handler: { (_:UIAlertAction) in
            self.label.text = "Action sheet button 2 selected"
        })
        let destructButtonAction = UIAlertAction(title: "Action sheet destructive button", style: .destructive, handler: { (_:UIAlertAction) in
            self.label.text = "Action sheet destructive button selected"
        })
        let cancelButtonAction = UIAlertAction(title: "Action sheet cancel", style: .cancel, handler: { (_:UIAlertAction) in
            self.label.text = "Action sheet cancel button selected"
        })
        
        // add the actions to the action sheet
        actionSheet.addAction(button1Action)
        actionSheet.addAction(button2Action)
        actionSheet.addAction(destructButtonAction)
        actionSheet.addAction(cancelButtonAction)
        
        // present the action sheet
        self.present(actionSheet, animated: true, completion: {
            print("Action sheet completion block executed")
        })
    }

    func showAlertWithTextField() {
        // create the alert
        let alert = UIAlertController(title: "Text field alert", message: "This is an alert with text field", preferredStyle: .alert)
        
        // add text fields to the alert and set their placeholder text
        alert.addTextField(configurationHandler: { (textField:UITextField) in
            textField.placeholder = "First name"
            
        })
        alert.addTextField(configurationHandler: { (textField:UITextField) in
            textField.placeholder = "Second name"
            
        })
        

        // create the "actions"
        let addButtonAction = UIAlertAction(title: "Add", style: .default, handler: { (_:UIAlertAction) in
            if let textField = alert.textFields?[0] {
                if let text = textField.text {
                    self.label.text = text
                }
            }
            if let textField = alert.textFields?[1] {
                if let text = textField.text {
                    self.label.text = self.label.text! + text
                }
            }
        })
        let cancelButtonAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (_:UIAlertAction) in
            self.label.text = "Text field alert cancel button selected"
        })
        
        // add the actions to the alert
        alert.addAction(addButtonAction)
        alert.addAction(cancelButtonAction)
        
        // present the alert
        self.present(alert, animated: true, completion: nil)
    }

}


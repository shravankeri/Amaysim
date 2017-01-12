//
//  ASLoginViewController.swift
//  Amaysim
//
//  Created by Uday Kiran Ailapaka on 11/01/17.
//  Copyright © 2017 Uday Kiran Ailapaka. All rights reserved.
//

import UIKit

class ASLoginViewController: UIViewController {
    @IBOutlet weak var loginBGView: UIView!
    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var bgViewCenterY: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func beginLogin(_ sender: Any) {
        
        let userid = self.userId.text?.trimmingCharacters(in: NSCharacterSet.whitespaces)
        let password = self.password.text?.trimmingCharacters(in: NSCharacterSet.whitespaces)
        if userid?.characters.count == 0 || password?.characters.count == 0{
            //Please fill all details
        } else if ASHelper.sharedInstance.isvalidaEmailId(emailId: userid!){
            self.authenticateUserLogin(_userid: userid!, _password: password!)
        } else {
            //Unknown Error
        }
    }
    
    func authenticateUserLogin (_userid: String, _password: String ) {
        let  containerVC = self.parent as? ViewController
        containerVC?.presentHome()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

//
//  ViewController.swift
//  Amaysim
//
//  Created by Uday Kiran Ailapaka on 10/01/17.
//  Copyright © 2017 Uday Kiran Ailapaka. All rights reserved.
//

import UIKit

class ViewController: ContainerVC {
@IBOutlet weak var container: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func presentHome() {
        self.cycleFromViewController(oldC: nil, toViewController: (self.storyboard?.instantiateViewController(withIdentifier: "ASHomeViewController"))!, onContainer: self.container);
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueName = segue.identifier {
            print(segueName)
            if segueName == "Login" {
                let vc = segue.destination
                vc.view.tag = 101;
            }
        }
    }

}


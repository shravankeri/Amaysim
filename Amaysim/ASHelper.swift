//
//  ASHelper.swift
//  Amaysim
//
//  Created by Uday Kiran Ailapaka on 11/01/17.
//  Copyright © 2017 Uday Kiran Ailapaka. All rights reserved.
//

import Foundation

class ASHelper {
     static let sharedInstance = ASHelper()
    var profile: [String: AnyObject]?
    var services: [String: AnyObject]?
    var subscriptions: [String: AnyObject]?
    var products: [String: AnyObject]?

    init() {
        readDataFromJSONFile()
    }
    func readDataFromJSONFile() {
        if let path = Bundle.main.path(forResource: "collection", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                do {
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                    print(jsonResult);
                    if let profile = jsonResult?["data"] as? [String : AnyObject]{
                        self.profile = profile ;
                    }
                    if let includes = jsonResult?["included"] as? [AnyObject]{
                        if let services = includes[0] as? [String : AnyObject]{
                            self.services = services ;
                        }
                        if let subscriptions = includes[1] as? [String : AnyObject]{
                            self.subscriptions = subscriptions ;
                        }
                        if let products = includes[2] as? [String : AnyObject]{
                            self.products = products ;
                        }
                    }
                }
                catch let error {
                    print(error.localizedDescription)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            print("Invalid filename/path.")
        }
    }
    
    func isvalidaEmailId(emailId: String)-> Bool {
        let stricterFilterString: String = "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", stricterFilterString)
        let isValid : Bool = emailTest.evaluate(with: emailId)
        if isValid {
            return true;
        } else {
            return false;
        }
    }

}

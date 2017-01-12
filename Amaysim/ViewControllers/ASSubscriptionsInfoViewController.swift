//
//  ASSubscriptionsInfoViewController.swift
//  Amaysim
//
//  Created by Uday Kiran Ailapaka on 11/01/17.
//  Copyright © 2017 Uday Kiran Ailapaka. All rights reserved.
//

import UIKit

class ASSubscriptionsInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableVew: UITableView!

    var services: [Any] = [];
    var subscriptions: [Any] = []
    var products: [Any] = []
    
    let helper = ASHelper.sharedInstance;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableVew.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableVew.register(UINib.init(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        self.tableVew.rowHeight = 44;
        if let services = helper.services?["attributes"] as? [String: AnyObject] {
            for (n, c) in services.enumerated() {
                print("\(n): '\(c)'")
                self.services.append(c as Any);
            }
        }
        if let subscriptions = helper.subscriptions?["attributes"] as? [String: AnyObject] {
            for (n, c) in subscriptions.enumerated() {
                print("\(n): '\(c)'")
                self.subscriptions.append(c as Any);
            }
        }
        if let products = helper.products?["attributes"] as? [String: AnyObject] {
            for (n, c) in products.enumerated() {
                print("\(n): '\(c)'")
                self.products.append(c as Any);
            }
        }
//        self.services = helper.services?["attributes"] as? [String: AnyObject]
//        self.subscriptions = helper.subscriptions?["attributes"]  as? [String : AnyObject]
//        self.products = helper.products?["attributes"]  as? [String : AnyObject]
    }
    
    @IBAction func closeView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //    MARK: UITableView Delegates and DataSources
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return self.services.count ;
        case 1:
            return self.subscriptions.count;
        case 2:
            return self.products.count;
        default:
            return 0;
        }

    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Services";
        case 1:
            return "Subscription Details";
        case 2:
            return "Product Details";
        default:
            return "";
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell")! as UITableViewCell
        var dict : (String,AnyObject)?
        switch indexPath.section {
        case 0:
            dict  = self.services[indexPath.row] as? (String,AnyObject)
        case 1:
            dict  = self.subscriptions[indexPath.row] as? (String,AnyObject)
        case 2:
            dict  = self.products[indexPath.row] as? (String,AnyObject)
        default: break
        }
        cell.textLabel?.text  = dict?.0
        cell.detailTextLabel?.text  = "---"
        if let val =  dict?.1 as? String{
             print(val);
            cell.detailTextLabel?.text  = val
        }
        if let val =  dict?.1 as? NSNumber{
            print(val);
            cell.detailTextLabel?.text  = String(describing: val)
        }
        return cell;
    }
}

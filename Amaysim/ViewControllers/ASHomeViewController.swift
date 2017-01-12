//
//  ASHomeViewController.swift
//  Amaysim
//
//  Created by Uday Kiran Ailapaka on 11/01/17.
//  Copyright © 2017 Uday Kiran Ailapaka. All rights reserved.
//

import UIKit

class ASHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    let helper = ASHelper.sharedInstance;
    var attributes : [[String : AnyObject]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView.register(UINib.init(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        self.tableView.rowHeight = 54;
        if let attributes = helper.profile?["attributes"] as? [String : AnyObject]{
            self.attributes.append(["contact-number":attributes["contact-number"]!]) ;
            self.attributes.append(["email-address":attributes["email-address"]!]) ;
            self.attributes.append(["date-of-birth":attributes["date-of-birth"]!]) ;
            self.attributes.append(["payment-type":attributes["payment-type"]!]) ;
            
            self.titleLabel.text = "Welcome \(attributes["title"]!) . \(attributes["first-name"]!) \(attributes["last-name"]!)"
        }
    }
    
    @IBAction func showSubscriptionsandProducts(){
        self.present((self.storyboard?.instantiateViewController(withIdentifier: "ASSubscriptionsInfoViewController"))!, animated: true) {
        }
    }
    
//    MARK: UITableView Delegates and DataSources
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.attributes.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell")! as UITableViewCell
        let dict : [String:AnyObject] = self.attributes[indexPath.row]
        cell.textLabel?.text  = dict.keys.first
        cell.detailTextLabel?.text  = dict.values.first as? String
        return cell;
    }
}

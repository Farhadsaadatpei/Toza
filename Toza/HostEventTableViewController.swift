//
//  HostTableViewController.swift
//  Toza
//
//  Created by Farhad Saadatpei on 11/29/16.
//  Copyright © 2016 Toza, Inc. All rights reserved.
//

import UIKit
import FontAwesome_swift

class HostTableViewController: UITableViewController {
    
    //Table & Cells
    @IBOutlet var hostTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        //Table & Cell
        hostTableView.estimatedRowHeight = 200
        hostTableView.rowHeight = UITableViewAutomaticDimension
        hostTableView.contentInset = UIEdgeInsetsMake(0, 0, 60, 0)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}

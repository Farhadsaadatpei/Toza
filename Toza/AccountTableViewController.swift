//
//  AccountTableViewController.swift
//  Toza
//
//  Created by Farhad Saadatpei on 11/3/16.
//  Copyright © 2016 Toza, Inc. All rights reserved.
//

import UIKit
//import PhoneNumberKit

class AccountTableViewController: UITableViewController {
    
    //Table & Cell Init
    @IBOutlet var userSettingTable: UITableView!
    var userDetailCell: UserAccountTableViewCell!
    var earningSpendingCell: EarningSpendingTableViewCell!
    @IBOutlet weak var done: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Navigation
        let leftNavigationButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 160, height: 40))
        let viewName: UILabel = UILabel(frame: CGRect(x: 0, y: 10, width: 150, height: 20))
        viewName.text = "Your Account"
        viewName.textColor = UIColor.white
        viewName.textAlignment = NSTextAlignment.left
        viewName.font = UIFont(name: "AvenirNext-Medium", size: 18)
        leftNavigationButton.addSubview(viewName)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftNavigationButton)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        done.setTitleTextAttributes([
            NSFontAttributeName: UIFont(name: "Avenir Next", size: 14)!
            ], for: UIControlState.normal)
        
        //Table & Cell
        userSettingTable.estimatedRowHeight = 200
        userSettingTable.rowHeight = UITableViewAutomaticDimension
        userSettingTable.contentInset = UIEdgeInsetsMake(0, 0, 60, 0)
        
        //Update Constraints
        self.view.layoutIfNeeded()
        
        //Hide Status Bar
        setNeedsStatusBarAppearanceUpdate()
        
    }
    
    //Hide Status Bar
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Dismiss Account View
 
    @IBAction func dismissAccountView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    var AccountInfo: AccountHeaderView!
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        AccountInfo = Bundle.main.loadNibNamed("AccountHeaderView", owner: self, options: nil)?.first as! AccountHeaderView
        
        
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.addSubview(AccountInfo)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header Title Exist"
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Register Cells
        userDetailCell = Bundle.main.loadNibNamed("UserAccountTableViewCell", owner: self, options: nil)?.first as! UserAccountTableViewCell
        earningSpendingCell = Bundle.main.loadNibNamed("EarningSpendingTableViewCell", owner: self, options: nil)?.first as! EarningSpendingTableViewCell
        
        if indexPath.row == 0 {
            
            userDetailCell.attributeDetail.isEnabled = false
            userDetailCell.attributeDetail.isHidden = true
            userDetailCell.attributeName.text = "Phone Number"
            userDetailCell.attributeHint.isHidden = true
            
            return userDetailCell
            
        } else if indexPath.row == 1 {
            
            //User Email
            userDetailCell.attributeName.text = "Email"
            userDetailCell.attributeDetail.text = "name@example.com"
            userDetailCell.attributeHint.isHidden = true
            userDetailCell.attributePhoneNumber.isEnabled = false
            userDetailCell.attributePhoneNumber.isHidden = true
            return userDetailCell
            
        } else if indexPath.row == 2 {
            
            //Promoter Earning Section
            userDetailCell.layer.backgroundColor = UIColor(red: 32/255, green: 64/255, blue: 85/255, alpha: 1).cgColor
            userDetailCell.attributeName.text = "Earning"
            userDetailCell.attributeDetail.text = "$587.50"
            userDetailCell.attributeHint.text = "Change your Deposit Account"
            userDetailCell.attributeHint.textColor = UIColor.white
            userDetailCell.attributeDetail.isEnabled = false
            userDetailCell.attributePhoneNumber.isEnabled = false
            userDetailCell.attributePhoneNumber.isHidden = true
            return userDetailCell
            
        } else if indexPath.row == 3 {
            
            //Promoter Earning Statistic
            earningSpendingCell.layer.backgroundColor = UIColor(red: 32/255, green: 64/255, blue: 85/255, alpha: 1).cgColor
            earningSpendingCell.numberOfGuest.text = "212"
            earningSpendingCell.averageCostPerGuest.text = "$2.77"
            earningSpendingCell.numberOfEvents.text = "3"
            return earningSpendingCell
            
        } else if indexPath.row == 4 {
            
            //Hoster Spending Section
            userDetailCell.layer.backgroundColor = UIColor.black.cgColor
            userDetailCell.attributeName.text = "Spending"
            userDetailCell.attributeDetail.text = "$970.96"
            userDetailCell.attributeHint.text = "Change your Credit Card"
            userDetailCell.attributeHint.textColor = UIColor.white
            userDetailCell.attributeDetail.isEnabled = false
            userDetailCell.attributePhoneNumber.isEnabled = false
            userDetailCell.attributePhoneNumber.isHidden = true
            return userDetailCell
            
        } else {
            
            //Hoster Spending Statistic
            earningSpendingCell.layer.backgroundColor = UIColor.black.cgColor
            earningSpendingCell.numberOfGuest.text = "212"
            earningSpendingCell.averageCostPerGuest.text = "$4.58"
            earningSpendingCell.numberOfEvents.text = "3"
            return earningSpendingCell
        }
        
    }
    
    


}

//
//  MenuTableViewController.swift
//  Toza
//
//  Created by Farhad Saadatpei on 10/29/16.
//  Copyright © 2016 Toza, Inc. All rights reserved.
//

import UIKit

struct menuCellData {
    let identifier: String!
    let cellType: Int!
    let image: UIImage!
}

class MenuTableViewController: UITableViewController, UIViewControllerTransitioningDelegate {
    
    //Menu Items
    var menuItems = [menuCellData]()
    var menuItemCell: MenuTableViewCell!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Update Status View
        self.setNeedsStatusBarAppearanceUpdate()
        
        menuItems = [
            menuCellData(identifier: "account", cellType : 0, image: #imageLiteral(resourceName: "Account-40")),
            menuCellData(identifier: "host", cellType : 1, image: #imageLiteral(resourceName: "Host-40")),
            menuCellData(identifier: "barcode", cellType : 1, image: #imageLiteral(resourceName: "barcode-40"))
        ]
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .fade
    }
    
    
    //Transitions (Front & Back)
    let sendBackAnimationTransition = SendBackAnimationController()
    let sendFrontAnimationTransition = SendFrontAnimationController()
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return sendBackAnimationTransition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return sendFrontAnimationTransition
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAccount" {
            let toViewController = segue.destination as UIViewController
            toViewController.transitioningDelegate = self
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItems.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        menuItemCell = Bundle.main.loadNibNamed("MenuTableViewCell", owner: self, options: nil)?.first as! MenuTableViewCell
        
        if menuItems[indexPath.row].cellType == 1 || menuItems[indexPath.row].cellType == 0 {
            
            menuItemCell.iconPlaceholder.tag = indexPath.row
            menuItemCell.iconPlaceholder.addTarget(self, action: #selector(menuBtnTapped(sender:)), for: UIControlEvents.touchUpInside)
            menuItemCell.iconPlaceholder.setImage(menuItems[indexPath.row].image, for: UIControlState.normal)
        }
        
        return menuItemCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if menuItems[indexPath.row].cellType == 0 {
            return 45.00
        } else {
            return 70.00
        }
    }
    
    func menuBtnTapped(sender: UIButton) {
        if sender.tag == 0 {
            self.performSegue(withIdentifier: "toAccount", sender: self)
        }else if sender.tag == 1 {
            self.performSegue(withIdentifier: "toHost", sender: self)
        }else if sender.tag == 2 {
            self.performSegue(withIdentifier: "toBarcode", sender: self)
        }
    }
    

}

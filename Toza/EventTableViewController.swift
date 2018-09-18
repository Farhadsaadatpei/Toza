//
//  EventTableViewController.swift
//  Toza
//
//  Created by Farhad Saadatpei on 11/10/16.
//  Copyright © 2016 Toza, Inc. All rights reserved.
//

import UIKit

class EventTableViewController: UITableViewController {
    
    //Table and Cell
    @IBOutlet var eventViewTable: UITableView!
    var availabilityHeaderView: AvailabilityHeaderView!
    var eventHeaderCell: EventHeaderViewTableViewCell!
    var eventDetailAction: EventDetailActionTableViewCell!
    var eventBody: EventBodyTableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Navigation
        let leftNavigationButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 160, height: 40))
        let viewName: UILabel = UILabel(frame: CGRect(x: 0, y: 10, width: 150, height: 20))
        viewName.text = "Event"
        viewName.textColor = UIColor.black
        viewName.textAlignment = NSTextAlignment.left
        viewName.font = UIFont(name: "AvenirNext-Medium", size: 14)
        leftNavigationButton.addSubview(viewName)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftNavigationButton)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

        //Hide Status Bar
        setNeedsStatusBarAppearanceUpdate()
        
        //Table & Cell
        eventViewTable.estimatedRowHeight = 150
        eventViewTable.rowHeight = UITableViewAutomaticDimension
        eventViewTable.contentInset = UIEdgeInsetsMake(0, 0, 60, 0)
        availabilityHeaderView = Bundle.main.loadNibNamed("AvailabilityHeaderView", owner: self, options: nil)?.first as! AvailabilityHeaderView
        
    }
    
    //Hide Status Bar
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func dismissEventView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.addSubview(availabilityHeaderView)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header Exist"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            eventHeaderCell = Bundle.main.loadNibNamed("EventHeaderViewTableViewCell", owner: self, options: nil)?.first as! EventHeaderViewTableViewCell
            
            return eventHeaderCell
        } else if indexPath.row == 1 {
            
            eventDetailAction = Bundle.main.loadNibNamed("EventDetailActionTableViewCell", owner: self, options: nil)?.first as! EventDetailActionTableViewCell
            
            return eventDetailAction
            
        } else {
            eventBody = Bundle.main.loadNibNamed("EventBodyTableViewCell", owner: self, options: nil)?.first as! EventBodyTableViewCell
            return eventBody
        }
    
    }

    
}

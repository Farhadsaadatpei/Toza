//
//  MainUITableViewController.swift
//  Toza
//
//  Created by Farhad Saadatpei on 10/28/16.
//  Copyright © 2016 Toza, Inc. All rights reserved.
//

import UIKit
import SWRevealViewController
import FontAwesome_swift
import JTHamburgerButton

struct partiesList {
    var eventImage: UIImage!
    var eventName: String!
    var eventAddress: String!
    var eventDate: String!
}

class MainUITableViewController: UITableViewController, SWRevealViewControllerDelegate, UIViewControllerTransitioningDelegate {
    
    //Menu
    @IBOutlet weak var hamburgerMenu: JTHamburgerButton!
    var menuShadow: EdgeShadowLayer!
    var menuShadowView: UIView!
    
    //Table
    @IBOutlet var goingEvents: UITableView!
    
    //DEMO WILL **********WILL BE REMOVE********
    var  demoPartiesToList = [partiesList]()
    
    //Table and Cell
    @IBOutlet var goingEventTable: UITableView!
    var eventCell: EventTableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // DEMO *******WILL BE REMOVED******
        demoPartiesToList = [
           partiesList(eventImage: #imageLiteral(resourceName: "Crowd-of-young-people-having-a-New-Years-Eve-party"), eventName: "Meśano Lounge", eventAddress: "455 New York Ave. NY", eventDate: "10/25"),
           partiesList(eventImage: #imageLiteral(resourceName: "original"), eventName: "Smith Legend Night Owl Concert", eventAddress: "500 Washington Ave. DC", eventDate: "10/28"),
           partiesList(eventImage: #imageLiteral(resourceName: "tao-beach-pool-parties-las-vegas-1"), eventName: "Tieösto NL", eventAddress: "10025 Florida Rd. Orlando, FL", eventDate: "11/02"),
           partiesList(eventImage: #imageLiteral(resourceName: "champagne-party"), eventName: "Dubai EDM", eventAddress: "50 Al Buro , Dubai", eventDate: "10/25")
        ]
        
        
        //Map Menu
        let mapMenu: UIButton = UIButton(frame: CGRect(x: self.view.bounds.size.width / 2 - 12.5, y: self.view.bounds.size.height - 75, width: 50, height: 50))
        mapMenu.setImage(#imageLiteral(resourceName: "toza-pin-40"), for: UIControlState.normal)
        mapMenu.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        mapMenu.layer.cornerRadius = min(mapMenu.layer.bounds.size.width, mapMenu.layer.bounds.size.height) / 2
        mapMenu.layer.backgroundColor = UIColor.white.cgColor
        mapMenu.clipsToBounds = false
        mapMenu.layer.shadowOffset = CGSize(width: 0, height: 3)
        mapMenu.layer.shadowOpacity = 0.15
        mapMenu.layer.shadowRadius = 5
        mapMenu.layer.shadowColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1).cgColor
        self.navigationController?.view.addSubview(mapMenu)
        mapMenu.addTarget(self, action: #selector(mapMenuTapped), for: UIControlEvents.touchUpInside)
        
        
        //Navigation
        let leftNavigationButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 160, height: 40))
        let userProfilePictureFrame: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let nameLabel: UILabel = UILabel(frame: CGRect(x: 50, y: 10, width: 150, height: 20))
        let userProfilePicture: UIImage = #imageLiteral(resourceName: "Shawn_Tok_Profile")
        userProfilePictureFrame.layer.cornerRadius = min(userProfilePictureFrame.frame.size.height, userProfilePictureFrame.frame.size.width) / 2.0
        userProfilePictureFrame.clipsToBounds = true
        userProfilePictureFrame.image = userProfilePicture
        nameLabel.text = "Welcome, Brian"
        nameLabel.textColor = UIColor.white
        nameLabel.textAlignment = NSTextAlignment.left
        nameLabel.font = UIFont(name: "Avenir Next", size: 18)
        leftNavigationButton.addSubview(userProfilePictureFrame)
        leftNavigationButton.addSubview(nameLabel)
        leftNavigationButton.addTarget(self, action: #selector(LeftNavigationButtonTapped), for: UIControlEvents.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftNavigationButton)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        //Menu
        let revealController = self.revealViewController()
        revealController?.delegate = self
        self.revealViewController().rightViewRevealWidth = 70
        self.revealViewController().frontViewShadowOpacity = 0
        //self.view.addGestureRecognizer((revealController?.panGestureRecognizer())!)
        hamburgerMenu.lineColor = UIColor.white
        hamburgerMenu.lineWidth = 20
        hamburgerMenu.lineHeight = 2.5
        hamburgerMenu.lineSpacing = 3.5
        hamburgerMenu.animationDuration = 0.1
        hamburgerMenu.updateAppearance()
        hamburgerMenu.addTarget(self, action: #selector(hamburgerButtonTapped(sender:)), for: UIControlEvents.touchUpInside)
        hamburgerMenu.addTarget(revealController, action: #selector(SWRevealViewController.rightRevealToggle(_:)), for: UIControlEvents.touchUpInside)
        
        //Menu Shadow
        menuShadow = EdgeShadowLayer(forView: self.goingEvents, edge: .Right, shadowRadius: self.view.bounds.size.width, toColor: UIColor.clear, fromColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.6))
        menuShadowView = UIView(frame: CGRect(x: 0, y: 0, width: (self.navigationController?.view.frame.width)!, height: (self.navigationController?.view.frame.height)!))
        menuShadowView.layer.addSublayer(menuShadow)
        menuShadowView.alpha = 0
        self.menuShadowView.isUserInteractionEnabled = false
        self.navigationController?.view.addSubview(menuShadowView)

        
        //Table & Cell
        goingEventTable.estimatedRowHeight = 150
        goingEventTable.rowHeight = UITableViewAutomaticDimension
        
    }
    
    func hamburgerButtonTapped(sender: JTHamburgerButton) {
        if sender.currentMode == JTHamburgerButtonMode.hamburger {
            sender.setCurrentModeWithAnimation(JTHamburgerButtonMode.cross)
        } else {
            sender.setCurrentModeWithAnimation(JTHamburgerButtonMode.hamburger)
        }
    }
    
    
    func revealController(_ revealController: SWRevealViewController!, didMoveTo position: FrontViewPosition) {
        
        if revealController.frontViewPosition != FrontViewPosition.left {
            //Change Menu Icon
            hamburgerMenu.setCurrentModeWithAnimation(JTHamburgerButtonMode.cross)
            
            //Menu Shadow when Open
            UIView.animate(withDuration: 0.1, animations: { 
                self.menuShadowView.alpha = 1
            })
            
        } else {
            //Change Menu Icon
            hamburgerMenu.setCurrentModeWithAnimation(JTHamburgerButtonMode.hamburger)
            
            //Hide Menu Shadow when Close
            UIView.animate(withDuration: 0.1, animations: {
                self.menuShadowView.alpha = 0
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        if segue.identifier == "toAccountFromMain" {
            let toViewController = segue.destination as UIViewController
            toViewController.transitioningDelegate = self
        }
        
        if segue.identifier == "toEvent" {
            let toViewController = segue.destination as UIViewController
            toViewController.transitioningDelegate = self
        }
        
        if segue.identifier == "toMap" {
            let toViewController = segue.destination as UIViewController
            toViewController.transitioningDelegate = self
        }
    }
    
    //Map Menu Tapped
    func mapMenuTapped() {
       self.performSegue(withIdentifier: "toMap", sender: self)
    }
    
    //Navigation Left Button (User Profile)
    func LeftNavigationButtonTapped() {
        self.performSegue(withIdentifier: "toAccountFromMain", sender: self)
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    var eventsHeaderView: MainTableHeaderView!
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        eventsHeaderView = Bundle.main.loadNibNamed("MainTableHeaderView", owner: self, options: nil)?.first as! MainTableHeaderView
        
        eventsHeaderView.nameAttribute.text = "Events"
        eventsHeaderView.selectionAttributeTitle.text = "Attending"
        eventsHeaderView.selectionAttributeIcon.setTitle("\(String.fontAwesomeIcon(name: FontAwesome.chevronDown))", for: UIControlState.normal)
        
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.addSubview(eventsHeaderView)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.height
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toEvent", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header Title Exist"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        eventCell = Bundle.main.loadNibNamed("EventTableViewCell", owner: self, options: nil)?.first as! EventTableViewCell
        
        eventCell.eventImage.image = demoPartiesToList[indexPath.row].eventImage
        eventCell.eventName.text = demoPartiesToList[indexPath.row].eventName.uppercased()
        eventCell.eventAddress.text = demoPartiesToList[indexPath.row].eventAddress
        eventCell.eventDate.text = demoPartiesToList[indexPath.row].eventDate
        
        return eventCell
    }


}


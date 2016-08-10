//
//  ExpandableTableViewController.swift
//  ExpandableTableView
//
//  Created by Xin Wang on 8/10/16.
//  Copyright © 2016 Xin Wang. All rights reserved.
//

import UIKit

let kNumberOfCells = 20

class ExpandableTableViewController: UITableViewController {
    
    var expandeds = [Bool](count: kNumberOfCells, repeatedValue: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Expandable Table View"
        
        tableView.registerNib(UINib(nibName: "ExpandableTableViewCell", bundle: nil), forCellReuseIdentifier: "ExpandableCell")
        // use autolayout calculated height for cells
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kNumberOfCells
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ExpandableCell", forIndexPath: indexPath) as! ExpandableTableViewCell
        
        cell.titleLabel.text = "Cell \(indexPath.row)"
        cell.selectionStyle = .None
        
        cell.toggleVisibility(expandeds[indexPath.row])
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        guard let cell = tableView.cellForRowAtIndexPath(indexPath) as? ExpandableTableViewCell else { return }
        var expanded = expandeds[indexPath.row]
        expanded = !expanded
        expandeds[indexPath.row] = expanded
        
        NSLog("row \(indexPath.row) expanded \(expanded)")
        
        cell.toggleVisibility(expanded)
        
        // animate view to avoid awkward transition effect
        UIView.animateWithDuration(3) {
            cell.contentView.layoutIfNeeded()
        }
        
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Top, animated: true)
    }

}

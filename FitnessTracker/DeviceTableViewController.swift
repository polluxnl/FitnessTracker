//
//  DeviceTableViewController.swift
//  FitnessTracker
//
//  Created by Wesley on 07-07-16.
//  Copyright © 2016 Pollux. All rights reserved.
//

import UIKit

class DeviceTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var devices = [Device]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller.
        
        navigationItem.leftBarButtonItem = editButtonItem()
        
        // Load sample data
        
        loadSampleDevice()
    }

    func loadSampleDevice() {
        let photo1 = UIImage(named: "defaultPhoto")!
        let device1 = Device(name: "Leg Press", weight: "55", seat: "7", photo: photo1)!
        
        let photo2 = UIImage(named: "defaultPhoto")!
        let device2 = Device(name: "Ab Crunch", weight: "35", seat: "4", photo: photo2)!
        
        devices += [device1, device2]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows here
        return devices.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        
        let cellIdentifier = "DeviceTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! DeviceTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        
        let device = devices[indexPath.row]

        cell.nameLabel.text = device.name
        cell.weightLabel.text = device.weight
        cell.seatLabel.text = device.seat
        cell.photoImageView.image = device.photo
        
        return cell
    }


    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            devices.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "ShowDetail" {
            let deviceDetailViewController = segue.destinationViewController as! DeviceViewController
            
            // Get the cell that generated this segue.
            
            if let selectedDeviceCell = sender as? DeviceTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedDeviceCell)!
                let selectedDevice = devices[indexPath.row]
                deviceDetailViewController.device = selectedDevice
            }
        }
        else if segue.identifier == "AddItem" {
            print ("Adding new device.")
        }
        
    }


    // MARK: Actions
    
    @IBAction func unwindToDeviceList(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.sourceViewController as? DeviceViewController, device = sourceViewController.device {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                
                // Update an existing device
                devices[selectedIndexPath.row] = device
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            }
            
            else {
                
                // Add the device
                
                let newIndexPath = NSIndexPath(forRow: devices.count, inSection: 0)
                devices.append(device)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
                
            }
        }
        
    }
}























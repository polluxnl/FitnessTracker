//
//  Device.swift
//  FitnessTracker
//
//  Created by Pollux on 06/07/16.
//  Copyright © 2016 Pollux. All rights reserved.
//

import UIKit

    class Device: NSObject, NSCoding {
    
        // MARK: Properties
        
        var name: String
        var weight: String
        var seat: String?
        var photo: UIImage
        
        // MARK: Archiving Paths
        
        static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
        static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("devices")
        
        // MARK: Types
        
        struct PropertyKey {
            static let nameKey = "name"
            static let weightKey = "weight"
            static let seatKey = "seat"
            static let photoKey = "photo"
        }
        
        // MARK: Initialization
        
        init?(name: String, weight: String, seat: String?, photo: UIImage) {
            
            // Initialize stored properties.
            
            self.name = name
            self.weight = weight
            self.seat = seat
            self.photo = photo
            
            super.init()
            
            // Initialization should fail if there is no name or the weight is negative.
            
            if name.isEmpty || weight.isEmpty {
                return nil
            }
        }
    
        // MARK: NSCoding
        
        func encodeWithCoder(aCoder: NSCoder) {
            aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
            aCoder.encodeObject(weight, forKey: PropertyKey.weightKey)
            aCoder.encodeObject(seat, forKey: PropertyKey.seatKey)
            aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        }
        
        required convenience init?(coder aDecoder: NSCoder) {
            let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
            let weight = aDecoder.decodeObjectForKey(PropertyKey.weightKey) as! String
            let seat = aDecoder.decodeObjectForKey(PropertyKey.seatKey) as? String
            let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as! UIImage
            
            // Must call designated initializer.
            self.init(name: name, weight: weight, seat: seat, photo: photo)
            
        }
    

    
    }

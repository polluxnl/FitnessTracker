//
//  Device.swift
//  FitnessTracker
//
//  Created by Pollux on 06/07/16.
//  Copyright © 2016 Pollux. All rights reserved.
//

import UIKit

    class Device {
    
        // MARK: Properties
        
        var name: String
        var weight: String
        var seat: String?
        var photo: UIImage
        
        // MARK: Initialization
        
        init?(name: String, weight: String, seat: String?, photo: UIImage) {
            
            // Initialize stored properties.
            
            self.name = name
            self.weight = weight
            self.seat = seat
            self.photo = photo
            
            // Initialization should fail if there is no name or the weight is negative.
            
            if name.isEmpty || weight.isEmpty {
                return nil
            }
        }
       
    }

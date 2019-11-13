//
//  Repository.swift
//  GitRepoList
//
//  Created by Venkat Madira on 12/11/2019.
//  Copyright © 2019 Venkat Madira. All rights reserved.
//

import Foundation


public struct Repository {
    let name : String
    let description : String
    
    init(_ dictionary: [String: Any]) {
      
        self.name = dictionary["name"] as? String ?? ""
        self.description = dictionary["description"] as? String ?? ""
    }

}



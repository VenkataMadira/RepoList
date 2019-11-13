//
//  TableViewCell.swift
//  GitRepoList
//
//  Created by Venkat Madira on 13/11/2019.
//  Copyright © 2019 Venkat Madira. All rights reserved.
//

import Foundation
import UIKit
class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var repoName: UILabel!
    
    @IBOutlet weak var repoDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

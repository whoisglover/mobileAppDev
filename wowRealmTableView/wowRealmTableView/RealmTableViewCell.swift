//
//  RealmTableViewCell.swift
//  wowRealmTableView
//
//  Created by Danny Glover on 11/4/14.
//  Copyright (c) 2014 Glover LLC. All rights reserved.
//

import UIKit

class RealmTableViewCell: UITableViewCell {
    
    var metaData:NSDictionary?
    @IBOutlet weak var realmTitle: UILabel!
    @IBOutlet weak var realmPlayType: UILabel!
    @IBOutlet weak var realmPopulation: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

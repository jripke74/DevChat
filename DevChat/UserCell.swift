//
//  UserCell.swift
//  DevChat
//
//  Created by Jeff Ripke on 6/29/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var firstNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCheckmark(selected: false)
    }
    
    func setCheckmark(selected: Bool) {
        let imageStr = selected ? "messageindicatorchecked1" : "messageindicator1"
        accessoryView = UIImageView(image: UIImage(named: imageStr))
    }
    
    func updateUI(user: User) {
        firstNameLbl.text = user.firstName
    }
}

//
//  MessageCell.swift
//  Flash-Chat
//
//  Created by Esraa Gamal on 5/15/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var messageBuble: UIView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var messageBody: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageBuble.layer.cornerRadius = messageBuble.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  Constants.swift
//  Flash-Chat
//
//  Created by Esraa Gamal on 5/15/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

struct K {
       static let appName = "⚡️FlashChat"
       static let cellIdentifier = "ReusableCell"
       static let cellNibName = "MessageCell"
       static let registerSegue = "RegisterToChat"
       static let loginSegue = "LoginToChat"
       
       struct BrandColors {
           static let purple = "BrandPurple"
           static let lightPurple = "BrandLightPurple"
           static let blue = "BrandBlue"
           static let lighBlue = "BrandLightBlue"
       }
       
       struct FStore {
           static let collectionName = "messages"
           static let senderField = "sender"
           static let bodyField = "body"
           static let dateField = "date"
       }
}

//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by J on 5/1/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation


struct K {
    static let appName = "⚡️FlashChat "
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
    
    struct FireStore {
        static let messagesCollection = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}

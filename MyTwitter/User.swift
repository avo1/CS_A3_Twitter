//
//  User.swift
//  MyTwitter
//
//  Created by Dave Vo on 2/28/17.
//  Copyright © 2017 DaveVo. All rights reserved.
//

import UIKit

class User: NSObject {
    var name: String?
    var screenName: String?
    var profileImageUrl: URL?
    var tagline: String?
    var dictionary: NSDictionary
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
        tagline = dictionary["description"] as? String
        
        let profileImageURLString = dictionary["profile_image_url_https"] as? String
        if let profileImageURLString = profileImageURLString {
            profileImageUrl = URL(string: profileImageURLString)!
        }
    }
}

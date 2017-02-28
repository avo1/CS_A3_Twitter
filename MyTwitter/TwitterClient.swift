//
//  TwitterClient.swift
//  MyTwitter
//
//  Created by Dave Vo on 2/28/17.
//  Copyright © 2017 DaveVo. All rights reserved.
//

import UIKit
import BDBOAuth1Manager


let baseUrl = URL(string: "https://api.twitter.com/")
let consumerKey = "oecUuV0VSomXkKoLlRysUBx9f"
let consumerSecret = "YREG9x6YL93WhrSIyxWK9fSzkoV0gYeMZGnFDrbsB1LaBZBXdm"

class TwitterClient: BDBOAuth1SessionManager {
    static var sharedInstance = TwitterClient(baseURL: baseUrl, consumerKey: consumerKey, consumerSecret: consumerSecret)

    func getUserInfo() {
        _ = get("1.1/account/verify_credentials.json", parameters: nil, progress: nil, success: { (_: URLSessionDataTask, response: Any?) in
            if let response = response  {
                let user = User(dictionary: response as! NSDictionary)
                
                print(user.name!)
                print(user.screenName!)
                print(user.profileImageUrl!)
            }
            
        }, failure: { (_: URLSessionDataTask?, error: Error) in
            print("\(error.localizedDescription)")
        })
    }
    
    func homeTimeline() {
        _ = get("1.1/statuses/home_timeline.json", parameters: nil, progress: nil, success: { (_: URLSessionDataTask, response: Any?) in
            if let response = response  {
                let tweets = response as! [NSDictionary]
                
                for t in tweets {
                    let tweet = Tweet(dictionary: t)
                    print("\(tweet.user?.name!) : \(tweet.text!)")
                }
                
            }
            
        }, failure: { (_: URLSessionDataTask?, error: Error) in
            print("\(error.localizedDescription)")
        })
    }
}

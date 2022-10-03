//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Lyza Cabading on 9/26/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetID, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Favorite Tweet function could not execute: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetID, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Unfavorite Tweet function could not execute: \(error)")
            })
        }
    }
    
    @IBAction func retweetTweet(_ sender: Any) {
        let toBeRetweeted = !retweeted
        if (toBeRetweeted) {
            TwitterAPICaller.client?.retweetTweet(tweetID: tweetID, success: {
                self.setRetweeted(true)
            }, failure: { (error) in
                print("Retweet Tweet function could not execute: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unretweetTweet(tweetID: tweetID, success: {
                self.setRetweeted(false)
            }, failure: { (error) in
                print("Unretweet Tweet function could not execute: \(error)")
            })
        }
    }
    
    var favorited:Bool = false
    var retweeted:Bool = false
    var tweetID:Int = -1
    
    func setRetweeted(_ isRetweeted:Bool) {
        retweeted = isRetweeted
        if (retweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
//            retweetButton.isEnabled = false
        }
        else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
//            retweetButton.isEnabled = true
        }
    }
    
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named: "favor-icon-red") , for: UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage(named: "favor-icon") , for: UIControl.State.normal)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

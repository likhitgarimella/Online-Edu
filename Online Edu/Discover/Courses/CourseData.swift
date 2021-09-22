//
//  CourseData.swift
//  Online Edu
//
//  Created by Likhit Garimella on 01/09/21.
//

import Foundation

class CourseData {
    
    var id: String?
    
    var authorName: String?
    var courseName: String?
    var thumbnail: String?
    var title: String?
    var subTitle: String?
    var rating: String?
    var enrollCounty: String?
    var videoLanguage: String?
    var currentPrice: String?
    var previousPrice: String?
    var discountPercent: String?
    var offerEndsRemainingTime: String?
    var moneyBackGuaranteeDays: String?
    var Duration: String?
    var description: String?
    
    /*
    init (cImage: String, tText: String, dText: String) {
        courseImage = cImage
        titleText = tText
        descText = dText
    }
    */
    
}

extension CourseData {
    
    // Photo
    static func transformPostPhoto(dict: [String: Any], key: String) -> CourseData {
        
        let post = CourseData()
        post.id = key
        post.authorName = dict["authorName"] as? String
        post.courseName = dict["courseName"] as? String
        post.thumbnail = dict["thumbnail"] as? String
        post.title = dict["title"] as? String
        post.subTitle = dict["subTitle"] as? String
        post.rating = dict["rating"] as? String
        post.enrollCounty = dict["enrollCounty"] as? String
        post.videoLanguage = dict["videoLanguage"] as? String
        post.currentPrice = dict["currentPrice"] as? String
        post.previousPrice = dict["previousPrice"] as? String
        post.discountPercent = dict["discountPercent"] as? String
        post.offerEndsRemainingTime = dict["offerEndsRemainingTime"] as? String
        post.moneyBackGuaranteeDays = dict["moneyBackGuaranteeDays"] as? String
        post.Duration = dict["Duration"] as? String
        post.description = dict["description"] as? String
        
        return post
        
    }
    
}   // #68

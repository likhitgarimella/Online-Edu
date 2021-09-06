//
//  CourseData.swift
//  Online Edu
//
//  Created by Likhit Garimella on 01/09/21.
//

import Foundation

class CourseData {
    
    var id: String?
    
    var courseImage: String?
    var titleText: String?
    var descText: String?
    
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
        post.courseImage = dict["thumbnail"] as? String
        post.titleText = dict["title"] as? String
        post.descText = dict["description"] as? String
        
        return post
        
    }
    
}   // #44

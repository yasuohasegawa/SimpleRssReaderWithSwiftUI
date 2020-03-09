//
//  FeedData.swift
//  RssReaderWithSwiftUI
//
//  Created by Yasuo Hasegawa on 2020/03/06.
//  Copyright © 2020 Yasuo Hasegawa. All rights reserved.
//

import Foundation

struct Feed: Codable {
    var channel:Channel
}

struct Channel: Codable {
    var item:[Item]
}

struct Item: Hashable, Codable {
    var title:String
    var link:String
    var guid:String
    var description:String
    var pubDate:String
}

struct ListItem: Hashable, Identifiable {
    var id = UUID()
    var title:String
    var link:String
    var guid:String
    var description:String
    var pubDate:String
}

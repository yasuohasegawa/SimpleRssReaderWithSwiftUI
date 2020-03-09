//
//  UserData.swift
//  RssReaderWithSwiftUI
//
//  Created by Yasuo Hasegawa on 2020/03/06.
//  Copyright © 2020 Yasuo Hasegawa. All rights reserved.
//

import Foundation

class UserData:ObservableObject {
    @Published var items: [Item]? = nil
    
    func loadFeed(url:String) {
        FeedUtils.get(urlString: url, completion: { (response) in
            switch response {
            case .success(let items):
                DispatchQueue.main.async() { () -> Void in
                    self.items = items
                }
            case .failure(let err):
                print("fail: \(err)")
            }
        })
    }
}

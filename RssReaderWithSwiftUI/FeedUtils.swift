//
//  FeedUtils.swift
//  RssReaderWithSwiftUI
//
//  Created by Yasuo Hasegawa on 2020/03/06.
//  Copyright © 2020 Yasuo Hasegawa. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidData
    case parseFail
}

class FeedUtils {
    static var descPattern = "<(\"[^\"]*\"|\'[^\']*\'|[^\'\">])*>"
    // TODO: We need to add timeout logic when it gets fail or try to use alamofire lib for this.
    static func get(urlString: String, completion: @escaping (Result<[Item], Error>) -> ()) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            
            let decoder = JSONDecoder()
            guard let feed = try?decoder.decode(Feed.self, from: data) else {
                completion(.failure(NetworkError.parseFail))
                return
            }
            completion(.success(feed.items))
        })
        task.resume()
    }
    
    static func thumurl(desc:String)->String {
        let srcPattern = "(src=)[\"|\'](.*?)[\"|\']+"
        let htmltag = desc.extractAll(pattern: FeedUtils.descPattern).joined()
        var thumSrc = htmltag.extractAll(pattern: srcPattern).joined()
        thumSrc = thumSrc.replacingOccurrences(of: "src=", with: "")
        thumSrc = thumSrc.replacingOccurrences(of: "\"", with: "")
        return thumSrc
    }
    
    static func description(desc:String)->String {
        let desc = desc.replaceAll(pattern: FeedUtils.descPattern, to: "")
        return desc
    }
    
    static func https(link:String)->String {
        let url = link.replacingOccurrences(of: "http", with: "https")
        return url
    }
}

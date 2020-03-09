//
//  ImageDownloader.swift
//  RssReaderWithSwiftUI
//
//  Created by Yasuo Hasegawa on 2020/03/06.
//  Copyright © 2020 Yasuo Hasegawa. All rights reserved.
//

import Foundation
import SDWebImage

class ImageDownloader:ObservableObject {
    @Published var downloadedData:Data? = nil
    func downloadImage(url:String) {
        guard let imageURL = URL(string: url) else { return }
        let urlRef = url
        SDWebImageManager.shared.loadImage(with: imageURL,
                                           options: .progressiveLoad,
                                           context: nil,
                                           progress: nil,
                                           completed: { (image, data, error, cache, finished, url) in
                                            
                                            if data == nil {
        SDImageCache.shared.diskImageExists(withKey: urlRef) { exists in
            if exists {
                self.downloadedData = SDImageCache.shared.diskImageData(forKey: urlRef)
            }
        }
                                            } else {
                                                self.downloadedData = data;
                                            }
        })
    }
}

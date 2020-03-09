//
//  URLImage.swift
//  RssReaderWithSwiftUI
//
//  Created by Yasuo Hasegawa on 2020/03/06.
//  Copyright © 2020 Yasuo Hasegawa. All rights reserved.
//

import SwiftUI

struct URLImage: View {
    @ObservedObject private var imageDownloader = ImageDownloader()
    let url:String
    init(url:String){
        self.url = url
        self.imageDownloader.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let imageData = self.imageDownloader.downloadedData {
            let img = UIImage(data:imageData)
            return VStack{
                Image(uiImage:img!).resizable()
            }
        } else {
            return VStack{
                Image("placeholder").resizable()
            }
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url:Constants.imageURL)
    }
}

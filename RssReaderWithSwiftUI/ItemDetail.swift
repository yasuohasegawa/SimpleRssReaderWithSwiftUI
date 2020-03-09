//
//  ItemDetail.swift
//  RssReaderWithSwiftUI
//
//  Created by Yasuo Hasegawa on 2020/03/06.
//  Copyright © 2020 Yasuo Hasegawa. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    let item:ListItem
    
    init(data:ListItem){
        self.item = data
    }
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text(FeedUtils.description(desc: self.item.description)).padding()
            Text(self.item.pubDate).padding()
            
            NavigationLink(destination:WebView(url: FeedUtils.https(link: self.item.link))) {
                Text(self.item.link)
            }.padding()
            
            Spacer()
        }
        .navigationBarTitle(Text(self.item.title), displayMode: .inline)
    }
}

/*
struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail()
    }
}
*/

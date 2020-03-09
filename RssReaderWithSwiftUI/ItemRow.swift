//
//  ItemRow.swift
//  RssReaderWithSwiftUI
//
//  Created by Yasuo Hasegawa on 2020/03/06.
//  Copyright © 2020 Yasuo Hasegawa. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    let item:ListItem
    
    init(data:ListItem){
        self.item = data
    }
    
    var body: some View {
        HStack{
            URLImage(url: FeedUtils.thumurl(desc: self.item.description)).frame(width: 50, height: 50)
            Text(self.item.title)
        }
    }
}

/*
struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(tit:"test title")
    }
}
*/

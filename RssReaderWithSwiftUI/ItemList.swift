//
//  ItemList.swift
//  RssReaderWithSwiftUI
//
//  Created by Yasuo Hasegawa on 2020/03/06.
//  Copyright © 2020 Yasuo Hasegawa. All rights reserved.
//

import SwiftUI

struct ItemList: View {
    let items: [Item]
    private var listItems:[ListItem] = []

    init(data:[Item]){
        self.items = data
        for item in self.items {
            let li:ListItem = ListItem(title: item.title, link:item.link, guid:item.guid, description:item.description, pubDate:item.pubDate);
            //print(li.title)
            listItems.append(li)
        }
    }
    
    var body: some View {
        List {
            ForEach(self.listItems) {item in
                NavigationLink(destination:ItemDetail(data: item)) {
                    ItemRow(data: item)
                }
            }
        }
        .navigationBarTitle(Text("SneakerWars"))
    }
}

/*
struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        ItemList()
    }
}
*/

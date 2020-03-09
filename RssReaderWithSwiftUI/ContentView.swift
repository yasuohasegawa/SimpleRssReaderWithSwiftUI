//
//  ContentView.swift
//  RssReaderWithSwiftUI
//
//  Created by Yasuo Hasegawa on 2020/03/05.
//  Copyright © 2020 Yasuo Hasegawa. All rights reserved.
//

import UIKit
import SwiftUI

struct ContentView: View {
    @ObservedObject private var userData = UserData()
    
    init() {
        userData.loadFeed(url: Constants.feedURL)
    }
    
    var body: some View {
        if let items = self.userData.items {
            return AnyView(NavigationView {ItemList(data:items)})
        } else {
            return AnyView(Text("loading..."))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

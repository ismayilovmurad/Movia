//
//  ContentView.swift
//  Movia
//
//  Created by Murad Ismayilov on 17.05.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView { MovieHomeView() }
            .tabItem { Label("Home", systemImage: "film")}
            .tag(0)
            
            NavigationView { MovieSearchView() }
            .tabItem { Label("Search", systemImage: "magnifyingglass")}
            .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

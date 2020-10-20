//
//  TabBar.swift
//  Cryptic
//
//  Created by Karen Teja on 10/12/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Homepage()
            .tabItem{
                Image(systemName:"house.fill")
                Text("home")
            }
            ProfileScreen()
            .tabItem{
                Image(systemName:"magnifyingglass.circle.fill")
                Text("Search")
            }
            Riddle1()
            .tabItem{
                Image(systemName:"person.circle")
                Text("Profile")
            }
            
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear{
            UITabBar.appearance().backgroundColor = .white
        }.accentColor(Color("primarytext"))
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

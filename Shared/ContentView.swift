//
//  ContentView.swift
//  Shared
//
//  Created by ECO0836_ANHPT on 08/11/2022.
//

import SwiftUI
import StackNavigationView

struct ContentView: View {
    @State var selection:Int? = 0
    var body: some View {
        StackNavigationView(selection: $selection) {
            SidebarNavigationLink(
                destination: HomeScreen(),
                tag: 0,
                selection: $selection
            ){
                Text("Home")
                    .expandedWidth()
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .defaultFrame()
    }
}

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
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        StackNavigationView(selection: $selection) {
            VStack{
                SidebarNavigationLink(
                    destination: HomeScreen(),
                    tag: 0,
                    selection: $selection
                ){
                    Text("Home")
                        .expandedWidth()
                }
                
//                Button {
//                    testFunc()
//                } label: {
//                    Text("Test Function")
//                }
                

            }
            .padding()
        }
        
        
    }
}

extension ContentView{
    func testFunc(){
        let model = TagModel(context: moc)
        model.id = UUID()
        model.name = "Utils"
        
        
        let model1 = TagModel(context: moc)
        model1.id = UUID()
        model1.name = "macOS"
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .defaultFrame()
    }
}

//
//  NoteModifyScreen.swift
//  NhatKyAnHanh
//
//  Created by ECO0836_ANHPT on 08/11/2022.
//

import SwiftUI

struct NoteModifyScreen: View {
    @State var title:String = ""
    @State var content:String = ""
    @State var tagKeyword:String = ""
    @State var listTag:[TagModel] = []
    @State var shouldShowTagSuggestion:Bool = false
    
    var body: some View {
        VStack(alignment:.leading){
            Button {
                
            } label: {
                Text("Save")
            }

            Text("Title")
            TextField("", text: $title)
            
            Text("Content")
            TextView(text: $content)
            
            Text("Tag")
            
            Button {
                shouldShowTagSuggestion = true
            } label: {
                HStack{
                    Image(systemName: "plus")
                    Text("Add Tag")
                }
            }.popover(isPresented: $shouldShowTagSuggestion,arrowEdge:.bottom) {
                renderTagSearchView
            }
            
        }
        .padding()
    }
    
    var renderTagSearchView : some View{
        VStack{
            TextField("", text: $tagKeyword)
            List{
                ForEach(["A","B","C"],id: \.self) { item in
                    Text(item)
                        .expandedWidth()
                        .contentShape(Rectangle())
                        .onTapGesture {
                            print(item)
                        }
                }
            }
        }
        .padding()
        .width(300)
        .height(200)
    }
}

struct NoteModifyScreen_Previews: PreviewProvider {
    static var previews: some View {
        NoteModifyScreen()
            .defaultFrame()
    }
}

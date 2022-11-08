//
//  NoteModifyScreen.swift
//  NhatKyAnHanh
//
//  Created by ECO0836_ANHPT on 08/11/2022.
//

import SwiftUI
import StackNavigationView

struct NoteModifyScreen: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var listTagData:FetchedResults<TagModel>
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
            
            HStack{
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
                
                ForEach(listTag,id: \.id){tag in
                    Text(tag.name ?? "")
                }
            }
            
        }
        .padding()
    }
    
    var renderTagSearchView : some View{
        VStack{
            HStack{
                TextField("", text: $tagKeyword)
                
                Button {
                    addNewTag()
                } label: {
                    Text("Add")
                }
                
                StackNavigationLink (
                    "Modify",
                    destination: TagModifyScreen()
                )
                
                
            }
            List{
                ForEach(listTagData,id: \.id) { item in
                    Text(item.name ?? "")
                        .expandedWidth(alignment: .leading)
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

extension NoteModifyScreen{
    func addNewTag(){
        guard !tagKeyword.isEmpty else{return}
        let model = TagModel(context: moc)
        model.id = UUID()
        model.name = tagKeyword
        
        try? moc.save()
    }
}

struct NoteModifyScreen_Previews: PreviewProvider {
    static var previews: some View {
        NoteModifyScreen()
            .defaultFrame()
    }
}

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
    @Environment(\.presentationMode) var presentationMode
    
    @FetchRequest(sortDescriptors: []) var listTagData:FetchedResults<TagModel>
    @State var title:String = ""
    @State var content:String = ""
    @State var tagKeyword:String = ""
    @State var listTag:[TagModel] = []
    @State var shouldShowTagSuggestion:Bool = false
    
    var body: some View {
        VStack(alignment:.leading){
            Button {
                saveNewNote()
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save")
            }
            .disabled(!canSaveNote())

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
                    Button {
                        removeTagFromNote(tag)
                    } label: {
                        HStack{
                            Text(tag.name ?? "")
                            Image(systemName: "xmark")
                        }
                    }

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
                            addTagToNote(item)
                            shouldShowTagSuggestion = false
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
    func canSaveNote() -> Bool{
        return !title.isEmpty && !content.isEmpty && !listTag.isEmpty
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
    
    func addTagToNote(_ tag:TagModel){
        listTag.append(tag)
    }
    
    func removeTagFromNote(_ tag:TagModel){
        guard let index = listTag.firstIndex(of: tag) else{return}
        listTag.remove(at: index)
    }
    
    func saveNewNote(){
        let note = NoteModel(context: moc)
        note.id = UUID()
        note.title = title
        note.content = content
        note.tags = NSSet(array: listTag)
        
        try? moc.save()
    }
}

struct NoteModifyScreen_Previews: PreviewProvider {
    static var previews: some View {
        NoteModifyScreen()
            .defaultFrame()
    }
}

//
//  HomeScreen.swift
//  NhatKyAnHanh
//
//  Created by ECO0836_ANHPT on 08/11/2022.
//

import SwiftUI
import StackNavigationView

enum SearchOption:String,Hashable,CaseIterable{
    case keyword = "Keyword"
    case tag = "Tag"
}

struct HomeScreen: View {
    @State var keyworld:String = ""
    @State var searchOption:[SearchOption] = [.keyword,.tag]
    @State var searchRule:SearchOption = .keyword
    @FetchRequest(sortDescriptors: []) var listNote:FetchedResults<NoteModel>
    
    var body: some View {
        VStack(alignment:.leading){
            StackNavigationLink (
                "Add Note",
                destination: NoteModifyScreen()
            )

            HStack{
                TextField("Search...", text: $keyworld)
                
                Picker("",selection: $searchRule) {
                    ForEach(searchOption,id: \.self){option in
                        Text(option.rawValue)
                    }
                }
                .width(100)
                
                Button {
                    performSearch()
                } label: {
                    Text("Search")
                }

            }
            
            
            List{
                ForEach(listNote){note in
                    Text(note.title ?? "")
                }
            }
        }
        .padding()
    }
}

extension HomeScreen{
    func performSearch(){
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .defaultFrame()
    }
}

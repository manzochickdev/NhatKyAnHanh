//
//  TagModifyScreen.swift
//  NhatKyAnHanh
//
//  Created by ECO0836_ANHPT on 08/11/2022.
//

import SwiftUI

struct TagModifyScreen: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var listTagData:FetchedResults<TagModel>
    
    var body: some View {
        VStack{
            List{
                ForEach(listTagData,id: \.id) { item in
                    HStack{
                        Text(item.name ?? "")
                            .expandedWidth(alignment: .leading)
                            .contentShape(Rectangle())
                        Spacer()
                        
                        Button {
                            moc.delete(item)
                            try? moc.save()
                        } label: {
                            Text("Delete")
                        }

                    }
                        
                }
            }
        }
        .padding()
    }
}

struct TagModifyScreen_Previews: PreviewProvider {
    static var previews: some View {
        TagModifyScreen()
    }
}

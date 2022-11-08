//
//  HomeScreen.swift
//  NhatKyAnHanh
//
//  Created by ECO0836_ANHPT on 08/11/2022.
//

import SwiftUI

struct HomeScreen: View {
    @State var keyworld:String = ""
    
    var body: some View {
        VStack{
            TextField("Search...", text: $keyworld)
        }
        .padding()
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .defaultFrame()
    }
}

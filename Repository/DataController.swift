//
//  DataController.swift
//  NhatKyAnHanh
//
//  Created by ECO0836_ANHPT on 08/11/2022.
//

import Foundation
import CoreData

class DataController:ObservableObject{
    let container = NSPersistentContainer(name: "LocalDatabase")
    
    init(){
        container.loadPersistentStores { desc, err in
            
        }
    }
}

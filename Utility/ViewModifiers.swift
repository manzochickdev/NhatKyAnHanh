//
//  ViewModifiers.swift
//  NhatKyAnHanh (iOS)
//
//  Created by ECO0836_ANHPT on 08/11/2022.
//

import Foundation
import SwiftUI

extension View{
    func defaultFrame() -> some View{
        self.frame(minWidth: 800, maxWidth: .infinity, minHeight: 500, maxHeight: .infinity)
    }
}

extension View{
    func expanded(alignment: Alignment? = nil) -> some View {
        self.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: alignment ?? .center)
    }
    
    func expandedWidth(alignment: Alignment? = nil) -> some View {
        self.frame(maxWidth: .infinity, alignment: alignment ?? .center)
    }
    
    func expandedHeight(alignment: Alignment? = nil) -> some View {
        self.frame(maxHeight: .infinity, alignment: alignment ?? .center)
    }
    
    func height(_ value: CGFloat,alignment: Alignment? = nil) -> some View {
        self.frame(height: value,alignment: alignment ?? .center)
    }
    
    func width(_ value: CGFloat,alignment: Alignment? = nil) -> some View {
        self.frame(width: value,alignment: alignment ?? .center)
    }
    
}

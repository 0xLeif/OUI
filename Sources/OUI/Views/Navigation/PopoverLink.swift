//
//  PopoverLink.swift
//  
//
//  Created by Zach Eriksen on 12/3/20.
//

import SwiftUI

public struct PopoverLink<Content, Label>: View where Content: View,
                                               Label: View {
    @State private var isPushed: Bool = false
    
    public var content: () -> Content
    public var label: () -> Label
    
    public init(
        content: @escaping () -> Content,
        label: @escaping () -> Label
    ) {
        self.content = content
        self.label = label
    }
    
    public var body: some View {
        label()
            .onTapGesture {
                isPushed = true
            }
            .popover(isPresented: $isPushed) {
                content()
            }
    }
}



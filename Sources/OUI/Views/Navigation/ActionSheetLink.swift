//
//  ActionSheetLink.swift
//  
//
//  Created by Zach Eriksen on 12/3/20.
//

import SwiftUI

public struct ActionSheetLink<Label>: View where Label: View {
    @State private var isPushed: Bool = false
    
    public var content: () -> ActionSheet
    public var label: () -> Label
    
    public init(
        content: @escaping () -> ActionSheet,
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
            .actionSheet(isPresented: $isPushed) {
                content()
            }
    }
}

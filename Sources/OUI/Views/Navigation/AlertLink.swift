//
//  AlertLink.swift
//  
//
//  Created by Zach Eriksen on 12/3/20.
//

import SwiftUI

public struct AlertLink<Label>: View where Label: View {
    @State private var isPushed: Bool = false
    
    public var content: () -> Alert
    public var label: () -> Label
    
    public init(
        content: @escaping () -> Alert,
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
            .alert(isPresented: $isPushed) {
                content()
            }
    }
}

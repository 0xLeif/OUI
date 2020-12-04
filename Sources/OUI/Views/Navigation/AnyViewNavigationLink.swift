//
//  AnyViewNavigationLink.swift
//  
//
//  Created by Zach Eriksen on 12/3/20.
//

import SwiftUI

public typealias AnyViewClosure = () -> AnyView

public enum NavigationLinkStyle: String {
    case `default`
    case none
}

public struct AnyViewNavigationLink<Content>: View where Content: View {
    @State private var isPushed: Bool = false
    
    @Binding public var destination: AnyViewClosure?
    
    public var style: NavigationLinkStyle = .default
    public var label: () -> Content
    
    public init(
        destination: Binding<AnyViewClosure?>,
        style: NavigationLinkStyle = .default,
        label: @escaping () -> Content
    ) {
        self._destination = destination
        self.style = style
        self.label = label
    }
    
    public var body: some View {
        guard let destination = destination else {
            return label().any
        }
        
        guard style == .default else {
            return label()
                .background(
                    NavigationLink(
                        destination: destination(),
                        isActive: $isPushed,
                        label: { label() }
                    )
                    .hidden()
                ).any
        }
        
        return NavigationLink(
            destination: destination(),
            isActive: $isPushed,
            label: { label() }
        ).any
    }
}

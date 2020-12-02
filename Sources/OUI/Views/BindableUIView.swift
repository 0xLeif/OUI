//
//  BindableUIView.swift
//  
//
//  Created by Zach Eriksen on 12/1/20.
//

import SwiftUI

public struct BindableUIView<BindingValue, SomeUIView>: UIViewRepresentable where SomeUIView: UIView {
    @Binding public var value: BindingValue
    
    private var initialView: SomeUIView
    
    private var configure: (SomeUIView) -> Void
    private var update: (SomeUIView) -> Void
    
    public init(
        value: Binding<BindingValue>,
        initialView: SomeUIView,
        configure: @escaping (SomeUIView) -> Void,
        update: @escaping (SomeUIView) -> Void
    ) {
        self._value = value
        self.initialView = initialView
        self.configure = configure
        self.update = update
    }

    public func makeUIView(context: Context) -> SomeUIView {
        configure(initialView)
        return initialView
    }

    public func updateUIView(_ uiView: SomeUIView, context: Context) {
        update(uiView)
    }
}

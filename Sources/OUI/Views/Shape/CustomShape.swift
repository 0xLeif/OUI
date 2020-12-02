//
//  CustomShape.swift
//  
//
//  Created by Zach Eriksen on 12/1/20.
//

import SwiftUI

public struct CustomShape: Shape {
    public var path: (CGRect) -> Path
    
    public init(_ closure: @escaping (CGRect) -> Path) {
        path = closure
    }
    
    public func path(in rect: CGRect) -> Path {
        path(rect)
    }
}

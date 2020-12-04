//
//  AsyncImage.swift
//  
//
//  Created by Zach Eriksen on 12/3/20.
//

import SwiftUI
import Combine
import SURL

public class ImageLoader: ObservableObject {
    private var cancellable: AnyCancellable?
    private let url: URL?
    
    @Published public var image: UIImage?

    public init(url: URL?) {
        self.url = url
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    public func load() {
        guard let url = url else {
            return
        }
        
        cancellable = url.dataTaskPublisher
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
        
    }
}

@available(iOS 14.0, *)
public struct AsyncImage<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder
    
    public init(
        url: URL,
        @ViewBuilder placeholder: () -> Placeholder
    ) {
        self.placeholder = placeholder()
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    public var body: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
            } else {
                placeholder
            }
        }
        .onAppear(perform: loader.load)
    }
}

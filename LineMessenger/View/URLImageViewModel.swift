//
//  URLImageViewModel.swift
//  LineMessenger
//
//  Created by 양시관 on 3/14/24.
//

import Foundation

import UIKit
import Combine

class URLImageViewModel: ObservableObject {
    
    var loadingOrSuccess: Bool {
        return loading || loadedImage != nil
    }
    
    @Published var loadedImage: UIImage?
    
    private var loading: Bool = false
    private var urlString: String
    private var container: DIContainer
    private var subscriptions = Set<AnyCancellable>()

    init(container: DIContainer, urlString: String) {
        self.container = container
        self.urlString = urlString
    }
    
    func start() {
        guard !urlString.isEmpty else { return }
        
        loading = true
        
        container.services.imageCacheService.image(for: urlString)
            .subscribe(on: DispatchQueue.global())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] image in
                self?.loading = false
                self?.loadedImage = image
            }.store(in: &subscriptions)
    }
}

//
//  ImageURLLoader.swift
//  ImageURLLoader
//
//  Created by Xuwei Liang on 27/11/20.
//

import Foundation
import UIKit

public final class ImageURLLoader: ImageURLLoaderProtocol {
   
    private let statusOk = 200
    private let imageLoaderSession: URLSession
    
    init(timeout: Double) {
        let sessionConfig = URLSessionConfiguration.default
        // added timeout to avoid getting stuck when connectivity is cut
        sessionConfig.timeoutIntervalForRequest = timeout
        sessionConfig.timeoutIntervalForResource = timeout
        imageLoaderSession = URLSession(configuration: sessionConfig)
    }
    
    func loadImage(from urlString: String, completionHandler: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else { completionHandler(nil); return }
        let dataTask = imageLoaderSession.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { completionHandler(nil); return }
            guard let response = response as? HTTPURLResponse, response.statusCode == self.statusOk else { completionHandler(nil); return }
            guard let data = data else { completionHandler(nil); return }
            guard let _ = error else { completionHandler(nil); return }
            guard let image = UIImage(data: data) else { completionHandler(nil); return }
            // return image
            completionHandler(image)
        }
        
        dataTask.resume()
    }
}

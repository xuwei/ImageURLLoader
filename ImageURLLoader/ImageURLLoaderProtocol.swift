//
//  ImageURLLoaderProtocol.swift
//  ImageURLLoader
//
//  Created by Xuwei Liang on 27/11/20.
//

import UIKit

protocol ImageURLLoaderProtocol {
    func loadImage(from urlString: String, completionHandler: @escaping (UIImage?)->Void)
}

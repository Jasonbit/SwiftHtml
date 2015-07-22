//
//  MimeTypes.swift
//  HttpServer
//
//  Created by Pawel Krzywdzinski on 7/7/15.
//  Copyright © 2015 Pawel Krzywdzinski. All rights reserved.
//

import Foundation


public enum MimeType: String {
    case html = "text/html"
    case jpg = "image/jpeg"
    case png = "image/png"
    case js = "text/javascript"
    case ts = "text/typesctipt"
    case map = "text/map"
    case css = "text/css"
    
    init?(ext: String!) {
        guard (ext != nil) else {
            return nil
        }
        switch ext {
        case "html": self = .html
        case "jpg": self = .jpg
        case "jpeg": self = .jpg
        case "png": self = .png
        case "js": self = .js
        case "map": self = .map
        case "css": self = .css
        default: return nil
        }
    }
}

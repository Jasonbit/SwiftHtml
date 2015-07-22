//
//  HttpResponse.swift
//  HttpServer
//
//  Created by Pawel Krzywdzinski on 7/7/15.
//  Copyright © 2015 Pawel Krzywdzinski. All rights reserved.
//

import Foundation

public class HttpResponse {
    let clientSocket: Socket
    
    public var mimeType = MimeType.html
    public var data: NSData?
    
    init (clientSocket: Socket) {
        self.clientSocket = clientSocket
    }
    
    
    func writeData() {
        
        let httpData = NSMutableData()
        let header: String
        let compressedData: NSData
        
        if (data != nil) {
            compressedData = CompressZLib.compressData(data!)
            header = "HTTP/1.1 200 OK\n"
        } else {
            compressedData = CompressZLib.compressData("<body><h1>HTTP Server</h1><p>Error - Asset not found.</p></body>".dataUsingEncoding(NSASCIIStringEncoding)!)
            header = "HTTP/1.1 404 Not Found\n"
        }
        
        let contentType = "Content-Type: \(mimeType.rawValue)\n"
        let contentCompression = "Content-Encoding: deflate\n"
        let contentLength = "Content-Length: \(compressedData.length)\n"
        let dataString = header + contentType + contentCompression + contentLength + "\n"
        
        httpData.appendData(NSData(data: dataString.dataUsingEncoding(NSASCIIStringEncoding)!))
        httpData.appendData(compressedData)
        
        write(clientSocket.handle, httpData.bytes, httpData.length)
    }
}

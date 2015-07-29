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
    
    
	func writeData(accepptCompression : Bool = false) {
		
        let httpData = NSMutableData()
        let header: String
        let contentData: NSData
		var isCompressed = false
		
        if (data != nil) {
			isCompressed = accepptCompression
			contentData = isCompressed ? CompressZLib.compressData(data!) : data!
            header = "HTTP/1.1 200 OK\r\n"
        } else {
            contentData = "<body><h1>HTTP Server</h1><p>Error - Asset not found.</p></body>".dataUsingEncoding(NSASCIIStringEncoding)!
            header = "HTTP/1.1 404 Not Found\r\n"
        }
        
        let contentType = "Content-Type: \(mimeType.rawValue)\r\n"
		let contentCompression = (isCompressed ? "Content-Encoding: deflate\r\n" : "")
        let contentLength = "Content-Length: \(contentData.length)\r\n"
        let dataString = header + contentType + contentCompression + contentLength + "\r\n"
        
        httpData.appendData(NSData(data: dataString.dataUsingEncoding(NSASCIIStringEncoding)!))
        httpData.appendData(contentData)
        
        write(clientSocket.handle, httpData.bytes, httpData.length)
    }
}

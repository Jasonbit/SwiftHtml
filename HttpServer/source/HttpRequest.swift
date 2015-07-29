//
//  HttpRequest.swift
//  HttpServer
//
//  Created by Pawel Krzywdzinski on 7/7/15.
//  Copyright © 2015 Pawel Krzywdzinski. All rights reserved.
//

import Foundation

public enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

public class HttpRequest {
    let clientSocket: Socket
    
    public var httpMethod: HttpMethod?
    public var url: String?
    public var version: Float?
	
	public var fields = [String:String]()
    
    init(clientSocket: Socket) {
        
        self.clientSocket = clientSocket

    }
    
    func readData() {
        var sendData = [UInt32](count: Socket.Const.MaxReceiveSize, repeatedValue: 0)
        let count = read(clientSocket.handle, &sendData, Socket.Const.MaxReceiveSize)
        let requestString: String = NSString(bytes: sendData, length: count, encoding: NSASCIIStringEncoding)! as String
		print(requestString)
        var strLines = requestString.stringByReplacingOccurrencesOfString("\r\n", withString: "\n").componentsSeparatedByString("\n")
        if strLines.count > 0 {
            let httpHeader = strLines[0].componentsSeparatedByString(" ")
            if httpHeader.count == 3 {
                switch httpHeader[0] {
                case "GET": httpMethod = .get
                case "POST": httpMethod = .post
                default: httpMethod = nil
                }
                url = httpHeader[1]
                let versionArray = httpHeader[2].componentsSeparatedByString("/")
                if versionArray.count == 2 {
                    version = Float(versionArray[1])
                }
            }
        }
		strLines.removeAtIndex(0)
		for strLine in strLines {
			let components = strLine.componentsSeparatedByString(":")
			if components.count == 2 {
				fields[components[0]] = components[1]
			}
		}
    }
}

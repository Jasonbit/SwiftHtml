//
//  Server.swift
//  HttpServer
//
//  Created by Pawel Krzywdzinski on 6/23/15.
//  Copyright © 2015 Pawel Krzywdzinski. All rights reserved.
//

import Foundation

public enum ServerError : ErrorType {
    case CantBindToSocket
    case CantStartListening
    case CantAcceptConnection
}

func toUnsafeMutablePointer<T,S> (inPointer : UnsafePointer<T>) -> UnsafeMutablePointer<S> {
    return unsafeBitCast(inPointer, UnsafeMutablePointer<S>.self)
}

public typealias HttpRequestListener = ((request: HttpRequest, response: HttpResponse) throws -> ());

public class HttpServer: Socket {
    
    var delegate: HttpRequestListener;
    
    public init(onPort: UInt16, delegate: HttpRequestListener) throws {
    
        self.delegate = delegate;
        
        try super.init()
    
        var status = Int32(0)

        defer {
            if status == Const.StatusErr { close(handle) }
        }
        
        var address = sockaddr_in()
        
        address.sin_family = sa_family_t(AF_INET)
        address.sin_port = Socket.ntohs(onPort)
        
        status = bind(handle, toUnsafeMutablePointer(&address), socklen_t(sizeof(sockaddr_in)))
        if status == Const.StatusErr {
            throw ServerError.CantBindToSocket
        }
        
        status = listen(handle, 10)
        if status == Const.StatusErr {
            throw ServerError.CantStartListening
        }
    }
    
    
    func acceptClient() throws -> Socket {
    
        var address = sockaddr(), len = socklen_t(0)
        
        let clientSocketHandle = accept(handle, &address, &len)
        if clientSocketHandle == Const.SocketHandleIsNull {
            throw ServerError.CantAcceptConnection
        }
        
        let clientSocket = Socket(socketHandle: clientSocketHandle)
        
        try clientSocket.setNoSigPipeForSocket()
        
        return clientSocket
    }
    

    public func run() {
		while(true) {
			autoreleasepool {
				
				let clientSocket = try! acceptClient()
				
				
				let request = HttpRequest(clientSocket: clientSocket);
				let response = HttpResponse(clientSocket: clientSocket)
				
				request.readData()
				
				try! self.delegate(request: request, response: response)
				
				response.mimeType = MimeType(ext: request.url?.pathExtension) ?? MimeType.html
				
				response.writeData(request.fields["Accept-Encoding"]?.rangeOfString("deflate") != nil)
				
			}
        }
    }
	
}


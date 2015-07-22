//
//  Socket.swift
//  HttpServer
//
//  Created by Pawel Krzywdzinski on 6/23/15.
//  Copyright © 2015 Pawel Krzywdzinski. All rights reserved.
//

import Foundation

public enum SocketError : ErrorType {
    case CantCreate
    case CantSetReuseAddr
    case CantSetNoSigPipe
}

public class Socket {
    
    // consts
	enum Const {
        static let SocketHandleIsNull = Int32(-1)
        static let StatusErr = Int32(-1)
        static let StatusNoErr = Int32(0)
        static let MaxReceiveSize = Int(9216)
    }
    
    var handle: Int32
    
    init(socketHandle: Int32) {
        self.handle = socketHandle
    }
    
    init() throws {
        handle = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)
        if handle == Const.SocketHandleIsNull {
            throw SocketError.CantCreate
        }
        
        do {
            
            try setReuseAddrForSocket()
            try setNoSigPipeForSocket()
            
        } catch {
            close(handle)
            throw error
        }
    }
    
    deinit {
        close(handle)
    }
    
    func setReuseAddrForSocket() throws {
        var reuseaddr = Int32(1)
        let status = setsockopt(handle, SOL_SOCKET, SO_REUSEADDR, &reuseaddr, socklen_t(sizeof(Int32)))
        if (status == Const.StatusErr) { throw SocketError.CantSetReuseAddr }
    }
    
    func setNoSigPipeForSocket() throws {
        var nosigpipe = Int32(1)
        let status = setsockopt(handle, SOL_SOCKET, SO_NOSIGPIPE, &nosigpipe, socklen_t(sizeof(Int32)))
        if (status == Const.StatusErr) { throw SocketError.CantSetNoSigPipe }
    }
    
    
    //---- static
    
    static func ntohs(value: UInt16) -> UInt16 {
        return (value << 8) + (value >> 8);
    }
}


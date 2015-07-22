//
//  CompressZlib.swift
//  HttpServer
//
//  Created by Pawel Krzywdzinski on 6/23/15.
//  Copyright © 2015 Pawel Krzywdzinski. All rights reserved.
//


import Foundation


class CompressZLib {

    static func compressData(data: NSData) -> NSData {
        
        let maxBlockSize = Int(16384)
        
        let outputData = NSMutableData(capacity: maxBlockSize)!
        let inputStream = NSInputStream(data: data)
        
        inputStream.open()
        
        let level = Z_DEFAULT_COMPRESSION
        var strm = z_stream()
		
        memset(&strm, 0, size_t(sizeof(z_stream)))
        var status = deflateInit_(&strm, level, ZLIB_VERSION, Int32(sizeof(z_stream)))
		assert(status != Z_STREAM_ERROR);
		
        var inBuff = [UInt8](count: maxBlockSize, repeatedValue: 0)
        var outBuff = [UInt8](count: maxBlockSize, repeatedValue: 0)
        
		var flush = Int32(0)
		
		repeat {
            strm.avail_in = uInt(inputStream.read(&inBuff, maxLength: maxBlockSize))

            flush = inputStream.hasBytesAvailable ? Z_NO_FLUSH : Z_FINISH;
            
            strm.next_in = toUnsafeMutablePointer(&inBuff);
            
            repeat {
                strm.avail_out = uInt(maxBlockSize);
                strm.next_out = toUnsafeMutablePointer(&outBuff);
                status = deflate(&strm, flush);
                assert(status != Z_STREAM_ERROR);
                let length = maxBlockSize - Int(strm.avail_out);
				
                outputData.appendBytes(&outBuff, length: length)
                
            } while (strm.avail_out == 0);
            assert(strm.avail_in == 0);
            
        } while(flush != Z_FINISH)
        
        return outputData;
    }
}

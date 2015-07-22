//
//  Links.swift
//  SwiftHtml
//
//  Created by Pawel Krzywdzinski on 7/22/15.
//  Copyright © 2015 Pawel Krzywdzinski. All rights reserved.
//

import Foundation


//---------------------------- Links -----------------------------------



public class a$ : HtmlControl {
	override var name: String { return "a" }
	
	enum Attribute : HtmlAttribute {
		case download(String?)
		case href(String)
		case hreflang(String)
		case media(String)
		case rel([HtmlRel])
		case target(HtmlTarget?,String?)
		case type(String)
		
		
		func toString() -> String {
			switch self {
			case download(let filename):
				if let filename = filename { return attributeString(key: "download", value: filename) }
				return "download"
			case href(let url): return attributeString(key: "href", value: url)
			case hreflang(let hreflang): return attributeString(key: "hreflang", value: hreflang)
			case media(let media): return attributeString(key: "media", value: media)
			case rel(let rel):
				let relStr = " ".join(rel.map{$0.rawValue})
				return attributeString(key: "rel", value: relStr)
			case target(let target,let framename):
				if let target = target { return attributeString(key: "formtarget", value: target.rawValue) }
				if let framename = framename { return attributeString(key: "formtarget", value: framename) }
			case type(let mediaType): return attributeString(key: "type", value: mediaType)
			}
			return ""
		}
	}
	
	public func download(filename : String? = nil) -> Self {
		attributes.append(Attribute.download(filename))
		return self
	}
	
	public func href(url : String) -> Self {
		attributes.append(Attribute.href(url))
		return self
	}
	
	public func hreflang(hreflang : String) -> Self {
		attributes.append(Attribute.hreflang(hreflang))
		return self
	}
	
	public func media(media : String) -> Self {
		attributes.append(Attribute.media(media))
		return self
	}
	
	public func rel(rel : HtmlRel...) -> Self {
		attributes.append(Attribute.rel(rel))
		return self
	}
	
	public func rel(rel : HtmlRel) -> Self {
		attributes.append(Attribute.rel([rel]))
		return self
	}
	
	public func target(target: HtmlTarget) -> Self {
		attributes.append(Attribute.target(target, nil))
		return self
	}
	
	public func target(framename: String) -> Self {
		attributes.append(Attribute.target(nil, framename))
		return self
	}
	
	public func type(type : String) -> Self {
		attributes.append(Attribute.type(type))
		return self
	}
}


//-------------------------

public class nav$ : HtmlControl { override var name: String { return "nav" } }

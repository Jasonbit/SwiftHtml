//
//  Programming.swift
//  SwiftHtml
//
//  Created by Pawel Krzywdzinski on 7/22/15.
//  Copyright © 2015 Pawel Krzywdzinski. All rights reserved.
//

import Foundation


//---------------------------- Programming -----------------------------------


public class script$ : HtmlElement {
	override var name: String { return "script" }
	
	enum Attribute : HtmlAttribute {
		case async
		case charset(String)
		case defer_
		case src(String)
		case type(String)
		
		func toString() -> String {
			switch self {
			case async: return "async"
			case charset(let charset): return attributeString(key: "charset", value: charset)
			case defer_: return "defer"
			case src(let url): return attributeString(key: "src", value: url)
			case type(let mediaType): return attributeString(key: "type", value: mediaType)
			}
		}
	}
	
	public func async() -> Self {
		attributes.append(Attribute.async)
		return self
	}
	
	public func charset(charset : String) -> Self {
		attributes.append(Attribute.charset(charset))
		return self
	}
	
	public func defer_() -> Self {
		attributes.append(Attribute.defer_)
		return self
	}
	
	public func src(url : String) -> Self {
		attributes.append(Attribute.src(url))
		return self
	}
	
	public func type(mediaType : String) -> Self {
		attributes.append(Attribute.type(mediaType))
		return self
	}
}


//-------------------------

public class noscript$ : HtmlControl { override var name: String { return "noscript" } }

//-------------------------

public class embed$ : HtmlControl {
	override var name: String { return "embed" }
	override var hasEndTag: Bool { return false }

	enum Attribute : HtmlAttribute {
		case height(Int)
		case src(String)
		case type(String)
		case width(Int)
		
		func toString() -> String {
			switch self {
			case height(let pixels): return attributeString(key: "height", value: String(pixels))
			case src(let url): return attributeString(key: "src", value: url)
			case type(let mediaType): return attributeString(key: "type", value: mediaType)
			case width(let pixels): return attributeString(key: "width", value: String(pixels))
			}
		}
	}
	
	public func height(pixels : Int) -> Self {
		attributes.append(Attribute.height(pixels))
		return self
	}
	
	public func src(url : String) -> Self {
		attributes.append(Attribute.src(url))
		return self
	}
	
	public func type(mediaType : String) -> Self {
		attributes.append(Attribute.type(mediaType))
		return self
	}
	
	public func width(pixels : Int) -> Self {
		attributes.append(Attribute.width(pixels))
		return self
	}
}

//-------------------------

public class object$ : HtmlControl {
	override var name: String { return "object" }
	
	enum Attribute : HtmlAttribute {
		case data(String)
		case form(String)
		case height(Int)
		case name(String)
		case type(String)
		case usemap(String)
		case width(Int)
		
		func toString() -> String {
			switch self {
			case data(let url): return attributeString(key: "data", value: url)
			case form(let formId): return attributeString(key: "form", value: formId)
			case height(let pixels): return attributeString(key: "height", value: String(pixels))
			case name(let name): return attributeString(key: "name", value: name)
			case type(let mediaType): return attributeString(key: "type", value: mediaType)
			case usemap(let mapName): return attributeString(key: "usemap", value: mapName)
			case width(let pixels): return attributeString(key: "width", value: String(pixels))
			}
		}
	}
	
	public func data(url : String) -> Self {
		attributes.append(Attribute.data(url))
		return self
	}
	
	public func form(formId : String) -> Self {
		attributes.append(Attribute.form(formId))
		return self
	}
	
	public func height(pixels : Int) -> Self {
		attributes.append(Attribute.height(pixels))
		return self
	}
	
	public func name(name : String) -> Self {
		attributes.append(Attribute.name(name))
		return self
	}
	
	public func type(mediaType : String) -> Self {
		attributes.append(Attribute.type(mediaType))
		return self
	}
	
	public func usemap(mapName : String) -> Self {
		attributes.append(Attribute.usemap(mapName))
		return self
	}
	
	public func width(pixels : Int) -> Self {
		attributes.append(Attribute.width(pixels))
		return self
	}
}


//-------------------------

public class param$ : HtmlElement {
	override var name: String { return "param" }
	override var hasEndTag: Bool { return false }
	
	enum Attribute : HtmlAttribute {
		case name(String)
		case value(String)
		
		func toString() -> String {
			switch self {
			case name(let name): return attributeString(key: "name", value: name)
			case value(let value): return attributeString(key: "value", value: value)
			}
		}
	}
	
	public func name(name : String) -> Self {
		attributes.append(Attribute.name(name))
		return self
	}
	
	public func value(value : String) -> Self {
		attributes.append(Attribute.value(value))
		return self
	}
}


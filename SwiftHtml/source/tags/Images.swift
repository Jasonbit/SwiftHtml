//
//  Images.swift
//  SwiftHtml
//
//  Created by Pawel Krzywdzinski on 7/22/15.
//  Copyright © 2015 Pawel Krzywdzinski. All rights reserved.
//

import Foundation



//---------------------------- Images -----------------------------------


public enum CrossOrigin : String {
	case anonymous
	case useCredentials = "use-credentials"
}

public class img$ : HtmlControl {
	override var name: String { return "img" }
	
	enum Attribute : HtmlAttribute {
		case alt(String)
		case crossorigin(CrossOrigin)
		case height(Int)
		case ismap
		case longdesc(String)
		case src(String)
		case usemap(String)
		case width(String)
		
		func toString() -> String {
			switch self {
			case alt(let text): return attributeString(key: "alt", value: text)
			case crossorigin(let crossorigin): return attributeString(key: "crossorigin", value: crossorigin.rawValue)
			case height(let pixels): return attributeString(key: "height", value: String(pixels))
			case ismap: return "ismap"
			case longdesc(let url): return attributeString(key: "longdesc", value: url)
			case src(let url): return attributeString(key: "src", value: url)
			case usemap(let mapName): return attributeString(key: "usemap", value: mapName)
			case width(let pixels): return attributeString(key: "width", value: pixels)
			}
		}
	}
	
	public func alt(text : String) -> Self {
		attributes.append(Attribute.alt(text))
		return self
	}
	
	public func crossorigin(crossorigin : CrossOrigin) -> Self {
		attributes.append(Attribute.crossorigin(crossorigin))
		return self
	}
	
	public func height(pixels : Int) -> Self {
		attributes.append(Attribute.height(pixels))
		return self
	}
	
	public func ismap() -> Self {
		attributes.append(Attribute.ismap)
		return self
	}
	
	public func longdesc(url : String) -> Self {
		attributes.append(Attribute.longdesc(url))
		return self
	}
	
	public func src(url : String) -> Self {
		attributes.append(Attribute.src(url))
		return self
	}
	
	public func usemap(mapName : String) -> Self {
		attributes.append(Attribute.usemap(mapName))
		return self
	}
	
	public func width(pixels : String) -> Self {
		attributes.append(Attribute.width(pixels))
		return self
	}
}


//-------------------------

public class map$ : HtmlControl {
	override var name: String { return "map" }
	
	enum Attribute : HtmlAttribute {
		case name(String)
		
		func toString() -> String {
			switch self {
			case name(let name): return attributeString(key: "name", value: name)
			}
		}
	}
	
	public func name(name : String) -> Self {
		attributes.append(Attribute.name(name))
		return self
	}
}


//-------------------------


public enum HtmlAreaShape : String {
	case DEFAULT
	case rect
	case circle
	case poly
}

public class area$ : HtmlControl {
	override var name: String { return "area" }
	
	enum Attribute : HtmlAttribute {
		case alt(String)
		case coords(String)
		case download(String)
		case href(String)
		case hreflang(String)
		case media(String)
		case rel([HtmlRel])
		case shape(HtmlAreaShape)
		case target(HtmlTarget?,String?)
		case type(String)
		
		func toString() -> String {
			switch self {
			case alt(let text): return attributeString(key: "alt", value: text)
			case coords(let coords): return attributeString(key: "coords", value: coords)
			case download(let fileName): return attributeString(key: "download", value: fileName)
			case href(let url): return attributeString(key: "href", value: url)
			case hreflang(let languageCode): return attributeString(key: "hreflang", value: languageCode)
			case media(let media): return attributeString(key: "media", value: media)
			case rel(let rel):
				let relStr = " ".join(rel.map{$0.rawValue})
				return attributeString(key: "rel", value: relStr)
			case shape(let shape): return attributeString(key: "shape", value: shape.rawValue)
			case target(let target,let framename):
				if let target = target { return attributeString(key: "formtarget", value: target.rawValue) }
				if let framename = framename { return attributeString(key: "formtarget", value: framename) }
			case type(let mediaType): return attributeString(key: "type", value: mediaType)
			}
			return ""
		}
	}
	
	public func alt(text : String) -> Self {
		attributes.append(Attribute.alt(text))
		return self
	}
	
	public func coords(coords : String) -> Self {
		attributes.append(Attribute.coords(coords))
		return self
	}
	
	public func download(fileName : String) -> Self {
		attributes.append(Attribute.download(fileName))
		return self
	}
	
	public func href(url : String) -> Self {
		attributes.append(Attribute.href(url))
		return self
	}
	
	public func hreflang(languageCode : String) -> Self {
		attributes.append(Attribute.hreflang(languageCode))
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
	
	public func shape(shape : HtmlAreaShape) -> Self {
		attributes.append(Attribute.shape(shape))
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
	
	public func type(mediaType : String) -> Self {
		attributes.append(Attribute.type(mediaType))
		return self
	}
}


//-------------------------


public class canvas$ : HtmlControl {
	override var name: String { return "canvas" }
	
	enum Attribute : HtmlAttribute {
		case height(Int)
		case width(Int)
		
		func toString() -> String {
			switch self {
			case height(let pixels): return attributeString(key: "height", value: String(pixels))
			case width(let pixels): return attributeString(key: "width", value: String(pixels))
			}
		}
	}
	
	public func height(pixels : Int) -> Self {
		attributes.append(Attribute.height(pixels))
		return self
	}
	
	public func width(pixels : Int) -> Self {
		attributes.append(Attribute.width(pixels))
		return self
	}
}


//-------------------------

public class figcaption$ : HtmlControl { override var name: String { return "figcaption" } }


//-------------------------

public class figure$ : HtmlControl { override var name: String { return "figure" } }


//
//  Metadata.swift
//  SwiftHtml
//
//  Created by Pawel Krzywdzinski on 7/22/15.
//  Copyright © 2015 Pawel Krzywdzinski. All rights reserved.
//

import Foundation


//---------------------------- Metadata Tags -----------------------------------


public class head$ : HtmlElement { override var name: String { return "head" } }

public class title$ : HtmlElement { override var name: String { return "title" } }

//-------------------------

public enum HtmlTarget: String {
	case blank = "_blank"
	case SELF = "_self"
	case parent = "_parent"
	case top = "_top"
}

public class base$ : HtmlElement {
	override var name: String { return "base" }
	override var hasEndTag: Bool { return false }
	
	enum Attribute : HtmlAttribute {
		case href(String)
		case target(HtmlTarget?, String?)
		
		func toString() -> String {
			switch self {
			case href(let url): return attributeString(key: "href", value: url)
			case target(let target, let framename):
				if let target = target { return attributeString(key: "target", value: target.rawValue) }
				if let framename = framename { return attributeString(key: "target", value: framename) }
			}
			return ""
		}
	}
	
	public func href(url: String) -> Self {
		attributes.append(Attribute.href(url))
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
}

//-------------------------

public enum HtmlCrossOrgin : String {
	case anonymous
	case useCredentials = "use-credentials"
}

public enum HtmlRel : String {
	case alternate
	case archives
	case author
	case bookmark
	case external
	case first
	case help
	case icon
	case last
	case license
	case next
	case nofollow
	case noreferrer
	case pingback
	case prefetch
	case prev
	case search
	case sidebar
	case stylesheet
	case tag
	case up
	case shortcut
}

public class link$ : HtmlControl {
	override var name: String { return "link" }
	override var hasEndTag: Bool { return false }
	
	enum Attribute : HtmlAttribute {
		case crossorigin(HtmlCrossOrgin)
		case href(String)
		case hreflang(String)
		case media(String)
		case rel([HtmlRel])
		case sizes(String)
		case target(HtmlTarget?, String?)
		case type(String)
		
		func toString() -> String {
			switch self {
			case crossorigin(let crossorigin): return attributeString(key: "crossorigin", value: crossorigin.rawValue)
			case href(let url): return attributeString(key: "href", value: url)
			case hreflang(let hreflang): return attributeString(key: "hreflang", value: hreflang)
			case media(let media): return attributeString(key: "media", value: media)
			case rel(let rel):
				let relStr = " ".join(rel.map{$0.rawValue})
				return attributeString(key: "rel", value: relStr)
			case sizes(let sizes): return attributeString(key: "sizes", value: sizes)
			case target(let target, let framename):
				if let target = target { return attributeString(key: "target", value: target.rawValue) }
				if let framename = framename { return attributeString(key: "target", value: framename) }
			case type(let mediaType): return attributeString(key: "type", value: mediaType)
			}
			return ""
		}
	}
	
	public func crossorigin(crossorigin : HtmlCrossOrgin) -> Self {
		attributes.append(Attribute.crossorigin(crossorigin))
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
	
	public func sizes(sizes : String) -> Self {
		attributes.append(Attribute.sizes(sizes))
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

public enum HtmlHttpEquiv : String {
	case contentType = "content-type"
	case defaultStyle = "default-style"
	case refresh
}

public enum HtmlMetaName : String {
	case applicationName = "application-name"
	case author
	case description
	case generator
	case keywords
	case viewport
}

public class meta$ : HtmlElement {
	override var name: String { return "meta" }
	override var hasEndTag: Bool { return false }
	
	enum Attribute : HtmlAttribute {
		case charset(String)
		case content(String)
		case httpEquiv(HtmlHttpEquiv)
		case name(HtmlMetaName)
		
		func toString() -> String {
			switch self {
			case charset(let charset): return attributeString(key: "charset", value: charset)
			case content(let content): return attributeString(key: "content", value: content)
			case httpEquiv(let httpEquiv): return attributeString(key: "httpEquiv", value: httpEquiv.rawValue)
			case name(let name): return attributeString(key: "name", value: name.rawValue)
			}
		}
	}
	
	public func charset(charset : String) -> Self {
		attributes.append(Attribute.charset(charset))
		return self
	}
	
	public func content(content : String) -> Self {
		attributes.append(Attribute.content(content))
		return self
	}
	
	public func httpEquiv(httpEquiv : HtmlHttpEquiv) -> Self {
		attributes.append(Attribute.httpEquiv(httpEquiv))
		return self
	}
	
	public func name(name : HtmlMetaName) -> Self {
		attributes.append(Attribute.name(name))
		return self
	}
}

//-------------------------

public class style$ : HtmlElement {
	override var name: String { return "style" }
	
	enum Attribute : HtmlAttribute {
		case media(String)
		case scoped
		case type(String)
		
		func toString() -> String {
			switch self {
			case media(let media): return attributeString(key: "media", value: media)
			case scoped: return "scoped"
			case type(let type): return attributeString(key: "type", value: type)
			}
		}
	}
	
	public convenience init (_ styles: [String:String])  {
		let styleString = " ".join(styles.map{return "\($0) {\($1)}"})
		self.init(styleString)
	}
	
	public func media(media : String) -> Self {
		attributes.append(Attribute.media(media))
		return self
	}
	
	public func scoped() -> Self {
		attributes.append(Attribute.scoped)
		return self
	}
	
	public func type(type : String) -> Self {
		attributes.append(Attribute.type(type))
		return self
	}
}

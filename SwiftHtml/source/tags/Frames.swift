//
//  Frames.swift
//  SwiftHtml
//
//  Created by Pawel Krzywdzinski on 7/22/15.
//  Copyright © 2015 Pawel Krzywdzinski. All rights reserved.
//

import Foundation


//---------------------------- Frames -----------------------------------


public enum HtmlSandBox : String {
	case allowForms = "allow-forms"
	case allowPointerLock = "allow-pointer-lock"
	case allowPopups = "allow-popups"
	case allowSameOrigin = "allow-same-origin"
	case allowScripts = "allow-scripts"
	case allowTopNavigation = "allow-top-navigation"
}

public class iframe$ : HtmlElement {
	override var name: String { return "iframe" }
	
	enum Attribute : HtmlAttribute {
		case height(Int)
		case name(String)
		case sandbox([HtmlSandBox]?)
		case seamless
		case src(String)
		case srcdoc(String)
		case width(Int)
		
		func toString() -> String {
			switch self {
			case height(let pixels): return attributeString(key: "height", value: String(pixels))
			case name(let name): return attributeString(key: "name", value: name)
			case sandbox(let sandbox):
				if let sandbox = sandbox {
					let allow = " ".join(sandbox.map{$0.rawValue})
					attributeString(key: "sandbox", value: allow)
				} else {
					return "sandbox"
				}
			case seamless: return "seamless"
			case src(let url): return attributeString(key: "src", value: url)
			case srcdoc(let srcdoc): return attributeString(key: "srcdoc", value: srcdoc)
			case width(let pixels): return attributeString(key: "width", value: String(pixels))
			}
			return ""
		}
	}
	
	public func height(pixels : Int) -> Self {
		attributes.append(Attribute.height(pixels))
		return self
	}
	
	public func name(name : String) -> Self {
		attributes.append(Attribute.name(name))
		return self
	}
	
	public func sandbox(sandbox : [HtmlSandBox]? = nil) -> Self {
		attributes.append(Attribute.sandbox(sandbox))
		return self
	}
	
	public func seamless() -> Self {
		attributes.append(Attribute.seamless)
		return self
	}
	
	public func src(url : String) -> Self {
		attributes.append(Attribute.src(url))
		return self
	}
	
	public func srcdoc(srcdoc : String) -> Self {
		attributes.append(Attribute.srcdoc(srcdoc))
		return self
	}
	
	public func width(pixels : Int) -> Self {
		attributes.append(Attribute.width(pixels))
		return self
	}
}


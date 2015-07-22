//
//  HtmlTag.swift
//  SwiftHtml
//
//  Created by Pawel Krzywdzinski on 7/22/15.
//  Copyright © 2015 Pawel Krzywdzinski. All rights reserved.
//

import Foundation



public class html$ : HtmlElement {
	
	override var name: String { return "html" }
	
	enum Attribute : HtmlAttribute {
		case manifest(String)
		
		func toString() -> String {
			switch self {
			case manifest(let url): return attributeString(key: "manifest", value: url)
			}
		}
	}
	
	override public var htmlString: String {
		return "<!DOCTYPE html>" + super.htmlString
	}
	
	public func manifest(url: String) -> Self {
		attributes.append(Attribute.manifest(url))
		return self
	}
}

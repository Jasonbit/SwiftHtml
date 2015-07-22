//
//  Semantics.swift
//  SwiftHtml
//
//  Created by Pawel Krzywdzinski on 7/22/15.
//  Copyright © 2015 Pawel Krzywdzinski. All rights reserved.
//

import Foundation


//---------------------------- Semantics -----------------------------------


public class div$ : HtmlControl { override var name: String { return "div" } }

public class span$ : HtmlControl { override var name: String { return "span" } }

public class header$ : HtmlControl { override var name: String { return "header" } }

public class footer$ : HtmlControl { override var name: String { return "footer" } }

public class main$ : HtmlControl { override var name: String { return "main" } }

public class section$ : HtmlControl { override var name: String { return "section" } }

public class article$ : HtmlControl { override var name: String { return "article" } }

public class aside$ : HtmlControl { override var name: String { return "aside" } }

//-------------------------

public class details$ : HtmlControl {
	override var name: String { return "details" }
	
	enum Attribute : HtmlAttribute {
		case open
		
		func toString() -> String {
			switch self {
			case open: return "open"
			}
		}
	}
	
	public func open() -> Self {
		attributes.append(Attribute.open)
		return self
	}
}

//-------------------------

public class dialog$ : HtmlControl {
	override var name: String { return "dialog" }
	
	enum Attribute : HtmlAttribute {
		case open
		
		func toString() -> String {
			switch self {
			case open: return "open"
			}
		}
	}
	
	public func open() -> Self {
		attributes.append(Attribute.open)
		return self
	}
}

//-------------------------

public class summary$ : HtmlControl { override var name: String { return "summary" } }

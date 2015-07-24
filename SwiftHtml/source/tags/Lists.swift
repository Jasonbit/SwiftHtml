//
//  Lists.swift
//  SwiftHtml
//
//  Created by Pawel Krzywdzinski on 7/22/15.
//  Copyright © 2015 Pawel Krzywdzinski. All rights reserved.
//

import Foundation


//---------------------------- Lists -----------------------------------



public class ul$ : HtmlControl { override var name: String { return "ul" } }


//-------------------------

public enum HtmlOlType : String {
	case list_1 = "1"
	case list_A = "A"
	case list_a = "a"
	case list_I = "I"
	case list_i = "i"
}

public class ol$ : HtmlControl {
	override var name: String { return "ol" }
	
	enum Attribute : HtmlAttribute {
		case reversed
		case start(Int)
		case type(HtmlOlType)
		
		func toString() -> String {
			switch self {
			case reversed: return "reversed"
			case start(let number): return attributeString(key: "start", value: String(number))
			case type(let type): return attributeString(key: "type", value: type.rawValue)
			}
		}
	}
	
	public func reversed() -> Self {
		attributes.append(Attribute.reversed)
		return self
	}
	
	public func start(number : Int) -> Self {
		attributes.append(Attribute.start(number))
		return self
	}
	
	public func type(type : HtmlOlType) -> Self {
		attributes.append(Attribute.type(type))
		return self
	}
}


//-------------------------

public class li$ : HtmlControl {
	override var name: String { return "li" }
	
	enum Attribute : HtmlAttribute {
		case value(Int)
		
		func toString() -> String {
			switch self {
			case value(let number): return attributeString(key: "value", value: String(number))
			}
		}
	}
	
	public func value(number : Int) -> Self {
		attributes.append(Attribute.value(number))
		return self
	}
}

//-------------------------

public class dl$ : HtmlControl { override var name: String { return "dl" } }


//-------------------------

public class dt$ : HtmlControl { override var name: String { return "dt" } }


//-------------------------

public class dd$ : HtmlControl { override var name: String { return "dd" } }


//-------------------------

public enum HtmlMenuType : String {
	case popup
	case toolbar
	case context
}

public class menu$ : HtmlControl {
	override var name: String { return "menu" }
	
	enum Attribute : HtmlAttribute {
		case label(String)
		case type(HtmlMenuType)
		
		func toString() -> String {
			switch self {
			case label(let label): return attributeString(key: "label", value: label)
			case type(let type): return attributeString(key: "type", value: type.rawValue)
			}
		}
	}
	
	public func label(label : String) -> Self {
		attributes.append(Attribute.label(label))
		return self
	}
	
	public func type(type : HtmlMenuType) -> Self {
		attributes.append(Attribute.type(type))
		return self
	}
}


//-------------------------

public enum HtmlMenuItemType : String {
	case checkbox
	case command
	case radio
}

public class menuitem$ : HtmlControl {
	override var name: String { return "menuitem" }
	
	enum Attribute : HtmlAttribute {
		case checked
		case command
		case DEFAULT
		case disabled
		case icon(String)
		case label(String)
		case radiogroup(String)
		case type(HtmlMenuItemType)
		
		func toString() -> String {
			switch self {
			case checked: return "checked"
			case command: return "command"
			case DEFAULT: return "default"
			case disabled: return "disabled"
			case icon(let url): return attributeString(key: "icon", value: url)
			case label(let label): return attributeString(key: "label", value: label)
			case radiogroup(let groupName): return attributeString(key: "radiogroup", value: groupName)
			case type(let type): return attributeString(key: "type", value: type.rawValue)
			}
		}
	}
	
	public func checked() -> Self {
		attributes.append(Attribute.checked)
		return self
	}
	
	public func command() -> Self {
		attributes.append(Attribute.command)
		return self
	}
	
	public func DEFAULT() -> Self {
		attributes.append(Attribute.DEFAULT)
		return self
	}
	
	public func disabled() -> Self {
		attributes.append(Attribute.disabled)
		return self
	}
	
	public func icon(url : String) -> Self {
		attributes.append(Attribute.icon(url))
		return self
	}
	
	public func label(label : String) -> Self {
		attributes.append(Attribute.label(label))
		return self
	}
	
	public func radiogroup(groupName : String) -> Self {
		attributes.append(Attribute.radiogroup(groupName))
		return self
	}
	
	public func type(type : HtmlMenuItemType) -> Self {
		attributes.append(Attribute.type(type))
		return self
	}
}


//-------------------------

public class table$ : HtmlControl {
	override var name: String { return "table" }
	
	enum Attribute : HtmlAttribute {
		case sortable
		
		func toString() -> String {
			switch self {
			case sortable: return "sortable"
			}
		}
	}
	
	public func sortable() -> Self {
		attributes.append(Attribute.sortable)
		return self
	}
}


//-------------------------

public class caption$ : HtmlControl { override var name: String { return "caption" } }


//-------------------------

public enum HtmlThScope : String {
	case col
	case colgroup
	case row
	case rowgroup
}

public class th$ : HtmlControl {
	override var name: String { return "th" }
	
	enum Attribute : HtmlAttribute {
		case abbr(String)
		case colspan(Int)
		case headers(String)
		case rowspan(Int)
		case scope(HtmlThScope)
		case sorted(Int, Bool)
		
		func toString() -> String {
			switch self {
			case abbr(let text): return attributeString(key: "abbr", value: text)
			case colspan(let number): return attributeString(key: "colspan", value: String(number))
			case headers(let headers): return attributeString(key: "headers", value: headers)
			case rowspan(let number): return attributeString(key: "rowspan", value: String(number))
			case scope(let scope): return attributeString(key: "scope", value: scope.rawValue)
			case sorted(let number, let reversed):
				let sortedStr = String(number) + " " + (reversed ? "reversed" : "")
				return attributeString(key: "sorted", value: sortedStr)
			}
		}
	}
	
	public func abbr(text : String) -> Self {
		attributes.append(Attribute.abbr(text))
		return self
	}
	
	public func colspan(number : Int) -> Self {
		attributes.append(Attribute.colspan(number))
		return self
	}
	
	public func headers(headers : String) -> Self {
		attributes.append(Attribute.headers(headers))
		return self
	}
	
	public func rowspan(number : Int) -> Self {
		attributes.append(Attribute.rowspan(number))
		return self
	}
	
	public func scope(scope : HtmlThScope) -> Self {
		attributes.append(Attribute.scope(scope))
		return self
	}
	
	public func sorted(number : Int, reversed : Bool = false) -> Self {
		attributes.append(Attribute.sorted(number, reversed))
		return self
	}
}


//-------------------------

public class tr$ : HtmlControl { override var name: String { return "tr" } }

//-------------------------

public class td$ : HtmlControl {
	override var name: String { return "td" }
	
	enum Attribute : HtmlAttribute {
		case colspan(Int)
		case headers(String)
		case rowspan(Int)
		
		func toString() -> String {
			switch self {
			case colspan(let number): return attributeString(key: "colspan", value: String(number))
			case headers(let headers): return attributeString(key: "headers", value: headers)
			case rowspan(let number): return attributeString(key: "rowspan", value: String(number))
			}
		}
	}
	
	public func colspan(number : Int) -> Self {
		attributes.append(Attribute.colspan(number))
		return self
	}
	
	public func headers(headers : String) -> Self {
		attributes.append(Attribute.headers(headers))
		return self
	}
	
	public func rowspan(number : Int) -> Self {
		attributes.append(Attribute.rowspan(number))
		return self
	}
}

//-------------------------

public class thead$ : HtmlControl { override var name: String { return "thead" } }


//-------------------------

public class tbody$ : HtmlControl { override var name: String { return "tbody" } }


//-------------------------

public class tfoot$ : HtmlControl { override var name: String { return "tfoot" } }


//-------------------------

public class col$ : HtmlControl {
	override var name: String { return "col" }
	override var hasEndTag: Bool { return false }
	
	enum Attribute : HtmlAttribute {
		case span(Int)
		
		func toString() -> String {
			switch self {
			case span(let number): return attributeString(key: "span", value: String(number))
			}
		}
	}
	
	public func span(number : Int) -> Self {
		attributes.append(Attribute.span(number))
		return self
	}
}


//-------------------------

public class colgroup$ : HtmlControl {
	override var name: String { return "colgroup" }
	
	enum Attribute : HtmlAttribute {
		case span(Int)
		
		func toString() -> String {
			switch self {
			case span(let number): return attributeString(key: "span", value: String(number))
			}
		}
	}
	
	public func span(number : Int) -> Self {
		attributes.append(Attribute.span(number))
		return self
	}
}

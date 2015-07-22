//
//  BasicHtml.swift
//  SwiftHtml
//
//  Created by Pawel Krzywdzinski on 7/22/15.
//  Copyright © 2015 Pawel Krzywdzinski. All rights reserved.
//

import Foundation


//---------------------------- Basic HTML -----------------------------------


public class body$ : HtmlControl {
	override var name: String { return "body" }
	
	enum EventAttribute : HtmlAttribute {
		case onafterprint(String)
		case onbeforeprint(String)
		case onbeforeunload(String)
		case onerror(String)
		case onhashchange(String)
		case onload(String)
		case onmessage(String)
		case onoffline(String)
		case ononline(String)
		case onpagehide(String)
		case onpageshow(String)
		case onpopstate(String)
		case onresize(String)
		case onstorage(String)
		case onunload(String)
		
		func toString() -> String {
			switch self {
			case onafterprint(let script): return attributeString(key: "onafterprint", value: script)
			case onbeforeprint(let script): return attributeString(key: "onbeforeprint", value: script)
			case onbeforeunload(let script): return attributeString(key: "onbeforeunload", value: script)
			case onerror(let script): return attributeString(key: "onerror", value: script)
			case onhashchange(let script): return attributeString(key: "onhashchange", value: script)
			case onload(let script): return attributeString(key: "onload", value: script)
			case onmessage(let script): return attributeString(key: "onmessage", value: script)
			case onoffline(let script): return attributeString(key: "onoffline", value: script)
			case ononline(let script): return attributeString(key: "ononline", value: script)
			case onpagehide(let script): return attributeString(key: "onpagehide", value: script)
			case onpageshow(let script): return attributeString(key: "onpageshow", value: script)
			case onpopstate(let script): return attributeString(key: "onpopstate", value: script)
			case onresize(let script): return attributeString(key: "onresize", value: script)
			case onstorage(let script): return attributeString(key: "onstorage", value: script)
			case onunload(let script): return attributeString(key: "onunload", value: script)
			}
		}
	}
	
	public func onAfterPrint(script : String) -> Self { attributes.append(EventAttribute.onafterprint(script)); return self }
	public func onBeforePrint(script : String) -> Self { attributes.append(EventAttribute.onbeforeprint(script)); return self }
	public func onBeforeUnload(script : String) -> Self { attributes.append(EventAttribute.onbeforeunload(script)); return self }
	public func onError(script : String) -> Self { attributes.append(EventAttribute.onerror(script)); return self }
	public func onBashChange(script : String) -> Self { attributes.append(EventAttribute.onhashchange(script)); return self }
	public func onLoad(script : String) -> Self { attributes.append(EventAttribute.onload(script)); return self }
	public func onMessage(script : String) -> Self { attributes.append(EventAttribute.onmessage(script)); return self }
	public func onOffline(script : String) -> Self { attributes.append(EventAttribute.onoffline(script)); return self }
	public func onOnline(script : String) -> Self { attributes.append(EventAttribute.ononline(script)); return self }
	public func onPageHide(script : String) -> Self { attributes.append(EventAttribute.onpagehide(script)); return self }
	public func onPageShow(script : String) -> Self { attributes.append(EventAttribute.onpageshow(script)); return self }
	public func onPopstate(script : String) -> Self { attributes.append(EventAttribute.onpopstate(script)); return self }
	public func onResize(script : String) -> Self { attributes.append(EventAttribute.onresize(script)); return self }
	public func onStorage(script : String) -> Self { attributes.append(EventAttribute.onstorage(script)); return self }
	public func onUnload(script : String) -> Self { attributes.append(EventAttribute.onunload(script)); return self }
	
}

public class h1$ : HtmlControl { override var name: String { return "h1" } }

public class h2$ : HtmlControl { override var name: String { return "h2" } }

public class h3$ : HtmlControl { override var name: String { return "h3" } }

public class h4$ : HtmlControl { override var name: String { return "h4" } }

public class h5$ : HtmlControl { override var name: String { return "h5" } }

public class h6$ : HtmlControl { override var name: String { return "h6" } }

public class p$ : HtmlControl { override var name: String { return "p" } }

public class br$ : HtmlElement { override var name: String { return "br" } }

public class hr$ : HtmlControl { override var name: String { return "hr" } }


//---------------------------- Formatting -----------------------------------


public class abbr$ : HtmlControl { override var name: String { return "abbr" } }

public class address$ : HtmlControl { override var name: String { return "address" } }

public class b$ : HtmlControl { override var name: String { return "b" } }

public class bdi$ : HtmlControl { override var name: String { return "bdi" } }

public class bdo$ : HtmlElement { override var name: String { return "bdo" } }

public class blockquote$ : HtmlControl {
	override var name: String { return "blockquote" }
	
	enum Attribute : HtmlAttribute {
		case cite(String)
		
		func toString() -> String {
			switch self {
			case cite(let url): return attributeString(key: "cite", value: url)
			}
		}
	}
	
	public func cite(url: String) -> Self {
		attributes.append(Attribute.cite(url))
		return self
	}
}

public class cite$ : HtmlControl { override var name: String { return "cite" } }

public class code$ : HtmlControl { override var name: String { return "code" } }

public class del$ : HtmlControl {
	override var name: String { return "del" }
	
	enum Attribute : HtmlAttribute {
		case cite(String)
		case datetime(NSDate)
		
		func toString() -> String {
			switch self {
			case cite(let url): return attributeString(key: "cite", value: url)
			case datetime(let datetime): return attributeString(key: "datetime", value: datetime.description) // datetime="YYYY-MM-DDThh:mm:ssTZD"
			}
		}
	}
	
	public func cite(url: String) -> Self {
		attributes.append(Attribute.cite(url))
		return self
	}
	
	public func datetime(datetime: NSDate) -> Self {
		attributes.append(Attribute.datetime(datetime))
		return self
	}
}


public class dfn$ : HtmlControl { override var name: String { return "dfn" } }

public class em$ : HtmlControl { override var name: String { return "em" } }

public class i$ : HtmlControl { override var name: String { return "i" } }


public class ins$ : HtmlControl {
	override var name: String { return "ins" }
	
	enum Attribute : HtmlAttribute {
		case cite(String)
		case datetime(NSDate)
		
		func toString() -> String {
			switch self {
			case cite(let url): return attributeString(key: "cite", value: url)
			case datetime(let datetime): return attributeString(key: "datetime", value: datetime.description) // datetime="YYYY-MM-DDThh:mm:ssTZD"
			}
		}
	}
	
	public func cite(url: String) -> Self {
		attributes.append(Attribute.cite(url))
		return self
	}
	
	public func datetime(datetime: NSDate) -> Self {
		attributes.append(Attribute.datetime(datetime))
		return self
	}
}


public class kbd$ : HtmlControl { override var name: String { return "kbd" } }

public class mark$ : HtmlControl { override var name: String { return "mark" } }


public class meter$ : HtmlControl {
	override var name: String { return "meter" }
	
	enum Attribute : HtmlAttribute {
		case form(String)
		case high(Double)
		case low(Double)
		case max(Double)
		case min(Double)
		case optimum(Double)
		case value(Double)
		
		func toString() -> String {
			switch self {
			case form(let formId): return attributeString(key: "form", value: formId)
			case high(let value): return attributeString(key: "high", value: String(value))
			case low(let value): return attributeString(key: "low", value: String(value))
			case max(let value): return attributeString(key: "max", value: String(value))
			case min(let value): return attributeString(key: "min", value: String(value))
			case optimum(let value): return attributeString(key: "optimum", value: String(value))
			case value(let value): return attributeString(key: "value", value: String(value))
			}
		}
	}
	
	public func form(formId: String) -> Self {
		attributes.append(Attribute.form(formId))
		return self
	}
	
	public func high(value: Double) -> Self {
		attributes.append(Attribute.high(value))
		return self
	}
	
	public func low(value: Double) -> Self {
		attributes.append(Attribute.low(value))
		return self
	}
	
	public func max(value: Double) -> Self {
		attributes.append(Attribute.max(value))
		return self
	}
	
	public func min(value: Double) -> Self {
		attributes.append(Attribute.min(value))
		return self
	}
	
	public func optimum(value: Double) -> Self {
		attributes.append(Attribute.optimum(value))
		return self
	}
	
	public func value(value: Double) -> Self {
		attributes.append(Attribute.value(value))
		return self
	}
}


public class pre$ : HtmlControl { override var name: String { return "pre" } }


public class progress$ : HtmlControl {
	override var name: String { return "progress" }
	
	enum Attribute : HtmlAttribute {
		case max(Double)
		case value(Double)
		
		func toString() -> String {
			switch self {
			case max(let value): return attributeString(key: "max", value: String(value))
			case value(let value): return attributeString(key: "value", value: String(value))
			}
		}
	}
	
	public func max(value: Double) -> Self {
		attributes.append(Attribute.max(value))
		return self
	}
	
	public func value(value: Double) -> Self {
		attributes.append(Attribute.value(value))
		return self
	}
}


public class q$ : HtmlControl {
	override var name: String { return "q" }
	
	enum Attribute : HtmlAttribute {
		case cite(String)
		
		func toString() -> String {
			switch self {
			case cite(let url): return attributeString(key: "cite", value: url)
			}
		}
	}
	
	public func cite(url: String) -> Self {
		attributes.append(Attribute.cite(url))
		return self
	}
}


public class rp$ : HtmlControl { override var name: String { return "rp" } }

public class rt$ : HtmlControl { override var name: String { return "rt" } }

public class ruby$ : HtmlControl { override var name: String { return "ruby" } }

public class s$ : HtmlControl { override var name: String { return "s" } }

public class samp$ : HtmlControl { override var name: String { return "samp" } }

public class small$ : HtmlControl { override var name: String { return "small" } }

public class strong$ : HtmlControl { override var name: String { return "strong" } }

public class sub$ : HtmlControl { override var name: String { return "sub" } }

public class time$ : HtmlControl {
	override var name: String { return "time" }
	
	enum Attribute : HtmlAttribute {
		case datetime(NSDate)
		
		func toString() -> String {
			switch self {
			case datetime(let datetime): return attributeString(key: "datetime", value: datetime.description) // datetime="YYYY-MM-DDThh:mm:ssTZD"
			}
		}
	}
	
	public func datetime(datetime: NSDate) -> Self {
		attributes.append(Attribute.datetime(datetime))
		return self
	}
}

public class u$ : HtmlControl { override var name: String { return "u" } }

public class var$ : HtmlControl { override var name: String { return "var" } }

public class wbr$ : HtmlControl { override var name: String { return "wbr" } }


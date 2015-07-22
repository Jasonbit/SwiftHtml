//
//  HtmlControl.swift
//  SwiftHtml
//
//  Created by Pawel Krzywdzinski on 7/22/15.
//  Copyright © 2015 Pawel Krzywdzinski. All rights reserved.
//

import Foundation


public class HtmlControl : HtmlElement {
	
	enum EventAttribute : HtmlAttribute {
		case onblur(String)
		case onfocus(String)
		case onkeydown(String)
		case onkeypress(String)
		case onkeyup(String)
		case onclick(String)
		case ondblclick(String)
		case onmousedown(String)
		case onmousemove(String)
		case onmouseout(String)
		case onmouseover(String)
		case onmouseup(String)
		case onscroll(String)
		
		
		func toString() -> String {
			switch self {
			case onblur(let script): return attributeString(key: "onblur", value: script)
			case onfocus(let script): return attributeString(key: "onfocus", value: script)
			case onkeydown(let script): return attributeString(key: "onkeydown", value: script)
			case onkeypress(let script): return attributeString(key: "onkeypress", value: script)
			case onkeyup(let script): return attributeString(key: "onkeyup", value: script)
			case onclick(let script): return attributeString(key: "onclick", value: script)
			case ondblclick(let script): return attributeString(key: "ondblclick", value: script)
			case onmousedown(let script): return attributeString(key: "onmousedown", value: script)
			case onmousemove(let script): return attributeString(key: "onmousemove", value: script)
			case onmouseout(let script): return attributeString(key: "onmouseout", value: script)
			case onmouseover(let script): return attributeString(key: "onmouseover", value: script)
			case onmouseup(let script): return attributeString(key: "onmouseup", value: script)
			case onscroll(let script): return attributeString(key: "onscroll", value: script)
			}
		}
	}
	
	public func onblur(script : String) -> Self { attributes.append(EventAttribute.onblur(script)); return self }
	public func onfocus(script : String) -> Self { attributes.append(EventAttribute.onfocus(script)); return self }
	public func onkeydown(script : String) -> Self { attributes.append(EventAttribute.onkeydown(script)); return self }
	public func onkeypress(script : String) -> Self { attributes.append(EventAttribute.onkeypress(script)); return self }
	public func onkeyup(script : String) -> Self { attributes.append(EventAttribute.onkeyup(script)); return self }
	public func onclick(script : String) -> Self { attributes.append(EventAttribute.onclick(script)); return self }
	public func ondblclick(script : String) -> Self { attributes.append(EventAttribute.ondblclick(script)); return self }
	public func onmousedown(script : String) -> Self { attributes.append(EventAttribute.onmousedown(script)); return self }
	public func onmousemove(script : String) -> Self { attributes.append(EventAttribute.onmousemove(script)); return self }
	public func onmouseout(script : String) -> Self { attributes.append(EventAttribute.onmouseout(script)); return self }
	public func onmouseover(script : String) -> Self { attributes.append(EventAttribute.onmouseover(script)); return self }
	public func onmouseup(script : String) -> Self { attributes.append(EventAttribute.onmouseup(script)); return self }
	public func onscroll(script : String) -> Self { attributes.append(EventAttribute.onscroll(script)); return self }
	
	
}

//
//  HtmlElement.swift
//  SwiftHtml
//
//  Created by Pawel Krzywdzinski on 7/22/15.
//  Copyright © 2015 Pawel Krzywdzinski. All rights reserved.
//

import Foundation



public enum HtmlDir: String {
	case ltr
	case rtl
	case auto
}


public class HtmlElement: tag$ {
	
	var name: String { return "" }
	var childs = [tag$]()
	var attributes = [HtmlAttribute]()
	
	enum Attribute : HtmlAttribute {
		case accessKey(String)
		case classId(String)        // class
		case contenteditable(Bool)
		case dir(HtmlDir)
		case hidden
		case id(String)
		case lang(String)
		case spellcheck(Bool)
		case style(String)
		case tabindex(Int)
		case title(String)
		case translate(Bool)
		
		func toString() -> String {
			switch self {
			case accessKey(let key): return attributeString(key: "accesskey", value: key)
			case classId(let classId): return attributeString(key: "class", value: classId)
			case contenteditable(let editable): return attributeString(key: "contenteditable", value: editable ? "true": "false")
			case dir(let dir): return attributeString(key: "dir", value: dir.rawValue)
			case hidden: return "hidden"
			case id(let id): return attributeString(key: "id", value: id)
			case lang(let lang): return attributeString(key: "lang", value: lang)
			case spellcheck(let check): return attributeString(key: "spellcheck", value: check ? "true" : "false")
			case style(let style): return attributeString(key: "style", value: style)
			case tabindex(let number): return attributeString(key: "tabindex", value: String(number))
			case title(let title): return attributeString(key: "title", value: title)
			case translate(let translate): return attributeString(key: "translate", value: translate ? "yes" : "no")
			}
		}
	}
	
	enum EventAttribute : HtmlAttribute {
		case oncontextmenu(String)
		case ondrag(String)
		case ondragend(String)
		case ondragenter(String)
		case ondragleave(String)
		case ondragover(String)
		case ondragstart(String)
		case ondrop(String)
		case onwheel(String)
		case oncopy(String)
		case oncut(String)
		case onpaste(String)
		
		func toString() -> String {
			switch self {
			case oncontextmenu(let script): return attributeString(key: "oncontextmenu", value: script)
			case ondrag(let script): return attributeString(key: "ondrag", value: script)
			case ondragend(let script): return attributeString(key: "ondragend", value: script)
			case ondragenter(let script): return attributeString(key: "ondragenter", value: script)
			case ondragleave(let script): return attributeString(key: "ondragleave", value: script)
			case ondragover(let script): return attributeString(key: "ondragover", value: script)
			case ondragstart(let script): return attributeString(key: "ondragstart", value: script)
			case ondrop(let script): return attributeString(key: "ondrop", value: script)
			case onwheel(let script): return attributeString(key: "onwheel", value: script)
			case oncopy(let script): return attributeString(key: "oncopy", value: script)
			case oncut(let script): return attributeString(key: "oncut", value: script)
			case onpaste(let script): return attributeString(key: "onpaste", value: script)
			}
		}
	}
	
	public func onContextMenu(script : String) -> Self { attributes.append(EventAttribute.oncontextmenu(script)); return self }
	public func onDrag(script : String) -> Self { attributes.append(EventAttribute.ondrag(script)); return self }
	public func onDragEnd(script : String) -> Self { attributes.append(EventAttribute.ondragend(script)); return self }
	public func onDragEnter(script : String) -> Self { attributes.append(EventAttribute.ondragenter(script)); return self }
	public func onDragLeave(script : String) -> Self { attributes.append(EventAttribute.ondragleave(script)); return self }
	public func onDragOver(script : String) -> Self { attributes.append(EventAttribute.ondragover(script)); return self }
	public func onDragStart(script : String) -> Self { attributes.append(EventAttribute.ondragstart(script)); return self }
	public func onDrop(script : String) -> Self { attributes.append(EventAttribute.ondrop(script)); return self }
	public func onWheel(script : String) -> Self { attributes.append(EventAttribute.onwheel(script)); return self }
	public func onCopy(script : String) -> Self { attributes.append(EventAttribute.oncopy(script)); return self }
	public func onCut(script : String) -> Self { attributes.append(EventAttribute.oncut(script)); return self }
	public func onPaste(script : String) -> Self { attributes.append(EventAttribute.onpaste(script)); return self }
	
	
	public var htmlString: String {
		var attribStr = ""
		if attributes.count > 0 {
			attribStr = " " + " ".join(attributes.map{$0.toString()})
			
		}
		if childs.count > 0 {
			var output = ""
			for child in childs {
				output += child.htmlString
			}
			return "<\(name)\(attribStr)>" + output + "</\(name)>"
		} else {
			return "<\(name)\(attribStr)>"
		}
	}
	
	public var htmlData: NSData {
		return htmlString.dataUsingEncoding(NSASCIIStringEncoding)!
	}
	
	// ---- Inner html ----
	
	public func innerHtml (closure: () -> [tag$]) -> Self {
		childs += closure()
		return self
	}
	public func innerHtml (childs: tag$...) -> Self {
		self.childs += childs
		return self
	}
	public func innerHtml(childs: [tag$]) -> Self {
		self.childs += childs
		return self
	}
	
	// ---- Global attributes ----
	
	public func accessKey(key: String) -> Self {
		attributes.append(Attribute.accessKey(key))
		return self
	}
	
	public func classId(classId: String) -> Self {
		attributes.append(Attribute.classId(classId))
		return self
	}
	
	public func contenteditable(editable: Bool) -> Self {
		attributes.append(Attribute.contenteditable(editable))
		return self
	}
	
	public func dir(dir: HtmlDir) -> Self {
		attributes.append(Attribute.dir(dir))
		return self
	}
	
	public func hidden() -> Self {
		attributes.append(Attribute.hidden)
		return self
	}
	
	public func id(id: String) -> Self {
		attributes.append(Attribute.id(id))
		return self
	}
	
	public func lang(lang: String) -> Self {
		attributes.append(Attribute.lang(lang))
		return self
	}
	
	public func spellcheck(check: Bool) -> Self {
		attributes.append(Attribute.spellcheck(check))
		return self
	}
	
	public func style(style: String) -> Self {
		attributes.append(Attribute.style(style))
		return self
	}
	
	public func tabindex(number: Int) -> Self {
		attributes.append(Attribute.tabindex(number))
		return self
	}
	
	public func title(title: String) -> Self {
		attributes.append(Attribute.title(title))
		return self
	}
	
	public func translate(translate: Bool) -> Self {
		attributes.append(Attribute.translate(translate))
		return self
	}
}

public extension HtmlElement {
	public convenience init (_ closure: () -> [tag$])  {
		self.init()
		childs += closure()
	}
	public convenience init (_ childs: tag$...)  {
		self.init()
		self.childs += childs
	}
	public convenience init(_ childs: [tag$])  {
		self.init()
		self.childs += childs
	}
}

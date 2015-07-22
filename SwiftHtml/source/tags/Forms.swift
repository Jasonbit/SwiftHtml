//
//  Forms.swift
//  SwiftHtml
//
//  Created by Pawel Krzywdzinski on 7/22/15.
//  Copyright © 2015 Pawel Krzywdzinski. All rights reserved.
//

import Foundation


//---------------------------- Forms -----------------------------------


public enum HtmlEncType: String {
	case urlEncoded = "application/x-www-form-urlencoded"
	case multipartFormData = "multipart/form-data"
	case textPlain = "text/plain"
}

public enum HtmlMethod: String {
	case get = "get"
	case post = "post"
}

public class form$ : HtmlControl {
	override var name: String { return "form" }
	
	enum EventAttribute : HtmlAttribute {
		case onreset(String)
		case onsubmit(String)
		
		func toString() -> String {
			switch self {
			case onreset(let script): return attributeString(key: "onreset", value: script)
			case onsubmit(let script): return attributeString(key: "onsubmit", value: script)
			}
		}
	}
	
	public func onReset(script : String) -> Self { attributes.append(EventAttribute.onreset(script)); return self }
	public func onSubmit(script : String) -> Self { attributes.append(EventAttribute.onsubmit(script)); return self }
	
	
	enum Attribute : HtmlAttribute {
		case acceptCharset(String)
		case action(String)
		case autocomplete(Bool)
		case enctype(HtmlEncType)
		case method(HtmlMethod)
		case name(String)
		case novalidate
		case role(String)
		case target(HtmlTarget?, String?)
		
		func toString() -> String {
			switch self {
			case acceptCharset(let charset): return attributeString(key: "accept-charset", value: charset)
			case action(let url): return attributeString(key: "action", value: url)
			case autocomplete(let autocomplete): return attributeString(key: "autocomplete", value: autocomplete ? "on" : "off")
			case enctype(let enctype): return attributeString(key: "enctype", value: enctype.rawValue)
			case method(let method): return attributeString(key: "method", value: method.rawValue)
			case name(let name): return attributeString(key: "name", value: name)
			case novalidate: return "novalidate"
			case role(let role): return attributeString(key: "role", value: role)
			case target(let target, let framename):
				if let target = target { return attributeString(key: "target", value: target.rawValue) }
				if let framename = framename { return attributeString(key: "target", value: framename) }
			}
			return ""
		}
	}
	
	public func acceptCharset(charset: String) -> Self {
		attributes.append(Attribute.acceptCharset(charset))
		return self
	}
	
	public func action(url: String) -> Self {
		attributes.append(Attribute.action(url))
		return self
	}
	
	public func autocomplete(autocomplete: Bool) -> Self {
		attributes.append(Attribute.autocomplete(autocomplete))
		return self
	}
	
	public func enctype(enctype: HtmlEncType) -> Self {
		attributes.append(Attribute.enctype(enctype))
		return self
	}
	
	public func method(method: HtmlMethod) -> Self {
		attributes.append(Attribute.method(method))
		return self
	}
	
	public func name(name: String) -> Self {
		attributes.append(Attribute.name(name))
		return self
	}
	
	public func novalidate() -> Self {
		attributes.append(Attribute.novalidate)
		return self
	}
	
	public func role(role: String) -> Self {
		attributes.append(Attribute.role(role))
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

public enum HtmlInputType: String {
	case button
	case checkbox
	case color
	case date
	case datetime
	case datetimeLocal = "datetime-local"
	case email
	case file
	case hidden
	case image
	case month
	case number
	case password
	case radio
	case range
	case reset
	case search
	case submit
	case tel
	case text
	case time
	case url
	case week
}


public class input$ : HtmlControl {
	override var name: String { return "input" }
	
	enum EventAttribute : HtmlAttribute {
		case onchange(String)
		case oninput(String)
		case onselect(String)
		case oninvalid(String)
		case onsearch(String)
		
		func toString() -> String {
			switch self {
			case onchange(let script): return attributeString(key: "onchange", value: script)
			case oninput(let script): return attributeString(key: "oninput", value: script)
			case onselect(let script): return attributeString(key: "onselect", value: script)
			case oninvalid(let script): return attributeString(key: "oninvalid", value: script)
			case onsearch(let script): return attributeString(key: "onsearch", value: script)
			}
		}
	}
	
	public func onChange(script : String) -> Self { attributes.append(EventAttribute.onchange(script)); return self }
	public func onInput(script : String) -> Self { attributes.append(EventAttribute.oninput(script)); return self }
	public func onSelect(script : String) -> Self { attributes.append(EventAttribute.onselect(script)); return self }
	public func onInvalid(script : String) -> Self { attributes.append(EventAttribute.oninvalid(script)); return self }
	public func onSearch(script : String) -> Self { attributes.append(EventAttribute.onsearch(script)); return self }
	
	
	enum Attribute : HtmlAttribute {
		case accept(String)
		case alt(String)
		case autocomplete(Bool)
		case autofocus
		case checked
		case disabled
		case form(String)
		case formaction(String)
		case formenctype(HtmlEncType)
		case formmethod(HtmlMethod)
		case formnovalidate
		case formtarget(HtmlTarget?,String?)
		case height(Int)
		case list(String)
		case max(Double?,NSDate?)
		case maxlength(Int)
		case min(Double?,NSDate?)
		case multiple
		case name(String)
		case pattern(String)
		case placeholder(String)
		case readonly
		case required
		case size(Int)
		case src(String)
		case step(Int)
		case type(HtmlInputType)
		case value(String)
		case width(Int)
		
		func toString() -> String {
			switch self {
			case accept(let accept): return attributeString(key: "accept", value: accept)
			case alt(let text): return attributeString(key: "alt", value: text)
			case autocomplete(let autocomplete): return attributeString(key: "autocomplete", value: autocomplete ? "on" : "off")
			case autofocus: return "autofocus"
			case checked: return "checked"
			case disabled: return "disabled"
			case form(let formId): return attributeString(key: "form", value: formId)
			case formaction(let url): return attributeString(key: "formaction", value: url)
			case formenctype(let enctype): return attributeString(key: "formenctype", value: enctype.rawValue)
			case formmethod(let method): return attributeString(key: "formmethod", value: method.rawValue)
			case formnovalidate: return "formnovalidate"
			case formtarget(let target,let framename):
				if let target = target { return attributeString(key: "formtarget", value: target.rawValue) }
				if let framename = framename { return attributeString(key: "formtarget", value: framename) }
			case height(let pixels): return attributeString(key: "height", value: String(pixels))
			case list(let datalistId): return attributeString(key: "list", value: datalistId)
			case max(let value, let date):
				if let value = value { return attributeString(key: "max", value: String(value)) }
				if let date = date { return attributeString(key: "max", value: date.description) }
			case maxlength(let length): return attributeString(key: "maxlength", value: String(length))
			case min(let value, let date):
				if let value = value { return attributeString(key: "min", value: String(value)) }
				if let date = date { return attributeString(key: "min", value: date.description) }
			case multiple: return "multiple"
			case name(let name): return attributeString(key: "name", value: name)
			case pattern(let regexp): return attributeString(key: "pattern", value: regexp)
			case placeholder(let placeholder): return attributeString(key: "placeholder", value: placeholder)
			case readonly: return "readonly"
			case required: return "required"
			case size(let length): return attributeString(key: "size", value: String(length))
			case src(let url): return attributeString(key: "src", value: url)
			case step(let interval): return attributeString(key: "step", value: String(interval))
			case type(let type): return attributeString(key: "type", value: type.rawValue)
			case value(let value): return attributeString(key: "value", value: value)
			case width(let pixels): return attributeString(key: "width", value: String(pixels))
			}
			return ""
		}
	}
	
	public func accept(accept: String) -> Self {
		attributes.append(Attribute.accept(accept))
		return self
	}
	
	public func alt(text: String) -> Self {
		attributes.append(Attribute.alt(text))
		return self
	}
	
	public func autocomplete(autocomplete: Bool) -> Self {
		attributes.append(Attribute.autocomplete(autocomplete))
		return self
	}
	
	public func autofocus() -> Self {
		attributes.append(Attribute.autofocus)
		return self
	}
	
	public func checked() -> Self {
		attributes.append(Attribute.checked)
		return self
	}
	
	public func disabled() -> Self {
		attributes.append(Attribute.disabled)
		return self
	}
	
	public func form(formId: String) -> Self {
		attributes.append(Attribute.form(formId))
		return self
	}
	
	public func formaction(url: String) -> Self {
		attributes.append(Attribute.formaction(url))
		return self
	}
	
	public func formenctype(enctype: HtmlEncType) -> Self {
		attributes.append(Attribute.formenctype(enctype))
		return self
	}
	
	public func formmethod(method: HtmlMethod) -> Self {
		attributes.append(Attribute.formmethod(method))
		return self
	}
	
	public func formnovalidate() -> Self {
		attributes.append(Attribute.formnovalidate)
		return self
	}
	
	public func formtarget(target: HtmlTarget) -> Self {
		attributes.append(Attribute.formtarget(target, nil))
		return self
	}
	
	public func formtarget(framename: String) -> Self {
		attributes.append(Attribute.formtarget(nil, framename))
		return self
	}
	
	public func height(pixels: Int) -> Self {
		attributes.append(Attribute.height(pixels))
		return self
	}
	
	public func list(datalistId: String) -> Self {
		attributes.append(Attribute.list(datalistId))
		return self
	}
	
	public func max(value: Double) -> Self {
		attributes.append(Attribute.max(value, nil))
		return self
	}
	
	public func max(date: NSDate) -> Self {
		attributes.append(Attribute.max(nil, date))
		return self
	}
	
	public func maxlength(length: Int) -> Self {
		attributes.append(Attribute.maxlength(length))
		return self
	}
	
	public func min(value: Double) -> Self {
		attributes.append(Attribute.min(value, nil))
		return self
	}
	
	public func min(date: NSDate) -> Self {
		attributes.append(Attribute.min(nil, date))
		return self
	}
	
	public func multiple() -> Self {
		attributes.append(Attribute.multiple)
		return self
	}
	
	public func name(name: String) -> Self {
		attributes.append(Attribute.name(name))
		return self
	}
	
	public func pattern(regexp: String) -> Self {
		attributes.append(Attribute.pattern(regexp))
		return self
	}
	
	public func placeholder(placeholder: String) -> Self {
		attributes.append(Attribute.placeholder(placeholder))
		return self
	}
	
	public func readonly() -> Self {
		attributes.append(Attribute.readonly)
		return self
	}
	
	public func required() -> Self {
		attributes.append(Attribute.required)
		return self
	}
	
	public func size(length: Int) -> Self {
		attributes.append(Attribute.size(length))
		return self
	}
	
	public func src(url: String) -> Self {
		attributes.append(Attribute.src(url))
		return self
	}
	
	public func step(interval: Int) -> Self {
		attributes.append(Attribute.step(interval))
		return self
	}
	
	public func type(type: HtmlInputType) -> Self {
		attributes.append(Attribute.type(type))
		return self
	}
	
	public func value(value: String) -> Self {
		attributes.append(Attribute.value(value))
		return self
	}
	
	public func width(pixels: Int) -> Self {
		attributes.append(Attribute.width(pixels))
		return self
	}
}

//-------------------------

public enum HtmlWrap : String {
	case soft
	case hard
}

public class textarea$ : HtmlControl {
	override var name: String { return "textarea" }
	
	enum EventAttribute : HtmlAttribute {
		case oninput(String)
		case onselect(String)
		case onchange(String)
		
		func toString() -> String {
			switch self {
			case oninput(let script): return attributeString(key: "oninput", value: script)
			case onselect(let script): return attributeString(key: "onselect", value: script)
			case onchange(let script): return attributeString(key: "onchange", value: script)
			}
		}
	}
	
	public func onInput(script : String) -> Self { attributes.append(EventAttribute.oninput(script)); return self }
	public func onSelect(script : String) -> Self { attributes.append(EventAttribute.onselect(script)); return self }
	public func onChange(script : String) -> Self { attributes.append(EventAttribute.onchange(script)); return self }
	
	
	enum Attribute : HtmlAttribute {
		case autofocus
		case cols(Int)
		case disabled
		case form(String)
		case maxlength(Int)
		case name(String)
		case placeholder(String)
		case readonly
		case required
		case rows(Int)
		case wrap(HtmlWrap)
		
		func toString() -> String {
			switch self {
			case autofocus: return "autofocus"
			case cols(let cols): return attributeString(key: "cols", value: String(cols))
			case disabled: return "disabled"
			case form(let formId): return attributeString(key: "form", value: formId)
			case maxlength(let length): return attributeString(key: "maxlength", value: String(length))
			case name(let text): return attributeString(key: "name", value: text)
			case placeholder(let text): return attributeString(key: "placeholder", value: text)
			case readonly: return "readonly"
			case required: return "required"
			case rows(let rows): return attributeString(key: "rows", value: String(rows))
			case wrap(let wrap): return attributeString(key: "wrap", value: wrap.rawValue)
			}
		}
	}
	
	public func autofocus() -> Self {
		attributes.append(Attribute.autofocus)
		return self
	}
	
	public func cols(cols : Int) -> Self {
		attributes.append(Attribute.cols(cols))
		return self
	}
	
	public func disabled() -> Self {
		attributes.append(Attribute.disabled)
		return self
	}
	
	public func form(formId : String) -> Self {
		attributes.append(Attribute.form(formId))
		return self
	}
	
	public func maxlength(length :  Int) -> Self {
		attributes.append(Attribute.maxlength(length))
		return self
	}
	
	public func name(text : String) -> Self {
		attributes.append(Attribute.name(text))
		return self
	}
	
	public func placeholder(text : String) -> Self {
		attributes.append(Attribute.placeholder(text))
		return self
	}
	
	public func readonly() -> Self {
		attributes.append(Attribute.readonly)
		return self
	}
	
	public func required() -> Self {
		attributes.append(Attribute.required)
		return self
	}
	
	public func rows(rows : Int) -> Self {
		attributes.append(Attribute.rows(rows))
		return self
	}
	
	public func wrap(wrap : HtmlWrap) -> Self {
		attributes.append(Attribute.wrap(wrap))
		return self
	}
	
}

//-------------------------

public enum HtmlButtonType : String {
	case button
	case submit
	case reset
}

public class button$ : HtmlControl {
	override var name: String { return "button" }
	
	enum Attribute : HtmlAttribute {
		case autofocus
		case disabled
		case form(String)
		case formaction(String)
		case formenctype(HtmlEncType)
		case formmethod(HtmlMethod)
		case formnovalidate
		case formtarget(HtmlTarget?,String?)
		case name(String)
		case type(HtmlButtonType)
		case value(String)
		
		func toString() -> String {
			switch self {
			case autofocus: return "autofocus"
			case disabled: return "disabled"
			case form(let formId): return attributeString(key: "form", value: formId)
			case formaction(let url): return attributeString(key: "formaction", value: url)
			case formenctype(let enctype): return attributeString(key: "formenctype", value: enctype.rawValue)
			case formmethod(let method): return attributeString(key: "formmethod", value: method.rawValue)
			case formnovalidate: return "formnovalidate"
			case formtarget(let target,let framename):
				if let target = target { return attributeString(key: "formtarget", value: target.rawValue) }
				if let framename = framename { return attributeString(key: "formtarget", value: framename) }
			case name(let name): return attributeString(key: "name", value: name)
			case type(let type): return attributeString(key: "type", value: type.rawValue)
			case value(let value): return attributeString(key: "value", value: value)
			}
			return ""
		}
	}
	
	public func autofocus() -> Self {
		attributes.append(Attribute.autofocus)
		return self
	}
	
	public func disabled() -> Self {
		attributes.append(Attribute.disabled)
		return self
	}
	
	public func form(formId : String) -> Self {
		attributes.append(Attribute.form(formId))
		return self
	}
	
	public func formaction(url : String) -> Self {
		attributes.append(Attribute.formaction(url))
		return self
	}
	
	public func formenctype(enctype : HtmlEncType) -> Self {
		attributes.append(Attribute.formenctype(enctype))
		return self
	}
	
	public func formmethod(method : HtmlMethod) -> Self {
		attributes.append(Attribute.formmethod(method))
		return self
	}
	
	public func formnovalidate() -> Self {
		attributes.append(Attribute.formnovalidate)
		return self
	}
	
	public func formtarget(target: HtmlTarget) -> Self {
		attributes.append(Attribute.formtarget(target, nil))
		return self
	}
	
	public func formtarget(framename: String) -> Self {
		attributes.append(Attribute.formtarget(nil, framename))
		return self
	}
	
	public func name(name : String) -> Self {
		attributes.append(Attribute.name(name))
		return self
	}
	
	public func type(type : HtmlButtonType) -> Self {
		attributes.append(Attribute.type(type))
		return self
	}
	
	public func value(value : String) -> Self {
		attributes.append(Attribute.value(value))
		return self
	}
	
}


public class select$ : HtmlControl {
	override var name: String { return "select" }
	
	enum EventAttribute : HtmlAttribute {
		case onchange(String)
		
		func toString() -> String {
			switch self {
			case onchange(let script): return attributeString(key: "onchange", value: script)
			}
		}
	}
	
	public func onChange(script : String) -> Self { attributes.append(EventAttribute.onchange(script)); return self }
	
	
	enum Attribute : HtmlAttribute {
		case autofocus
		case disabled
		case form(String)
		case multiple
		case name(String)
		case required
		case size(Int)
		
		func toString() -> String {
			switch self {
			case autofocus: return "autofocus"
			case disabled: return "disabled"
			case form(let formId): return attributeString(key: "form", value: formId)
			case multiple: return "multiple"
			case name(let name): return attributeString(key: "name", value: name)
			case required: return "required"
			case size(let size): return attributeString(key: "size", value: String(size))
			}
		}
	}
	
	public func autofocus() -> Self {
		attributes.append(Attribute.autofocus)
		return self
	}
	
	public func disabled() -> Self {
		attributes.append(Attribute.disabled)
		return self
	}
	
	public func form(formId : String) -> Self {
		attributes.append(Attribute.form(formId))
		return self
	}
	
	public func multiple() -> Self {
		attributes.append(Attribute.multiple)
		return self
	}
	
	public func name(name : String) -> Self {
		attributes.append(Attribute.name(name))
		return self
	}
	
	public func required() -> Self {
		attributes.append(Attribute.required)
		return self
	}
	
	public func size(size : Int) -> Self {
		attributes.append(Attribute.size(size))
		return self
	}
}

//-------------------------

public class optgroup$ : HtmlControl {
	override var name: String { return "optgroup" }
	
	enum Attribute : HtmlAttribute {
		case disabled
		case label(String)
		
		func toString() -> String {
			switch self {
			case disabled: return "disabled"
			case label(let label): return attributeString(key: "label", value: label)
			}
		}
	}
	
	public func disabled() -> Self {
		attributes.append(Attribute.disabled)
		return self
	}
	
	public func label(label : String) -> Self {
		attributes.append(Attribute.label(label))
		return self
	}
}

//-------------------------

public class option$ : HtmlControl {
	override var name: String { return "option" }
	
	enum Attribute : HtmlAttribute {
		case disabled
		case label(String)
		case selected
		case value(String)
		
		func toString() -> String {
			switch self {
			case disabled: return "disabled"
			case label(let label): return attributeString(key: "label", value: label)
			case selected: return "selected"
			case value(let value): return attributeString(key: "value", value: value)
			}
		}
	}
	
	public func disabled() -> Self {
		attributes.append(Attribute.disabled)
		return self
	}
	
	public func label(label : String) -> Self {
		attributes.append(Attribute.label(label))
		return self
	}
	
	public func selected() -> Self {
		attributes.append(Attribute.selected)
		return self
	}
	
	public func value(value : String) -> Self {
		attributes.append(Attribute.value(value))
		return self
	}
}


//-------------------------

public class label$ : HtmlControl {
	override var name: String { return "label" }
	
	enum Attribute : HtmlAttribute {
		case forElement(String)
		case form(String)
		
		func toString() -> String {
			switch self {
			case forElement(let elementId): return attributeString(key: "for", value: elementId)
			case form(let formId): return attributeString(key: "form", value: formId)
			}
		}
	}
	
	public func forElement(elementId : String) -> Self {
		attributes.append(Attribute.forElement(elementId))
		return self
	}
	
	public func form(formId : String) -> Self {
		attributes.append(Attribute.form(formId))
		return self
	}
}


//-------------------------

public class fieldset$ : HtmlControl {
	override var name: String { return "fieldset" }
	
	enum Attribute : HtmlAttribute {
		case disabled
		case form(String)
		case name(String)
		
		func toString() -> String {
			switch self {
			case disabled: return "disabled"
			case form(let formId): return attributeString(key: "form", value: formId)
			case name(let name): return attributeString(key: "name", value: name)
			}
		}
	}
	
	public func disabled() -> Self {
		attributes.append(Attribute.disabled)
		return self
	}
	
	public func form(formId : String) -> Self {
		attributes.append(Attribute.form(formId))
		return self
	}
	
	public func name(name : String) -> Self {
		attributes.append(Attribute.name(name))
		return self
	}
}


//-------------------------

public class legend$ : HtmlControl { override var name: String { return "legend" } }

public class datalist$ : HtmlControl { override var name: String { return "datalist" } }


//-------------------------

public enum HtmlKeyType : String {
	case rsa
	case dsa
	case ec
}

public class keygen$ : HtmlControl {
	override var name: String { return "keygen" }
	
	enum EventAttribute : HtmlAttribute {
		case onreset(String)
		case onsubmit(String)
		case onchange(String)
		
		func toString() -> String {
			switch self {
			case onreset(let script): return attributeString(key: "onreset", value: script)
			case onsubmit(let script): return attributeString(key: "onsubmit", value: script)
			case onchange(let script): return attributeString(key: "onchange", value: script)
			}
		}
	}
	
	public func onReset(script : String) -> Self { attributes.append(EventAttribute.onreset(script)); return self }
	public func onSubmit(script : String) -> Self { attributes.append(EventAttribute.onsubmit(script)); return self }
	public func onChange(script : String) -> Self { attributes.append(EventAttribute.onchange(script)); return self }
	
	
	enum Attribute : HtmlAttribute {
		case autofocus
		case challenge
		case disabled
		case form(String)
		case keytype(HtmlKeyType)
		case name(String)
		
		func toString() -> String {
			switch self {
			case autofocus: return "autofocus"
			case challenge: return "challenge"
			case disabled: return "disabled"
			case form(let formId): return attributeString(key: "form", value: formId)
			case keytype(let keytype): return attributeString(key: "keytype", value: keytype.rawValue)
			case name(let name): return attributeString(key: "name", value: name)
			}
		}
	}
	
	public func autofocus() -> Self {
		attributes.append(Attribute.autofocus)
		return self
	}
	
	public func challenge() -> Self {
		attributes.append(Attribute.challenge)
		return self
	}
	
	public func disabled() -> Self {
		attributes.append(Attribute.disabled)
		return self
	}
	
	public func form(formId : String) -> Self {
		attributes.append(Attribute.form(formId))
		return self
	}
	
	public func keytype(keytype : HtmlKeyType) -> Self {
		attributes.append(Attribute.keytype(keytype))
		return self
	}
	
	public func name(name : String) -> Self {
		attributes.append(Attribute.name(name))
		return self
	}
}


//-------------------------

public class output$ : HtmlControl {
	override var name: String { return "output" }
	
	enum Attribute : HtmlAttribute {
		case forElements(String)
		case form(String)
		case name(String)
		
		func toString() -> String {
			switch self {
			case forElements(let elements): return attributeString(key: "for", value: elements)
			case form(let formId): return attributeString(key: "form", value: formId)
			case name(let name): return attributeString(key: "name", value: name)
			}
		}
	}
	
	public func forElements(elements : String) -> Self {
		attributes.append(Attribute.forElements(elements))
		return self
	}
	
	public func form(formId : String) -> Self {
		attributes.append(Attribute.form(formId))
		return self
	}
	
	public func name(name : String) -> Self {
		attributes.append(Attribute.name(name))
		return self
	}
}

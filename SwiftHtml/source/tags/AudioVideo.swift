//
//  AudioVideo.swift
//  SwiftHtml
//
//  Created by Pawel Krzywdzinski on 7/22/15.
//  Copyright © 2015 Pawel Krzywdzinski. All rights reserved.
//

import Foundation


//---------------------------- Audio / Video -----------------------------------


public enum HtmlAudioVideoPreload : String {
	case auto
	case metadata
	case none
}


public class audio$ : HtmlControl {
	override var name: String { return "audio" }
	
	enum Attribute : HtmlAttribute {
		case autoplay
		case controls
		case loop
		case muted
		case preload(HtmlAudioVideoPreload)
		case src(String)
		
		func toString() -> String {
			switch self {
			case autoplay: return "autoplay"
			case controls: return "controls"
			case loop: return "loop"
			case muted: return "muted"
			case preload(let preload): return attributeString(key: "preload", value: preload.rawValue)
			case src(let url): return attributeString(key: "src", value: url)
			}
		}
	}
	
	public func autoplay() -> Self {
		attributes.append(Attribute.autoplay)
		return self
	}
	
	public func controls() -> Self {
		attributes.append(Attribute.controls)
		return self
	}
	
	public func loop() -> Self {
		attributes.append(Attribute.loop)
		return self
	}
	
	public func muted() -> Self {
		attributes.append(Attribute.muted)
		return self
	}
	
	public func preload(preload : HtmlAudioVideoPreload) -> Self {
		attributes.append(Attribute.preload(preload))
		return self
	}
	
	public func src(url : String) -> Self {
		attributes.append(Attribute.src(url))
		return self
	}
}


//-------------------------

public class source$ : HtmlControl {
	override var name: String { return "source" }
	override var hasEndTag: Bool { return false }
	
	enum Attribute : HtmlAttribute {
		case media(String)
		case src(String)
		case type(String)
		
		func toString() -> String {
			switch self {
			case media(let media): return attributeString(key: "media", value: media)
			case src(let url): return attributeString(key: "src", value: url)
			case type(let mediaType): return attributeString(key: "type", value: mediaType)
			}
		}
	}
	
	public func media(media : String) -> Self {
		attributes.append(Attribute.media(media))
		return self
	}
	
	public func src(url : String) -> Self {
		attributes.append(Attribute.src(url))
		return self
	}
	
	public func type(mediaType : String) -> Self {
		attributes.append(Attribute.type(mediaType))
		return self
	}
}


//-------------------------

public enum HtmlTrackKind : String {
	case captions
	case chapters
	case descriptions
	case metadata
	case subtitles
}

public class track$ : HtmlControl {
	override var name: String { return "track" }
	override var hasEndTag: Bool { return false }
	
	enum Attribute : HtmlAttribute {
		case DEFAULT
		case kind(HtmlTrackKind)
		case label(String)
		case src(String)
		case srclang(String)
		
		func toString() -> String {
			switch self {
			case DEFAULT: return "default"
			case kind(let kind): return attributeString(key: "kind", value: kind.rawValue)
			case label(let label): return attributeString(key: "label", value: label)
			case src(let url): return attributeString(key: "src", value: url)
			case srclang(let srclang): return attributeString(key: "srclang", value: srclang)
			}
		}
	}
	
	public func DEFAULT() -> Self {
		attributes.append(Attribute.DEFAULT)
		return self
	}
	
	public func kind(kind : HtmlTrackKind) -> Self {
		attributes.append(Attribute.kind(kind))
		return self
	}
	
	public func label(label : String) -> Self {
		attributes.append(Attribute.label(label))
		return self
	}
	
	public func src(url : String) -> Self {
		attributes.append(Attribute.src(url))
		return self
	}
	
	public func srclang(srclang : String) -> Self {
		attributes.append(Attribute.srclang(srclang))
		return self
	}
}


//-------------------------

public class video$ : HtmlControl {
	override var name: String { return "video" }
	
	enum Attribute : HtmlAttribute {
		case autoplay
		case controls
		case height(Int)
		case loop
		case muted
		case poster(String)
		case preload(HtmlAudioVideoPreload)
		case src(String)
		case width(Int)
		
		func toString() -> String {
			switch self {
			case autoplay: return "autoplay"
			case controls: return "controls"
			case height(let pixels): return attributeString(key: "height", value: String(pixels))
			case loop: return "loop"
			case muted: return "muted"
			case poster(let poster): return attributeString(key: "poster", value: poster)
			case preload(let preload): return attributeString(key: "preload", value: preload.rawValue)
			case src(let url): return attributeString(key: "src", value: url)
			case width(let pixels): return attributeString(key: "width", value: String(pixels))
			}
		}
	}
	
	public func autoplay() -> Self {
		attributes.append(Attribute.autoplay)
		return self
	}
	
	public func controls() -> Self {
		attributes.append(Attribute.controls)
		return self
	}
	
	public func height(pixels : Int) -> Self {
		attributes.append(Attribute.height(pixels))
		return self
	}
	
	public func loop() -> Self {
		attributes.append(Attribute.loop)
		return self
	}
	
	public func muted() -> Self {
		attributes.append(Attribute.muted)
		return self
	}
	
	public func poster(poster : String) -> Self {
		attributes.append(Attribute.poster(poster))
		return self
	}
	
	public func preload(preload : HtmlAudioVideoPreload) -> Self {
		attributes.append(Attribute.preload(preload))
		return self
	}
	
	public func src(url : String) -> Self {
		attributes.append(Attribute.src(url))
		return self
	}
	
	public func width(pixels : Int) -> Self {
		attributes.append(Attribute.width(pixels))
		return self
	}
}


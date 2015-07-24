//
//  HtmlBase.swift
//  SwiftHtml
//
//  Created by Pawel Krzywdzinski on 7/22/15.
//  Copyright © 2015 Pawel Krzywdzinski. All rights reserved.
//

import Foundation

public protocol tag$ {
	var htmlString: String { get }
}

extension String : tag$ {
	public var htmlString: String { return self }
}

protocol HtmlAttribute {
	func toString() -> String
}

func attributeString(key key: String, value: String) -> String {
	return "\(key)=\"\(value)\""
}


### What is a SwiftHtml ?

Helpful library for the dynamic creation of HTML using the Swift 2.0 programming language (https://developer.apple.com/swift)

### How can I start ?

```swift
import Foundation
import HttpServer
import SwiftHtml

let page = html$ (
	head$ (
		title$ ("Hello")
	),
	body$ (
		"Hello, World!"
	)
)

let server = try! Server(onPort: 8080) { (request , response ) -> () in
	response.data = page.htmlData
}

server.run()
```

### How it works

```swift
h1$("Hello, ", mark$("World"), " !").style("text-align:center")
```

or

```swift
h1$().style("text-align:center").innerHtml (
	"Hello, ",	mark$("World"),	" !"
)
```

SwiftHtml translates into

```html
<h1 style="text-align:center">Hello, <mark>World</mark> !</h1>
```

### How to create a context dynamically

With the SwiftHtml you can create a web page dynamically using Swift closures.

```swift
let myTable = table$().classes("table", "table-striped").innerHtml(
	thead$ (
		tr$ (
			th$("First name"),
			th$("Last name"),
			th$("Email")
		)
	),
	tbody$ {
		var body = [tag$]()
		for i in 1...10 {
			body.append(
				tr$ (
					td$ ("Name \(i)"),
					td$ ("Last name \(i)"),
					td$ ("Email \(i)")
				)
			)
		}
		return body
	}
)
```

And now you can put just created table into the html body.

```swift
let page = html$ (
	head$ (
		meta$()
			.httpEquiv(.contentType)
			.content("text/html")
			.charset("utf-8"),

		link$()
			.rel(.stylesheet)
			.href("https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"),

		title$ ("Users")
	),

	body$ (
		h1$("Users Table").style("text-align:center"),
		br$(),
		myTable
	)
)
```

### You can easily combine SwiftHtml with Java Script

Create java script file (scripts.js)

```js
function showName(name) {
	alert("Your name is " + name.innerHTML);
}
```

And now main.swift file

```swift
import Foundation
import HttpServer
import SwiftHtml

let page = html$ (
	body$ (
		ul$ (
			li$("Tom").onClick("showName(this)"),
			li$("Paul").onClick("showName(this)"),
			li$("John").onClick("showName(this)")
		),
		script$().src("js/scripts.js")
	)
)

try! Server(onPort: 8080) { 
	(request , response ) -> () in

	if let requestUrl = request.url {
		switch requestUrl {
		case "/" : response.data = page.htmlData
		default: response.data = NSMutableData(contentsOfFile: "./public"+requestUrl)
		}
	}
}.run()
```

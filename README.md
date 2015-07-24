### What is a SwiftHtml ?

Helpful library for the dynamic creation of HTML using the Swift 2.0 programming language (https://developer.apple.com/swift)

### How can I start ?

```swift
let page = html$ (
	head$ (
		title$ ("Hello")
	),
	body$ (
		"Hello world!"
	)
)

let server = try! Server(onPort: 8080) { (request , response ) -> () in
	response.data = page.htmlData
}

server.run()

```

### How it works?

```swift
h1$("Hello, ", mark$("World"), " !").style("text-align:center")
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

		title$ ("Login")
	),

	body$ (
		h1$("Users Table").style("text-align:center"),
		br$(),
		myTable
	)
)
```

### If you need styles just put them into dictionary

```swift
let page = html$ (
	head$ (
		style$ (["h1.center":"text-align:center"]),
	),
	body$ (
		h1$("Hello!").classes("center"),
		h1$("Hello!")
	)
)
```


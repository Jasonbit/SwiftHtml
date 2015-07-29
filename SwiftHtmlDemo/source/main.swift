//
//  main.swift
//  SwiftHtmlDemo
//
//  Created by Pawel Krzywdzinski on 7/22/15.
//  Copyright © 2015 Pawel Krzywdzinski. All rights reserved.
//


import Foundation
import SwiftHtml
import HttpServer

let myModalContent: [tag$] =
[
	// ---- header ----
	div$()
		.classes("panel-heading")
		.innerHtml (
			
			h3$("Sign In").classes("panel-title")
	),
	
	// ----- body -----
	div$()
		.classes("panel-body")
		.innerHtml (
			
			form$()
				.method(.post)
				.action("/login")
				.innerHtml (
					
					fieldset$ (
						
						div$()
							.classes("form-group")
							.innerHtml (
								
								input$().classes("form-control").placeholder("E-mail").name("email").type(.password).autofocus()
						),
						
						div$()
							.classes("form-group")
							.innerHtml (
								
								input$().classes("form-control").placeholder("Password").name("password").type(.password).autofocus()
						),
						
						a$()
							.href("/login")
							.innerHtml (
								
								button$("Login").type(.submit).classes("btn btn-default")
						)
					)
			)
	)
]


let pageLogin =
html$ (
	
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
		h1$("Welcome SwiftHtml 0.0.1").style("text-align:center"),
		
		div$()
			.classes("col-md-13")
			.innerHtml (
				
				div$()
					.classes("modal-dialog")
					.style("margin-bottom:0")
					.innerHtml (
						
						div$()
							.classes("modal-content")
							.style("margin:20")
							.innerHtml (
								
								myModalContent
						)
				)
		)
	)
)

let myTable =
table$().classes("table", "table-striped").innerHtml(
	thead$ (
		tr$ (
			th$("First name"),
			th$("Last name"),
			th$("Email")
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
)

let page1 =
html$ (
	
	head$ (
		meta$()
			.httpEquiv(.contentType)
			.content("text/html")
			.charset("utf-8"),
		
		link$()
			.rel(.stylesheet)
			.href("https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"),
		
		title$("Table")
	),
	
	body$ (
		div$()
			.classes("modal-dialog")
			.innerHtml (
				
				div$()
					.classes("modal-content")
					.innerHtml (
						
						div$()
							.classes("panel-body")
							.innerHtml (
								
								h2$("Users Table"),
								p$("Generated users names"),
								myTable,
								a$().href("/").innerHtml (
									button$("Back").type(.submit).classes("btn", "btn-default").style("float:right")
								)
						)
				)
		)
	)
)


let server = try! HttpServer(onPort: 8080) {
	(request , response ) -> () in
	
	if let requestUrl = request.url {
		switch requestUrl {
		case "/" : response.data = pageLogin.htmlData
		case "/login": response.data = page1.htmlData
		default: response.data = NSMutableData(contentsOfFile: "./public"+requestUrl)
		}
	}
}

server.run()


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
		.classId("panel-heading")
		.innerHtml (
			
			h3$("Sign In").classId("panel-title")
	),
	
	// ----- body -----
	div$()
		.classId("panel-body")
		.innerHtml (
			
			form$()
				.method(.post)
				.action("/login")
				.innerHtml (
					
					fieldset$ (
						
						div$()
							.classId("form-group")
							.innerHtml (
								
								input$().classId("form-control").placeholder("E-mail").name("email").type(.password).autofocus()
						),
						
						div$()
							.classId("form-group")
							.innerHtml (
								
								input$().classId("form-control").placeholder("Password").name("password").type(.password).autofocus()
						),
						
						a$()
							.href("/login")
							.innerHtml (
								
								button$("Login").type(.submit).classId("btn btn-default")
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
			.classId("col-md-13")
			.innerHtml (
				
				div$()
					.classId("modal-dialog")
					.style("margin-bottom:0")
					.innerHtml (
						
						div$()
							.classId("modal-content")
							.style("margin:20")
							.innerHtml (
								
								myModalContent
						)
				)
		)
	)
)

let myTable =
table$().classId("table table-striped").innerHtml(
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
			.classId("modal-dialog")
			.innerHtml (
				
				div$()
					.classId("modal-content")
					.innerHtml (
						
						div$()
							.classId("panel-body")
							.innerHtml (
								
								h2$("Users Table"),
								p$("Generated users names"),
								myTable,
								a$().href("/").innerHtml (
									button$("Back").type(.submit).classId("btn btn-default").style("float:right")
								)
						)
				)
		)
	)
)


let server = try! Server(onPort: 8080) {
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


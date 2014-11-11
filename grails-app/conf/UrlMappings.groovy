class UrlMappings {
    static mappings = {
        "/$controller/$action?/$id?"{
	      constraints {
			 // apply constraints here
		  }
	}
         "/admin"(view:"/index")
        "500"(view:'/error')
	}
}
dataSource {
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	username = "root"
	password = "mustik"
	url = "jdbc:mysql://localhost/scambiacose?autoReconnect=true"
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='com.opensymphony.oscache.hibernate.OSCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop','update'
		}
	}
	test {
		dataSource {
			dbCreate = "update"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
		}
	}
}
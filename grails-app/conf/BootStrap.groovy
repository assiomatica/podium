import org.weceem.auth.*
import org.codehaus.groovy.grails.commons.ApplicationAttributes
import org.grails.plugins.springsecurity.service.AuthenticateService


class BootStrap {
    def authenticateService
    
    def init = { servletContext ->
        
        //WeceemPluginUrlMappings.FORBIDDEN_SPACE_URIS.addAll(["images","js","uploads","immagini","media","svcore"])
        println(System.getProperty("java.io.tmpdir"))
        
        // 
        // di seguito come inserire voci nel menu di admin di webceem
        def ctx = servletContext.getAttribute(ApplicationAttributes.APPLICATION_CONTEXT)
        // setupSecurity(ctx)
      
        def authenticateService = ctx.authenticateService
        ctx.wcmSecurityService.securityDelegate = [
            
            getUserName : { ->
		def princ = authenticateService.principal()
		if (princ instanceof String) {
                    return null
		} else {
                    return authenticateService.principal()?.username
		}
            },
            getUserEmail : { ->
		def princ = authenticateService.principal()
		if (princ instanceof String) {
                    return null
		} else {
                    return authenticateService.principal()?.email
		}
            },
            getUserRoles: {-> new ArrayList(authenticateService.userDomain()?.authorities.collect {role -> role.authority} as Collection) ?: ['ROLE_GUEST'] },
            getUserPrincipal : { -> 
		authenticateService.principal()
            }
        ]

    }
    
    def destroy = {
    }
 }

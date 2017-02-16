package com.jeantessier.user

import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_ADMIN")
class SecureController {

    def springSecurityService

    def index() {
        [
            message: "Secure access only",
            principal: springSecurityService.principal,
        ]
    }

}

# Grails 3 LDAP Example

This Grails 3.2 app uses LDAP to manage login credentials and authorized
groups.

I used OpenLDAP running in Docker as my LDAP server.  If you have Docker
installed, you can spin up a container with:

    docker create --name openldap --env LDAP_ORGANISATION="Jean Tessier" --env LDAP_DOMAIN="jeantessier.com" -p 389:389 osixia/openldap:1.1.7
    docker start openldap

The new LDAP server will have a default admin account
`cn=admin,dc=jeantessier,dc=com` with a default password of `admin`.

You can run the app with:

    ./gradlew bootRun

And then point your browser to:

    http://localhost:8080

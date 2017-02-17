# Grails 3 LDAP Example

This Grails 3.2 app uses LDAP to manage login credentials and authorized
groups.

## LDAP Data Source

I used OpenLDAP running in Docker as my LDAP server.  If you have Docker
installed, you can spin up a container with:

    docker create --name openldap --env LDAP_ORGANISATION="Jean Tessier" --env LDAP_DOMAIN="jeantessier.com" -p 389:389 osixia/openldap:1.1.7
    docker start openldap

The new LDAP server will have a default admin account
`cn=admin,dc=jeantessier,dc=com` with a default password of `admin`.

I put some test data in `user_roles.ldif` that you can use to seed the LDAP
server.  You can load this test data with:

    docker cp user_roles.ldif openldap:/tmp/user_roles.ldif
    docker exec openldap ldapadd -x -h localhost -D "cn=admin,dc=jeantessier,dc=com" -w admin -f /tmp/user_roles.ldif

The test data includes a test account `jean` (with password "abcd1234") that has
authorities `ROLE_USER` and `ROLE_ADMIN`.  As such, this account can access the
`/secure` endpoint.  The second test accound is `mylene` (also with password
"abcd1234"), but it has only the `ROLE_USER` authority and cannot access the
`/secure` URL.

## Running the Application

You can run the app with:

    ./gradlew bootRun

And then point your browser to [localhost:8080](http://localhost:8080).

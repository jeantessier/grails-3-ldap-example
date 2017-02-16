<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Public</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body>

<div id="content" role="main">
    <section class="row colset-2-its">

        <h1>${message}</h1>

        <h2>principal</h2>
        <g:if test="${principal}">
            <dl>
                <dt>username</dt>
                <dd>${principal.username}</dd>
                <dt>password</dt>
                <dd><g:if
                        test="${principal.password}">${principal.password}</g:if><g:else><strike>redacted</strike></g:else>
                </dd>
                <dt>authorities</dt>
                <dd>${principal.authorities.join(", ")}</dd>
            </dl>
        </g:if>
        <code>${principal}</code>

        <h2>Roles</h2>
        <ul>
            <sec:ifAllGranted roles="ROLE_ANONYMOUS">
                <li>anonymous</li>
            </sec:ifAllGranted>
            <sec:ifAllGranted roles="ROLE_USER">
                <li>user</li>
            </sec:ifAllGranted>
            <sec:ifAllGranted roles="ROLE_ADMIN">
                <li>admin</li>
            </sec:ifAllGranted>
        </ul>

    </section>
</div>

</body>
</html>

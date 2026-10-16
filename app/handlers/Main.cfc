component extends="coldbox.system.EventHandler" {

    /**
     * Default Action
     */
    function index(event, rc, prc) {
        prc.welcomeMessage = "Welcome to ColdBox!";
        event.setView("main/index");
    }

    /**
     * Produce some RESTful data
     */
    function data(event, rc, prc) {
        return [
            { "id": createUUID(), "name": "Luis" },
            { "id": createUUID(), "name": "JOe" },
            { "id": createUUID(), "name": "Bob" },
            { "id": createUUID(), "name": "Darth" }
        ];
    }

    /**
     * Error action
     */
    function error(event, rc, prc) {
        event.setView("Main/error");
    }

    /**
     * Relocation example
     */
    function doSomething(event, rc, prc) {
        prc.welcomeMessage = "Welcome to ColdBox!";
        relocate("main.index");
    }

    /**
     * XSS lab endpoint with HTML output encoding.
     */
    function xssLab(event, rc, prc) {
        var testValue = toString(rc.testValue ?: "");
        var safeValue = encodeForHTML(testValue);

        event.renderData(
            type = "html",
            data = "<h2>Submitted value:</h2><p>" & safeValue & "</p>"
        );
    }

    /**
     * Read-only database connectivity test.
     */
    function dbTest(event, rc, prc) {
        var result = queryExecute(
            "SELECT COUNT(*) AS total FROM users",
            [],
            { datasource: "coldbox" }
        );

        event.renderData(
            type = "json",
            data = {
                "database": "connected",
                "userCount": result.total[1]
            }
        );
    }

    /**
     * Secure SQL injection lab.
     * Uses a named parameter to separate SQL from user input.
     */
    function sqlInjectionLab(event, rc, prc) {
        var username = toString(rc.username ?: "");

        var result = queryExecute(
            "SELECT id, username FROM users WHERE username = :username",
            {
                username: {
                    value: username,
                    cfsqltype: "cf_sql_varchar"
                }
            },
            { datasource: "coldbox" }
        );

        var users = [];

        for (var row in result) {
            arrayAppend(users, {
                "id": row.id,
                "username": row.username
            });
        }

        event.renderData(
            type = "json",
            data = {
                "queryType": "parameterized",
                "results": users
            }
        );
    }

    /**
     * Intentionally vulnerable SQL injection demonstration.
     * Use only in your local cybersecurity test environment.
     */
    function sqlInjectionVulnerable(event, rc, prc) {
        var username = toString(rc.username ?: "");

        // INTENTIONALLY VULNERABLE: user input is concatenated into SQL.
        var sql = "SELECT id, username FROM users WHERE username = '"
            & username & "'";

        var result = queryExecute(
            sql,
            [],
            { datasource: "coldbox" }
        );

        var users = [];

        for (var row in result) {
            arrayAppend(users, {
                "id": row.id,
                "username": row.username
            });
        }

        event.renderData(
            type = "json",
            data = {
                "queryType": "vulnerable",
                "results": users
            }
        );
    }

    /**************** IMPLICIT ACTIONS ****************/

    function onAppInit(event, rc, prc) {
    }

    /**
     * Add security headers to application responses.
     */
    function onRequestStart(event, rc, prc) {
        event.setHTTPHeader(
            name = "X-Content-Type-Options",
            value = "nosniff"
        );

        event.setHTTPHeader(
            name = "X-Frame-Options",
            value = "DENY"
        );

        event.setHTTPHeader(
            name = "Referrer-Policy",
            value = "strict-origin-when-cross-origin"
        );

        // Relax CSP only for the Route Visualizer during development.
        var isDevelopment = compareNoCase(
            getSystemSetting("ENVIRONMENT", "production"),
            "development"
        ) == 0;

        var isRouteVisualizer = compareNoCase(
            event.getCurrentModule(),
            "route-visualizer"
        ) == 0;

        if (isDevelopment && isRouteVisualizer) {
            event.setHTTPHeader(
                name = "Content-Security-Policy",
                value = "default-src 'self'; script-src 'self' 'unsafe-inline' https://code.jquery.com https://cdn.jsdelivr.net; style-src 'self' 'unsafe-inline' https://cdn.jsdelivr.net; font-src 'self' https://cdn.jsdelivr.net; connect-src 'self' https://cdn.jsdelivr.net; form-action 'self'; frame-ancestors 'none'"
            );
        } else {
            // Keep the stricter policy for all other requests.
            event.setHTTPHeader(
                name = "Content-Security-Policy",
                value = "default-src 'self'; style-src 'self' https://cdn.jsdelivr.net; font-src 'self' https://cdn.jsdelivr.net; form-action 'self'; frame-ancestors 'none'"
            );
        }
    }

    function onRequestEnd(event, rc, prc) {
    }

    function onSessionStart(event, rc, prc) {
    }

    function onSessionEnd(event, rc, prc) {
        var sessionScope = event.getValue("sessionReference");
        var applicationScope = event.getValue("applicationReference");
    }

    function onException(event, rc, prc) {
        event.setHTTPHeader(statusCode = 500);

        var exception = prc.exception;

        // Add custom exception handling here if needed.
    }

}
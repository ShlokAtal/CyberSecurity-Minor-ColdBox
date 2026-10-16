<p align="center">
	<img src="https://www.ortussolutions.com/__media/coldbox-185-logo.png">
	<br>
	<img src="https://www.ortussolutions.com/__media/wirebox-185.png" height="125">
	<img src="https://www.ortussolutions.com/__media/cachebox-185.png" height="125" >
	<img src="https://www.ortussolutions.com/__media/logbox-185.png"  height="125">
</p>

<p align="center">
	<a href="https://github.com/ColdBox/coldbox-platform/actions/workflows/snapshot.yml"><img src="https://github.com/ColdBox/coldbox-platform/actions/workflows/snapshot.yml/badge.svg" alt="ColdBox Snapshots" /></a>
	<a href="https://forgebox.io/view/coldbox"><img src="https://forgebox.io/api/v1/entry/coldbox/badges/downloads" alt="Total Downloads" /></a>
	<a href="https://forgebox.io/view/coldbox"><img src="https://forgebox.io/api/v1/entry/coldbox/badges/version" alt="Latest Stable Version" /></a>
	<a href="https://img.shields.io/badge/License-Apache2-brightgreen"><img src="https://img.shields.io/badge/License-Apache2-brightgreen" alt="Apache2 License" /></a>
</p>

<p align="center">
	Copyright Since 2005 ColdBox Platform by Luis Majano and Ortus Solutions, Corp
	<br>
	<a href="https://www.coldbox.org">www.coldbox.org</a> |
	<a href="https://www.ortussolutions.com">www.ortussolutions.com</a>
</p>

----

# 🏗️ ColdBox Modern Application Template

Welcome to the **Modern** ColdBox application template! 🎉 This template provides a secure, production-ready foundation for building enterprise-grade HMVC (Hierarchical Model-View-Controller) web applications using **Adobe ColdFusion** or **BoxLang**.

## 🌟 What Makes This Template "Modern"?

Unlike traditional ColdBox templates where all files live in the web root, this template implements a **security-first architecture** by separating your application code from publicly accessible files:

- **📁 `/public`** - Only public assets (CSS, JS, images, index.cfm) are web-accessible
- **🔒 `/app`** - Application code (handlers, models, views, config) sits **outside** the web root
- **🛡️ Enhanced Security** - Prevents direct web access to application logic and configuration
- **🏢 Production Ready** - Industry best practice for secure deployments

> **💡 Perfect for**: Production applications, enterprise environments, security-conscious projects, and teams following modern web development practices.

## ⚙️ Requirements

Before getting started, ensure you have the following installed on your operating system:

1. **CommandBox** - CLI toolchain, package manager, and server runtime
   - 📥 Installation: <https://commandbox.ortusbooks.com/setup/installation>
   - 📌 Minimum Version: 6.0+
   - 🎯 Used for: dependency management, server starting, testing, and task automation

2. **CFML Engine** - Adobe ColdFusion 2021+ **OR** BoxLang 1.0+
   - **Adobe ColdFusion**: <https://www.adobe.com/products/coldfusion-family.html>
   - **BoxLang**: <https://boxlang.ortusbooks.com/getting-started/installation>
   - ⚠️ **Note**: Lucee is **no longer supported** on this template
   - 🎯 This template works with both Adobe ColdFusion and BoxLang engines

3. **Maven** - Java dependency manager (Optional)
   - 📥 Installation: <https://maven.apache.org/install.html>
   - 📌 Minimum Version: 3.6+
   - 🎯 Used for: managing Java dependencies if your project requires them

### Verification

Verify your installation:

```bash
# Check CommandBox is installed
box version

# Check your CFML engine (BoxLang example)
box boxlang version

# Verify project setup
box install
```

## ⚡ Quick Installation

```bash
# Create a new ColdBox application using this Modern template
box coldbox create app name=myApp skeleton=modern

# Navigate into your app directory
cd myApp

# Install dependencies
box install

# Start the web server
box server start
```

Your application will be available at `http://localhost:8080` 🌐

Code to your liking and enjoy! 🎊

## 📁 Modern Template Structure

This template follows a **security-first architecture** where application code lives outside the web root:

### 🏗️ ColdBox Application (`/app/`)

This folder contains the main ColdBox application code via conventions. It is **NOT** web-accessible for security.

```text
app/
├── 🔧 Application.cfc        # Security barrier (contains only "abort")
├── config/                   # Configuration files
│   ├── ColdBox.cfc          # Main framework settings
│   ├── Router.cfc           # URL routing definitions
│   ├── WireBox.cfc          # Dependency injection (optional)
│   └── CacheBox.cfc         # Caching configuration (optional)
├── 🎮 handlers/             # Event handlers (controllers)
├── 🛠️ helpers/              # Application helpers (optional)
├── 🔌 interceptors/         # Event interceptors/listeners
├── 🎨 layouts/              # View layouts
├── 📝 logs/                 # Application logs
├── 🏗️ models/               # Business logic models
└── 👁️ views/                # View templates
```

### 🌐 Public Web Root (`/public/`)

This folder contains **ONLY** publicly accessible files - the CommandBox server points here.

```text
public/
├── 📱 Application.cfc       # Bootstrap that maps to /app
├── 🎯 index.cfm             # Main entry point
├── 🖼️ favicon.ico           # Site icon
├── 🤖 robots.txt            # Search engine directives
└── 📦 includes/             # Static assets (CSS, JS, images)
```

### 📚 Libraries (`/lib/`)

Framework and dependency storage managed by CommandBox:

```text
lib/
├── coldbox/                 # ColdBox framework files
├── testbox/                 # TestBox testing framework
├── modules/                 # CommandBox-installed modules (cbdebugger, cbswagger, etc.)
└── java/                    # Java JAR dependencies (optional)
```

### 🧪 Tests (`/tests/`)

Test suites for your application:

```text
tests/
├── Application.cfc          # Test application setup
├── runner.cfm               # TestBox test runner
├── index.cfm                # Test entry point
└── specs/                   # BDD test specifications
    └── integration/         # Integration tests
```

### 🔧 Configuration & Build

```text
├── 📋 box.json              # CommandBox dependencies and project descriptor
├── 🏗️ pom.xml               # Maven dependencies (optional)
├── 🖥️ server.json           # CommandBox server configuration (CRITICAL for aliases)
├── 🐳 docker/               # Docker configuration
├── 📚 resources/            # Non-web resources
│   ├── database/            # Database migrations/seeders
│   └── apidocs/             # API documentation
├── .env.example             # Environment variable template
├── .cfconfig.json           # CFML engine configuration
├── .cfformat.json           # Code formatting rules
└── .editorconfig            # Editor configuration
```

## 🔗 CommandBox Web Aliases (CRITICAL)

Because application code lives outside `/public`, you **must** configure CommandBox aliases in `server.json` to expose internal paths for modules with UI assets:

```json
"web": {
    "webroot": "public",
    "rewrites": {
        "enable": true
    },
    "aliases": {
        "/coldbox/system/exceptions": "./lib/coldbox/system/exceptions/",
        "/tests": "./tests/"
    }
}
```

### 📦 Adding Module Aliases

When you install ColdBox modules that have web-accessible assets (like `cbdebugger`, `cbswagger`, `relax`), you **MUST** add aliases:

```bash
# Install a module with UI
box install cbdebugger

# Add the alias to server.json
"aliases": {
    "/cbdebugger": "./lib/modules/cbdebugger",
    "/coldbox/system/exceptions": "./lib/coldbox/system/exceptions/",
    "/tests": "./tests/"
}

# Restart the server
box server restart
```

> **⚠️ Important**: Without proper aliases, module UI assets will return 404 errors. This is the most common issue when using the Modern template.

## 🎯 How Application Bootstrap Works

Understanding the bootstrap flow is critical for working with this template:

1. **Request arrives** at `/public/index.cfm`
2. **`/public/Application.cfc`** sets critical mappings:
   ```cfml
   COLDBOX_APP_ROOT_PATH = this.mappings["/app"]
   COLDBOX_APP_MAPPING = "/app"
   COLDBOX_WEB_MAPPING = "/"
   ```
3. **ColdBox loads** config from `/app/config/ColdBox.cfc`
4. **Routes defined** in `/app/config/Router.cfc`
5. **Handlers process** requests from `/app/handlers/`

**Security Note**: `/app/Application.cfc` contains only `abort;` to prevent direct web access to application code.

## 💻 Development Workflows

### Installing Dependencies

```bash
# Install all dependencies
box install

# Install a specific module
box install cbsecurity

# Install development dependencies
box install testbox --saveDev
```

### Running the Server

```bash
# Start server (uses server.json config)
box server start

# Start with specific engine
box server start cfengine=boxlang@be

# Stop server
box server stop

# Restart server
box server restart

# Open server in browser
box server open
```

### Code Formatting

```bash
# Format all code
box run-script format

# Check formatting without changes
box run-script format:check

# Watch mode - auto-format on save
box run-script format:watch
```

### Running Tests

```bash
# Run all tests
box testbox run

# Run tests in browser
box server start
# Navigate to: http://localhost:8080/tests
```

## 🧪 Testing Patterns

Tests extend `coldbox.system.testing.BaseTestCase` with `appMapping="/app"`:

```cfml
component extends="coldbox.system.testing.BaseTestCase" appMapping="/app" {

    function beforeAll(){
        super.beforeAll();
        // Global test setup
    }

    function run(){
        describe("User Handler", function(){
            beforeEach(function(currentSpec){
                // CRITICAL: Call setup() to create fresh request context
                setup();
            });

            it("can list users", function(){
                var event = this.get("users.index");
                expect(event.getValue(name="users", private=true))
                    .toBeArray();
            });

            it("can show a user", function(){
                var event = this.get("users.show?id=1");
                expect(event.getValue(name="user", private=true))
                    .toBeStruct();
            });
        });
    }
}
```

**Key Testing Methods**:
- `this.get(event)` / `this.post(event)` - Simulate HTTP requests
- `execute(event)` - Execute event without HTTP simulation
- `event.getValue(name, default, private)` - Get from rc/prc
- `event.getHandlerResults()` - Get return value from handler

## 🐳 Docker Support

### Building Docker Images

```bash
# Build Docker container
box run-script build:docker

# Run Docker container
box run-script run:docker
```

### Using Docker Compose

We include a `docker/docker-compose.yml` stack with database support:

```bash
# Start the stack
cd docker
docker-compose up -d

# Stop the stack
docker-compose down

# View logs
docker-compose logs -f
```

## ☕ Java Dependencies

If your project relies on Java third-party dependencies, use the included Maven `pom.xml`:

```xml
<!-- Add to pom.xml -->
<dependencies>
    <dependency>
        <groupId>com.google.code.gson</groupId>
        <artifactId>gson</artifactId>
        <version>2.10.1</version>
    </dependency>
</dependencies>
```

Then download dependencies:

```bash
mvn install
```

JARs are copied to `/lib/java/` and automatically class-loaded by `Application.cfc` via `this.javaSettings.loadPaths`.

You can find Java dependencies at: <https://central.sonatype.com/>

## 🔐 Environment Configuration

### Using Environment Variables

1. Copy `.env.example` to `.env`:
   ```bash
   cp .env.example .env
   ```

2. Use `getSystemSetting()` in your config:
   ```cfml
   // In /app/config/ColdBox.cfc
   variables.coldbox = {
       appName: getSystemSetting("APPNAME", "My App")
   };

   // In your handlers/models
   variables.apiKey = getSystemSetting("API_KEY");
   ```

3. Set environment variables:
   ```bash
   # In .env file
   APPNAME=My Awesome App
   API_KEY=your-secret-key
   ```

## 💉 Dependency Injection

Use WireBox annotations for dependency injection:

```cfml
component {
    property name="userService" inject="UserService";
    property name="wirebox" inject="wirebox";
    property name="cachebox" inject="cachebox";
    property name="logbox" inject="logbox";

    function list(){
        return userService.getAll();
    }
}
```

**Common Injection Patterns**:
- `inject="coldbox"` - ColdBox controller
- `inject="wirebox"` - WireBox injector
- `inject="cachebox:default"` - Default cache
- `inject="logbox:root"` - Root logger
- `inject="coldbox:setting:settingName"` - Application setting

## 🎮 Handler Patterns

### Standard Handler Structure

```cfml
component extends="coldbox.system.EventHandler" {

    // All actions receive three arguments:
    function index(event, rc, prc){
        // rc = Request collection (FORM/URL variables)
        // prc = Private request collection (handler-to-view data)
        prc.users = userService.list();
        event.setView("users/index");
    }

    // RESTful responses
    function data(event, rc, prc){
        return [
            { "id": 1, "name": "Luis" },
            { "id": 2, "name": "Joe" }
        ];
    }

    // Relocations
    function save(event, rc, prc){
        userService.save(rc);
        relocate("users.index");
    }
}
```

## 🗺️ Routing Patterns

In `/app/config/Router.cfc`:

```cfml
component {
    function configure(){
        // Named routes
        route("/healthcheck", function(event, rc, prc){
            return "Ok!";
        });

        // RESTful resources
        resources("users");

        // API routes
        route("/api/v1/users", function(event, rc, prc){
            return { "data": userService.list() };
        });

        // Conventions-based routing (keep at end)
        route(":handler/:action?").end();
    }
}
```

## 💻 VSCode Helpers

We include VSCode configuration to enhance your development experience:

- `.vscode/settings.json` - Introspection helpers for ColdBox and TestBox 🔍
- `.vscode/tasks.json` - Tasks to run CommandBox tasks and TestBox bundles ⚡

### Custom Tasks

- `Run CommandBox Task` - Open a CommandBox task and run it 🏃‍♂️
- `Run TestBox Bundle` - Open the bundle you want to test and run it 🧪

To run tasks: Open command palette (`⇧⌘B` on Mac) and choose `Tasks: Run Build Task`

## 🎉 Welcome to ColdBox

ColdBox *Hierarchical* MVC is the de-facto enterprise-level HMVC framework for CFML developers. It's professionally backed, conventions-based, modular, highly extensible, and productive.

### Key Features

- 📐 [Conventions instead of configuration](https://coldbox.ortusbooks.com/getting-started/conventions)
- 🛣️ [Modern URL routing](https://coldbox.ortusbooks.com/the-basics/routing)
- 🚀 [RESTFul APIs](https://coldbox.ortusbooks.com/the-basics/event-handlers/rendering-data)
- 🏗️ [Hierarchical MVC using ColdBox Modules](https://coldbox.ortusbooks.com/hmvc/modules)
- 🎯 [Event-driven programming](https://coldbox.ortusbooks.com/digging-deeper/interceptors)
- ⚡ [Async and Parallel programming](https://coldbox.ortusbooks.com/digging-deeper/promises-async-programming)
- 🧪 [Integration & Unit Testing](https://coldbox.ortusbooks.com/testing/testing-coldbox-applications)
- 💉 [Dependency injection](https://wirebox.ortusbooks.com)
- 🗄️ [Caching engine and API](https://cachebox.ortusbooks.com)
- 📝 [Logging engine](https://logbox.ortusbooks.com)
- 🌐 [Extensive eco-system](https://forgebox.io)

## 📚 Learning ColdBox

ColdBox has the most extensive [documentation](https://coldbox.ortusbooks.com) of all modern CFML frameworks. 📖

If you don't like reading, try our video learning platform: [CFCasts](https://www.cfcasts.com) 🎥

## 💰 ColdBox Sponsors

ColdBox is a professional open-source project funded by the [community](https://patreon.com/ortussolutions) and [Ortus Solutions, Corp](https://www.ortussolutions.com).

Become a sponsor: <https://patreon.com/ortussolutions> ❤️

## 🔗 Important Links

- **Documentation**: <https://coldbox.ortusbooks.com>
- **Source Code**: <https://github.com/coldbox-templates/modern>
- **Bug Tracker**: <https://github.com/ColdBox/coldbox-platform/issues>
- **ForgeBox**: <https://forgebox.io/view/coldbox>
- **Support Forum**: <https://community.ortussolutions.com>

## 📄 License

Apache License, Version 2.0.

## 🚨 Common Issues & Solutions

### Module UI Assets Not Loading (404 errors)

**Problem**: Installed a module with web UI (like `cbdebugger`) but getting 404 errors.

**Solution**: Add a CommandBox alias in `server.json`:

```json
"aliases": {
    "/cbdebugger": "./lib/modules/cbdebugger"
}
```

Then restart: `box server restart`

### Tests Can't Find Handlers/Models

**Problem**: Tests fail with "Handler not found" or "Model not found".

**Solution**: Ensure your test component has `appMapping="/app"`:

```cfml
component extends="coldbox.system.testing.BaseTestCase" appMapping="/app" {
```

### Direct Access to /app/ Returns 404

**Problem**: Trying to access `/app/handlers/Main.cfc` directly.

**Solution**: This is by design! Application code in `/app` is NOT web-accessible for security. All requests must go through `/public/index.cfm`.

## ⚙️ Engine Compatibility

This template is designed for:

- ✅ **Adobe ColdFusion 2021+** - Fully supported
- ✅ **BoxLang 1.0+** - Fully supported
- ❌ **Lucee** - Not supported on this template

To specify your engine in `server.json`:

```json
"app": {
    "cfengine": "boxlang@be"     // For BoxLang
    // OR
    "cfengine": "adobe@2023"     // For Adobe ColdFusion
}
```

## 🔄 Migrating from Default Template

If you're migrating from the default ColdBox template to Modern:

1. **Move application code**: Copy `/handlers`, `/models`, `/views`, etc. to `/app/`
2. **Update Application.cfc**: Use the Modern template's `/public/Application.cfc` as reference
3. **Configure aliases**: Add necessary aliases to `server.json` for modules
4. **Update tests**: Ensure `appMapping="/app"` in test components
5. **Move public assets**: Only CSS, JS, images go in `/public/includes/`

## 🤝 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](.github/CONTRIBUTING.md) for guidelines.

----

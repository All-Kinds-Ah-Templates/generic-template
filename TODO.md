# TODO

spontaneous
 - if I have to look into my own thought process more often than interact with the outside

1. CLI todo list manager
  - CLI
    - ~/$XDG_CONFIG_DIR/todo/config.toml
  - HTTP REST API
    - JSON response
  - Websockets API
  - GraphQL API
  - Web UI
    - modern template
      - single page app
      - rspress.dev
    - modern css
      - tailwind, postcss, svelte
    - modern js
      - qwik / vite.js / vue.js
      - NextUI and Next.js, lit, modern.js, astro, alpine.js
    - modern db
      - offline-first
        - pocketbase, rxdb, rqlite
      - archival bigdata
        - duckdb
      - caching cluster
        - dragonfly
    - modern compiler
      - rspack
      - WASM
  - OpenAPI web UI
  - metrics
    - Prometheus: /metrics
    - ping: /health
  - Authentication
    - API key
    - OAuth2
    - OpenID / SAML2
  - task lists and sub-tasks
    - name
    - description
    - color
    - tags
    - assignment
    - time log and estimate
    - milestones
    - fixes: # issue number
  - issue queue
    - state: open, closed
    - type: bug, feature request, documentation, duplicate, help wanted, question, invalid, won't fix
    - templates
  - commit integration
    - commit todo changes to git
    - branch per task
    - parse and remove time log from commit message
    - show commits in branch
    - close task when branch merged
  - 3rd party integrations
    - GitHub, GitLab, etc.
    - new todo item, task list, and issue queue protocol
  - Private and Groups
  - Docker
2. CLI kanban tui
3. Software Bill of Materials (SBOM)
  - sbom.json
  - SPDX
  - CycloneDX
  - [Dependency Tracker](https://github.com/DependencyTrack/dependency-track)
4. Point to whitepaper in docs
5. Support dev / prod mode
  - dev mode
    - website
      - doctave
      - mdbook
      - simple web server
    - chat
      - IRC chat server
      - Mattermost server
    - issue queue
      - Gitea server
    - testing
      - Woodpecker CI server
    - link to landing page and all services inside whitepaper.pdf
6. Landing page
  - social
    - youtube
    - instagram
    - chat
      - matrix
      - xmpp
      - irc
      - mastodon
    - game servers
  - blogs
    - general
    - release notes
  - documentation
    - user guides
    - knowledge base / wiki
  - community edition
    - downloads
      - debian / ubuntu self-hosted PPA (.deb)
      - alpine (.apk)
      - redhat (.rpm)
      - mac osx (.dmg)
      - freebsd (.pkg)
    - developers
      - live playground
        - live sandbox
        - openapi
          - redoc / swagger
          - docapella
      - documentation
        - man pages
        - technical manual
      - software repository
        - rgit
        - github / gitea / forgejo
    - about
      - the team
    - privacy
    - security
    - contact
      - issue queue
      - email
  - lab
    - collaboration suite
      - continous integration
      - project management
      - video conferencing
      - voip / sip phones
        - voicemail
      - chatroom
      - document sharing
      - knowledge base
      - code repository
      - email
      - calenders
      - meeting and room booking
    - marketing
      - software projects
      - programming languages
      - client showcase
      - testimonials
      - pricing
  - main engineering
    - status page
    - books
      - company culture
      - first 30 days on the job
    - directory
  - company
    - Contact
        Help Desk
    - Businesses & Products
        Businesses & Products
        Technology & Services
        New Initiatives
    - About Us
        About Acme Inc.
        Acme's Purpose & Values
        Message from the CEO
        News Releases
        Acme Corporate Blog
        Creative Entertainment Vision
        Brand
        History
        Corporate Data
        Affiliated Companies
    - Technology
        Technology
        Chief Digital Officer Message
        Tech Stories
        Programs & Events
        Corporate Distinguished Engineer
        Publications
    - Sustainability
        Sustainability
        Vision of Founder and
        Basic Policy for Sustainability Initiatives
        Sustainability Report
        Environment
        Social Contribution
        Diversity
        Accessibility
        Response to COVID-19
    - Around the globe / Citizenship
        Human rights
        Safety Center
        Supplier responsibility
        Transparency Center
        Transparency Report
    - Design
        Design
        About
        Design Stories
        Interviews & Lectures
        Gallery
        News
    - Employees / Careers
        Employees
        Careers
    - Investor Relations
        Investor Relations
        IR News
        IR Library
        Corporate Report
        Earning Announcement
        Corporate Bonds & Ratings

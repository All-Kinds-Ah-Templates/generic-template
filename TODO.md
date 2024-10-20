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

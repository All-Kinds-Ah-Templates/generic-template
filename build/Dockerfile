# Chainguard Wolfi OS
FROM cgr.dev/chainguard/wolfi-base:latest

WORKDIR /app

COPY CMakeLists.txt .
COPY Makefile.local.toml .
COPY Makefile.plugin.toml .
COPY Makefile.runner.toml .
COPY Makefile.toml .
COPY local.just .
COPY pipelight.yaml .
COPY run-framework.fish .
COPY run-framework.just.j2 .

RUN apk update && \
    apk --no-cache add git cosign curl xh fish tmux starship

SHELL ["/usr/bin/fish", "-c"]

# Create fish config directory
RUN mkdir -p ~/.config/fish/conf.d

# Add starship config snippet
RUN echo 'if status is-interactive'            >  ~/.config/fish/conf.d/starship.fish \
  ; echo '  # Starship prompt'                 >> ~/.config/fish/conf.d/starship.fish \
  ; echo '  source (starship init fish --print-full-init | psub)' \
                                               >> ~/.config/fish/conf.d/starship.fish \
  ; echo 'end'                                 >> ~/.config/fish/conf.d/starship.fish

CMD ["/usr/bin/fish"]

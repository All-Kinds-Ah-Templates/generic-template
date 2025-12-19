# Chainguard Wolfi OS
FROM cgr.dev/chainguard/wolfi-base:latest

RUN apk update && \
    apk --no-cache add cosign xh wget fish tmux starship parallel

RUN mkdir -p /usr/local/bin

RUN wget --output-document /usr/local/bin/jaq https://github.com/01mf02/jaq/releases/latest/download/jaq-x86_64-unknown-linux-musl && \
    chmod +x /usr/local/bin/jaq && \
    ln -s /usr/local/bin/jaq /usr/local/bin/jq

RUN xh --body https://api.github.com/repos/BLAKE3-team/BLAKE3/releases/latest \
    #User-Agent:"DockerBuildScript/1.0 (xh; Wolfi Linux)" Accept:"application/vnd.github+json" \
    | jq -r '.assets[] | select(.name | test("b3sum_linux_x64_bin$")) | .browser_download_url'

RUN LATEST_B3SUM=$( \
    xh --body https://api.github.com/repos/BLAKE3-team/BLAKE3/releases/latest \
    User-Agent:"xh" Accept:"application/vnd.github+json" \
    | jq -r '.assets[] | select(.name | test("b3sum_linux_x64_bin$")) | .browser_download_url' \
    ) && \
    xh --follow --output /usr/local/bin/b3sum "$LATEST_B3SUM" && \
    chmod +x /usr/local/bin/b3sum

RUN LATEST_MINISIGN=$( \
    xh --body https://api.github.com/repos/jedisct1/minisign/releases/latest \
    User-Agent:"xh" Accept:"application/vnd.github+json" \
    | jq -r '.assets[] | select(.name | test("linux-x86_64$")) | .browser_download_url' \
    ) && \
    xh --follow --output /usr/local/bin/minisign "$LATEST_MINISIGN" && \
    chmod +x /usr/local/bin/minisign

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
COPY entrypoint.fish .

SHELL ["/usr/bin/fish", "-c"]

# Create fish config directory
RUN mkdir -p ~/.config/fish/conf.d

# Add starship config snippet
RUN echo 'if status is-interactive'            >  ~/.config/fish/conf.d/starship.fish \
  ; echo '  # Starship prompt'                 >> ~/.config/fish/conf.d/starship.fish \
  ; echo '  source (starship init fish --print-full-init | psub)' \
                                               >> ~/.config/fish/conf.d/starship.fish \
  ; echo 'end'                                 >> ~/.config/fish/conf.d/starship.fish

RUN chmod +x run-framework.fish

ENTRYPOINT ["/usr/bin/fish", "/app/entrypoint.fish"]
CMD []

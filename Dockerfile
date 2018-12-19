FROM docker:stable

LABEL "name"="Docker CLI Action"
LABEL "maintainer"="GitHub Actions <devel@keboola.com>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="GitHub Action for Docker"
LABEL "com.github.actions.description"="Pushes image to Developer Portal ECR"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="green"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
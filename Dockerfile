FROM sonarsource/sonar-scanner-cli:latest

LABEL "com.github.actions.name"="Github PR decoration using SonarQube Scanner"
LABEL "com.github.actions.description"="Decorate your Github pull request with data from sonarqube."
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="green"

# LABEL version="0.0.2"
# LABEL repository="https://github.com/kitabisa/sonarqube-action"
# LABEL homepage="https://kitabisa.github.io"
# LABEL maintainer="dwisiswant0"

RUN npm config set unsafe-perm true && \
  npm install --silent --save-dev -g typescript@3.5.2 && \
  npm config set unsafe-perm false && \
  apk add --no-cache ca-certificates jq

ENV NODE_PATH "/usr/lib/node_modules/"

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
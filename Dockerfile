FROM php:8.1-cli-alpine

LABEL "repository" = "https://github.com/jeffersonsimaogoncalves/action-deployer-php"
LABEL "homepage" = "https://github.com/jeffersonsimaogoncalves/action-deployer-php"

LABEL "com.github.actions.name"="Action - Deployer php"
LABEL "com.github.actions.description"="Use your Deployer PHP script with your github action workflow."
LABEL "com.github.actions.icon"="server"
LABEL "com.github.actions.color"="yellow"

ENV DEPLOYER_VERSION=7.1.4

RUN apk update --no-cache \
    && apk add --no-cache \
    bash \
    openssh-client \
    rsync

# Change default shell to bash (needed for conveniently adding an ssh key)
RUN sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

RUN curl -L https://github.com/deployphp/deployer/releases/download/v$DEPLOYER_VERSION/deployer.phar > /usr/local/bin/deployer \
    && chmod +x /usr/local/bin/deployer

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

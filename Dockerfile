FROM node:alpine

RUN npm install -g tiddlywiki

# Setup wiki volume
VOLUME /var/lib/tiddlywiki
WORKDIR /var/lib/tiddlywiki

# Add init-and-run script
ADD tiddlyweb_host /tiddlyweb_host_template
ADD init-and-run-wiki /usr/local/bin/init-and-run-wiki

RUN groupadd -g 999 appuser && \
    useradd -r -u 999 -g appuser appuser
USER appuser

# Meta
CMD ["/usr/local/bin/init-and-run-wiki"]
EXPOSE 8080

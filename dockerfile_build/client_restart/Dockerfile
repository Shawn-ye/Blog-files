FROM shawnye90/ssbasic

RUN apk update && apk add curl
COPY start.sh /home
RUN chmod +x /home/start.sh

CMD ["/bin/sh", "-c", "sh /home/start.sh"]

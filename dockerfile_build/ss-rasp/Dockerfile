FROM shawnye90/ss-raspberry

RUN rm /home/start.sh
COPY start.sh /home
COPY fuck.sh /fuck.sh
RUN chmod +x /home/start.sh
RUN chmod +x /fuck.sh

CMD ["/bin/sh", "-c", "sh /home/start.sh"]

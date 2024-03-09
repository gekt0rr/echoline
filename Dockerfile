FROM ubuntu:latest
LABEL maintainer="gekt0rr"

COPY echoline.sh /echoline.sh
RUN chmod +x /echoline.sh

ENV TIMER_SECONDS "1"
ENV MESSAGE "ON AIR"

CMD /echoline.sh -t "$TIMER_SECONDS" -m "$MESSAGE"

From python:3.8
CMD mkdir app
COPY ./ app/
WORKDIR /app
RUN pip3 install -r requirements.txt
RUN chmod a+x script.sh
ENTRYPOINT ["/bin/bash", "script.sh"]
EXPOSE 5000

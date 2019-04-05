FROM continuumio/miniconda3

# Install ssh-server and set root password
ENV SSH_PASSWD "root:Docker!"
RUN apt-get update \
        && apt-get install -y --no-install-recommends dialog \
        && apt-get update \
    	&& apt-get install -y --no-install-recommends openssh-server \
	    && echo "$SSH_PASSWD" | chpasswd
COPY sshd_config /etc/ssh/


RUN mkdir /webapp
WORKDIR /webapp
ADD requirements.txt /webapp/
RUN pip install -r requirements.txt
RUN pip install gunicorn
ADD . /webapp/


EXPOSE 5000
ENTRYPOINT ["./venv/bin/gunicorn", "-b", "0.0.0.0:5000", "-w", "2", "--access-logfile", "-", "--error-logfile", "-" , "restapi:create_app()"]

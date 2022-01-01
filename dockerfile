#build it:
#docker build -t domainhunter:1.0 .
#run it:
#docker run -it domainhunter:1.0 [args]

FROM ubuntu:xenial-20210416

RUN apt-get update \
	&& apt-get install python3-pip -y\
	&& apt-get install tesseract-ocr -y\
	&& apt-get install python3-pil -y

ADD domainhunter.py /
ADD requirements.txt /

RUN pip3 install -r requirements.txt 

ENTRYPOINT [ "python3", "./domainhunter.py" ]

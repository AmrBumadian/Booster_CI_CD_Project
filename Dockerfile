FROM ubuntu
RUN apt-get update -qq

RUN apt-get install -y build-essential python3.6 python3-pip

#Copy the source code of this app to the image
COPY . /simpleApp

#Adjust Work Directory
WORKDIR /simpleApp

#Install required packages
RUN pip3 install -r requirements.txt

#Make migration for databaase
RUN python3 manage.py makemigrations

#Apply migrations
RUN python3 manage.py migrate 

EXPOSE 9000

#Start Server
CMD [ "python3","manage.py","runserver","0.0.0.0:9000" ]

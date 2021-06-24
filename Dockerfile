# This file is a template, and might need editing before it works on your project.
FROM python:3.9.5

# Create app directory
WORKDIR /app

EXPOSE 8060
EXPOSE 80
EXPOSE 443

# Install dependencies for drivers, Connections
RUN apt-get update && apt-get install -y apt-utils && apt-get install -y curl
RUN apt-get install build-essential
RUN apt-get install -y unixodbc-dev
RUN apt-get install -y python3-dev
RUN apt-get install -y libgirepository1.0-dev
RUN apt-get install -y -f gstreamer-1.0
RUN apt-get install -y python3-gst-1.0
RUN apt-get install -y libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev
RUN pip3 install --user pyodbc
RUN pip install configparser
RUN pip3 install mysql-connector
RUN pip install mysqlclient
RUN pip install --upgrade pip
RUN pip3 install playsound
RUN apt-get update
RUN apt-get install -y wget gpg apt-transport-https ca-certificates
RUN cd ~
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
RUN mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
RUN wget -q https://packages.microsoft.com/config/debian/9/prod.list
RUN mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
RUN chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
RUN chown root:root /etc/apt/sources.list.d/microsoft-prod.list
RUN apt-get update
RUN ACCEPT_EULA=Y apt install -y msodbcsql17

# Install Openssl for connection issue
RUN apt-get update -yqq \
    && apt-get install -y --no-install-recommends openssl \ 
    && sed -i 's,^\(MinProtocol[ ]*=\).*,\1'TLSv1.0',g' /etc/ssl/openssl.cnf \
    && sed -i 's,^\(CipherString[ ]*=\).*,\1'DEFAULT@SECLEVEL=1',g' /etc/ssl/openssl.cnf\
    && rm -rf /var/lib/apt/lists/*

# Install requirment file
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY src/ .

ENV DASH_DEBUG_MODE True

# To Run the Project
 CMD [ "python", "audiodash.py" ]

FROM ubuntu:latest
MAINTAINER Ray ALez <raymestalez@gmail.com>

# Setup environment variables containing paths
ENV HOMEDIR=/home
ENV PROJECT_DIR=/home/vertex
ENV CLIENT_DIR=/home/vertex/client
ENV SERVER_DIR=/home/vertex/server

# Install basic apps
RUN apt-get update && apt-get install -y emacs curl

# Install node 7
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs 
	    	    
# Copy project files into /home/vertex folder.
RUN mkdir -p $PROJECT_DIR
WORKDIR $PROJECT_DIR
COPY . .

# Install dependencies
WORKDIR $SERVER_DIR
RUN npm install		
WORKDIR $CLIENT_DIR
RUN npm install		
    
# Port to expose
EXPOSE 3000

CMD [ "npm", "start" ]

	

	

# ENV NODE_ENV production

# EXPOSE 8000
# CMD ["npm", "run", "bs"]


#pull the latest image of alpine "Linux" and start with it as the first Layer
FROM alpine

#log the maintainer
LABEL maintainer="ouachani.abdelkader@gmail.com"

#execute command and create Layer
RUN apk add --update nodejs-npm

#copy the content of the current directory into /src , copy code into image as a new Layer
COPY . /nodejs

#setting up the working directory, we won't need a Layer for that it't just a Metadata
WORKDIR /nodejs

#RUN npm config set proxy https://github.com/sass/node-sass/releases/download/v4.10.0/linux_musl-x64-57_binding.node

#install the package npm, and create a new Layer
RUN npm install 

#the app listens on port 8080
EXPOSE 8080

#run the app, the default app for image/container
ENTRYPOINT ["node", "./app/app.js"]

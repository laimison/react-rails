#!/bin/bash

if ! (echo $EMAIL_ADDRESS | grep -q @ && echo $EMAIL_PASSWORD | grep -q '[a-zA-Z0-9]')
then
  echo "Warning: You have not specified 'export EMAIL_ADDRESS' and 'export EMAIL_PASSWORD' environment variables for backend mailer so emails will not work"
  sleep 8
fi

rails s

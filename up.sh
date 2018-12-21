#!/bin/bash

cd backend && rails s &
rails_pid=$!

# The trap statement tells the script to run received_signal() on signals 1, 2 (CTRL+C), 3 or 6.
trap received_signal 1 2 3 6

received_signal()
{
  echo "Caught Signal ... Shutting down ... Please wait for 4 seconds."
  kill $rails_pid; sleep 3; kill -5 $pid 2>/dev/null
  echo "Exiting."
  exit 1
}

cd frontend && yarn start || npm start

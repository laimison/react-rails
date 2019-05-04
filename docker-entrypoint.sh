# Decide to create initial app or use existing app
ls /data/frontend/package.json 2>/dev/null || mv /root/initial/frontend/{.,}* /data/frontend/
ls /data/backend/Gemfile 2>/dev/null || mv /root/initial/backend/{.,}* /data/backend/

/bin/rm -rf /root/initial/frontend
/bin/rm -rf /root/initial/backend

# Mailhog
cd /data/mailhog && ./MailHog_linux_amd64 &

# React
cd /data/frontend && npm install && npm start &

# Rails
cd /data/backend && bundle install && rails s -p 4000 -b 0.0.0.0 &

tail -F /dev/null

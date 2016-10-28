FROM postgres
# add backup scripts
ADD ./postgres/backup.sh /usr/local/bin/backup
ADD ./postgres/restore.sh /usr/local/bin/restore
ADD ./postgres/list-backups.sh /usr/local/bin/list-backups
ADD ./postgres/shell.sh /usr/local/bin/shell

# make them executable
RUN chmod +x /usr/local/bin/restore
RUN chmod +x /usr/local/bin/list-backups
RUN chmod +x /usr/local/bin/backup
RUN chmod +x /usr/local/bin/shell

# add init script
ADD ./postgres/init.sh /docker-entrypoint-initdb.d/

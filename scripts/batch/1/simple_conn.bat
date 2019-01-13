@echo off

echo open sftp.pbm-draftbox.fr>simple_conn.ftp
echo pbmdraftsp-be>>simple_conn.ftp
echo 8SOMT1LMt3>>simple_conn.ftp

ftp -s:simple_conn.ftp
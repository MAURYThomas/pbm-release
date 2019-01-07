@echo off

echo open sftp.pbm-draftbox.fr>extra.ftp
echo pbmdraftsp-be>>extra.ftp
echo 8SOMT1LMt3>>extra.ftp

echo put %1>>extra.ftp

ftp -s:extra.ftp
# Credentials
$password = ConvertTo-SecureString  '8SOMT1LMt3' -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ('pbmdraftsp-be', $Password)

# Path
$localPath = "C:\Users\thomas.maury\Documents\PBM\pbm-release\FTP\"
$filePath = "Powershell - TestFTP.txt"

# Hostname
$hostname = 'sftp.pbm-draftbox.fr'

# Etablissement de la connection
##$session = New-SFTPSession -ConputerName $hostname -Credential $cred 

ftp.Connect($ftpServer,$cred)
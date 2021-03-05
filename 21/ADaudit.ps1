#ad user
Get-ADUser -Filter * -Properties * | select Name,whenCreated,whenChanged,LastlogonDate > admon.txt

#localuser
Get-LocalUser -Filter * -Property * | select Name,whenCreated,whenChanged,LastlogonDate > lumon.txt


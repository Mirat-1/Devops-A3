#!/bin/bash
read -p "Please insert the url: " url

certificate_file=$(mktemp)
echo -n | openssl s_client -servername "$url" -connect "$url":443 2>/dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > $certificate_file
date=$(openssl x509 -in $certificate_file -enddate -noout | sed "s/.*=\(.*\)/\1/")
date_s=$(date -d "${date}" +%s)
now_s=$(date -d now +%s)
date_diff=$(( (date_s - now_s) / 86400 ))

if [[ "$date_diff" -gt "1" ]]; then

echo "Certificate expires in: $date_diff days"

else
    echo "$url does not use SSL Certificates"

fi

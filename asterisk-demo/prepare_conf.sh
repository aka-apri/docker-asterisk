#!/bin/bash

# rm conf/*.conf

cat conf_template/pjsip_transport_template.conf > conf/pjsip_transport.conf

cat conf_template/pjsip_endpoint_template.conf > conf/pjsip_endpoint_test.conf

numbers=$(cat conf_template/endpoint_list.txt)

for number in $numbers
do
    [[ ! -z "$number" ]] && sed "s/{XXXXX}/$number/" conf_template/enpoint_record.conf >> conf/pjsip_endpoint_test.conf
done

cat conf_template/extensions_local_template.conf > conf/extensions_test.conf

for number in $numbers
do
    [[ ! -z "$number" ]] && sed "s/{XXXXX}/$number/" conf_template/extension_record.conf >> conf/extensions_test.conf
done

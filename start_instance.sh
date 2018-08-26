#!/bin/bash

update_hosts()
{
    sudo /home/arm/update_hosts.sh
    rm /home/arm/update_hosts.sh
}

run_supervisord()
{
   /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf 2>&1 1>/tmp/supervisord.log
}

run_pelion_bridge()
{
   cd /home/arm
   su -l arm -s /bin/bash -c "/home/arm/restart.sh &"
}

run_properties_editor()
{
  cd /home/arm/properties-editor
  su -l arm -s /bin/bash -c "/home/arm/properties-editor/runPropertiesEditor.sh 2>&1 1> /tmp/properties-editor.log &"
}

enable_long_polling() {
   LONG_POLL="$2"
   if [ "${LONG_POLL}" = "use-long-polling" ]; then
        DIR="pelion-bridge/conf"
        FILE="service.properties"
        cd /home/arm
        sed -e "s/mds_enable_long_poll=false/mds_enable_long_poll=true/g" ${DIR}/${FILE} 2>&1 1> ${DIR}/${FILE}.new
        mv ${DIR}/${FILE} ${DIR}/${FILE}.poll
        mv ${DIR}/${FILE}.new ${DIR}/${FILE}
        chown arm.arm ${DIR}/${FILE}
   fi
}

set_mdc_api_token() {
   API_TOKEN="$2"
   if [ "$2" = "use-long-polling" ]; then
        API_TOKEN="$3"
   fi
   if [ "${API_TOKEN}X" != "X" ]; then
        DIR="pelion-bridge/conf"
        FILE="service.properties"
        cd /home/arm
        sed -e "s/mbed_pelion_api_token_goes_here/${API_TOKEN}/g" ${DIR}/${FILE} 2>&1 1> ${DIR}/${FILE}.new
        mv ${DIR}/${FILE} ${DIR}/${FILE}.mdc_api_token
        mv ${DIR}/${FILE}.new ${DIR}/${FILE}
        chown arm.arm ${DIR}/${FILE}
   fi
}

set_iothub_hubname() {
   HUB_NAME="$3"
   if [ "$2" = "use-long-polling" ]; then
        HUB_NAME="$4"
   fi
   if [ "${HUB_NAME}X" != "X" ]; then
        DIR="pelion-bridge/conf"
        FILE="service.properties"
        cd /home/arm
        sed -e "s/Azure_IoTHub_Name_Goes_Here/${HUB_NAME}/g" ${DIR}/${FILE} 2>&1 1> ${DIR}/${FILE}.new
        mv ${DIR}/${FILE} ${DIR}/${FILE}.iothub_hubname
        mv ${DIR}/${FILE}.new ${DIR}/${FILE}
        chown arm.arm ${DIR}/${FILE}
   fi
}

set_iothub_sas_token() {
   SAS_TOKEN="$4 $5"
   if [ "$2" = "use-long-polling" ]; then
        SAS_TOKEN="$5 $6"
   fi
   if [ "${SAS_TOKEN}" = " " ]; then
        SAS_TOKEN=""
   fi
   if [ "${SAS_TOKEN}X" != "X" ]; then
        DIR="pelion-bridge/conf"
        FILE="service.properties"
        cd /home/arm
        sed -e "s/Azure_IoTHub_OWNER_SAS_Token_Goes_Here/${SAS_TOKEN}/g" ${DIR}/${FILE} 2>&1 1> ${DIR}/${FILE}.new
        mv ${DIR}/${FILE} ${DIR}/${FILE}.iothub_sas_token
        mv ${DIR}/${FILE}.new ${DIR}/${FILE}
        chown arm.arm ${DIR}/${FILE}
   fi
}

set_perms() {
  cd /home/arm
  chown -R arm.arm .
}

main() 
{
   update_hosts
   enable_long_polling $*
   set_mdc_api_token $*
   set_iothub_hubname $*
   set_iothub_sas_token $*
   set_perms $*
   run_properties_editor
   run_pelion_bridge
   run_supervisord
}

main $*

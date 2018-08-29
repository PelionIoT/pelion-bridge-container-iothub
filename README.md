arm PELION Device Shadow bridge for Microsoft IoTHub                  
  
08/28/2018: updated bridge - Initial bridge health statistics 

08/28/2018: updated bridge - IoTHub support for connection strings, Watson fixes

08/27/2018: updated bridge - SLF4J integration, scaling fixes in shadow discovery, bug fixes.

08/27/2018: updated bridge - more bug fixes for partial configuration sanity

08/26/2018: updated bridge - minor fixes. Final renaming of bridge runtime for pelion

08/26/2018: updated bridge - fixes for proper reset recovery

Container Bridge Instance Installation:

1). Clone this repo into a Linux instance that supports docker images

2). cd into the cloned repo and run: ./run-reload-bridge.sh

Once the container instance is live, you must configure the bridge and bind it between your mbed Pelion account and your IoTHub Account in Azure. 

1). Please go to your Azure dashboard and create an IoTHub instance. Note your IoTHub name.

2). Please create a SAS Token for your IoTHub Owner ... Make the token good for awhile... 
    Reference: https://azure.microsoft.com/en-us/documentation/articles/iot-hub-sas-tokens/

3). Next go to https://os.mbed.com and create your mbed Account. You can then request a Pelion developer account using the same credentials at https://portal.us-east-1.mbedcloud.com

4). Once your Pelion account is created, you need to "Access Keys" to create a Pelion API Key/Token. Record the Token Value

Now that you have your:

    - IoTHub Name

    - IoTHub Owner SAS Token generated for a suitable length of time

    - Pelion API Key/Token generated

Go to:  https://[[your containers public IP address]]:8234

    - username: "admin" (no quotes)

    - password: "admin" (no quotes)

Enter each of IoTHub name, SAS Token, and Pelion API Token

    - Please press "SAVE" after *each* is entered... 

    - After all 3 are entered and saved, press "RESTART"

Your Pelion bridge should now be configured and operational. 

Bridge source (Apache 2.0 licensed - Enjoy!): https://github.com/ARMmbed/pelion-bridge.git

Copyright 2017. ARM Ltd. All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. 

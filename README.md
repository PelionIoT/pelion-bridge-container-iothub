arm PELION Device Shadow bridge for Microsoft IoTHub                  
  
01/17/2020: updated bridge - internal dependencies updated

11/11/2019: updated bridge - internal dependencies updated

10/31/2019: updated bridge - minor udpates and fixes

08/29/2019: updated bridge - minor fixes/enhancements

08/23/2019: updated bridge - minor update for mqtt

08/20/2019: updated bridge - added key Pelion device attribute retrieval prior to twin creation

08/13/2019: updated bridge - webhook fixes

08/12/2019: updated bridge - numerous bugfixes and initial websocket notification callback support

07/25/2019: updated bridge - additional fixes and updates

07/23/2019: updated bridge - PUT content type fixes, TypeDecoder and GC enhancements

Container Bridge Instance Installation:

1). Clone this repo into a Linux instance that supports docker images

2). cd into the cloned repo and run: ./run-reload-bridge.sh

Once the container instance is live, you must configure the bridge and bind it between your mbed Pelion account and your IoTHub Account in Azure. 

1). Please go to your Azure dashboard and create an IoTHub instance.

2). From your IoTHub dashboard in Azure, copy to your clipboard your IoTHub's "iothubowner" primary key connection string. Record the connection string.

3). Next go to https://os.mbed.com and create your mbed Account. You can then request a Pelion developer account using the same credentials at https://portal.us-east-1.mbedcloud.com

4). Once your Pelion account is created, you need to "Access Keys" to create a Pelion API Key/Token. Record the Token Value

Now that you have your:

    - IoTHub "iothubowner" primary key connection string

    - Pelion API Key/Token generated

Go to:  https://[[your containers public IP address]]:8234

    - username: "admin" (no quotes)

    - password: "admin" (no quotes)

Enter both your IoTHub "iothubowner" connection string and the Pelion API Token

    - Please press "SAVE" after *each* is entered... 

    - After both are entered and saved, press "RESTART"

Your Pelion bridge should now be configured and operational. 

Bridge source (Apache 2.0 licensed - Enjoy!): https://github.com/ARMmbed/pelion-bridge.git

Copyright 2018. ARM Ltd. All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. 

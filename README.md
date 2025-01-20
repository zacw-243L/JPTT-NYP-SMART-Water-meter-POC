# JPTT-NYP SMART Water meter POC
Firstly this project works with a [Kerlink WirnetTM iFemtoCell-evolution LoRaWAN® Indoor Gateway for the Internet of Things](https://wikikerlink.fr/wirnet-productline/lib/exe/fetch.php?media=documentation:commercial_leaflet_ifemtocell-evolution_2.9.pdf) and its associated firmware of [KerOS 6](https://keros.docs.kerlink.com/) and [KerOS 5](https://wikikerlink.fr/wirnet-productline/doku.php?id=wiki:quickstart:quickstart_ifevo).
<br>
The other device that you will be working with is a [AIS01-LB LoRaWAN AI Image End Node](https://www.dropbox.com/scl/fo/cbhhihqz5pknkdnkqoze7/AKYgsyGJRknqMeUeeOHVLyE?dl=0&e=1&preview=Datasheet_AIS01-xB+%26+AIS01-xS_AI+Image+End+Node.pdf&rlkey=eq9oz658wa7xck0ozov8cai6o&st=bgbipr23). 
<br>
The AIS01-LB has a camera and AI processor in the probe. It can take photos, analyze the photos to get digital reading and send the info to the IoT server via LoRaWAN Network.<br>
The AIS01-LB is pre-trained to support image recognition of water, gas, and power meters. It can be trained to support more image recognition for different applications.<br>
The AIS01-LB can send the digital reading after recognized and it can also send the original photo via LoRaWAN as well.<br>
The AIS01-LB is fully compatible with LoRaWAN v1.0.3 protocol, it can work with standard LoRaWAN gateway.

## Things that have been done
   1. Kerlink WirnetTM iFemtoCell-evolution LoRaWAN® Indoor Gateway for the Internet of Things has been upgraded to KerOS 6.<br>
      This means that KerOS 5 is deprecated and should not used. 
      ### How to login to the Kerlink LoRaWAN® Indoor Gateway using the WebUI

      1. Web interface can be reached using gateway hostname or from a local fixed IP address.
      2. Wirnet™ gateways hostnames are deduced from their board ID, with `XXXXXX` replaced by the six hexadecimal digits from the serial number (Board_ID or EUI):<br>
      <br>


      | Gateway model                   | URL template                      |
      |---------------------------------|-----------------------------------|
      | Wirnet™ iFemtoCell              | https://klk-wifc-XXXXXX.local     |
      | Wirnet™ iStation                | https://klk-wiis-XXXXXX.local     |
      | Wirnet™ iFemtoCell-evolution    | https://klk-fevo-XXXXXX.local     |
      | Wirnet™ iZeptoCell Ethernet     | https://klk-zeth-XXXXXX.local     |
      | Wirnet™ iZeptoCell Cellular     | https://klk-zcel-XXXXXX.local     |



      so for the iFemtoCell-evolution LoRaWAN® Indoor Gateway you should be using `https://klk-fevo-040663.local` or `https://klk-fevo-040663/` in this case as the Gateway's EUI is `7076FF0066040663`. <br>

      If the above dose not work, try using local or direct connection to the gateway using a USB C cable. you may access the local interface with `https://192.168.120.1/`<br>
   
      You should see this page once the links load.

      ![image](https://github.com/user-attachments/assets/b4acdc18-4c87-46e2-8248-5f221dd280e3)

      The Username and Password are `admin` and `%mkZhU305la*` respectively.

      ![image](https://github.com/user-attachments/assets/b237a836-31c8-46ab-8525-36a7c0266e4f)

      On successful login, you should see the above image.
      
   2. SSH Key has already been provided to the Kerlink WirnetTM iFemtoCell-evolution LoRaWAN® Indoor Gateway.<br>

      All you have to do is to install the files from [SSH Key folder](https://github.com/zacw-243L/JPTT-NYP-SMART-Water-meter-POC/tree/main/SSH%20Key) into `C:\Users\<username>\.ssh`. <br>

      it should look something like the below
      
      ![image](https://github.com/user-attachments/assets/e09494f7-3c5d-4f94-ad7a-a144e1abf49c)

      Then you download the .bat file from [One Click Sign in .bat file](https://github.com/zacw-243L/JPTT-NYP-SMART-Water-meter-POC/tree/main/One%20Click%20Sign%20in%20.bat%20file) into your PC.<br>
      
      Take note if the IP address of the Kerlink WirnetTM iFemtoCell-evolution LoRaWAN® Indoor Gateway changes, if it dose you might have to edit the .bat file. The Gateway's current IP is currently: `192.168.50.87`

      On the first time sign in:
      
      ![image](https://github.com/user-attachments/assets/7128f66f-75ac-4382-b42a-72aa7243cec7)
      
      Type `yes` and hit the enter key on your keyboard
      
      ![image](https://github.com/user-attachments/assets/c26d4130-f366-41e2-a2e6-a4523e486238)

      you are now logged in.
      

      On subsequent logins:
      
      ![image](https://github.com/user-attachments/assets/c70d065b-b037-423a-b667-5e922963eb97)
 
   
   4. Kerlink Basic Station Packet Forwarder has been installed on the Kerlink WirnetTM iFemtoCell-evolution LoRaWAN® Indoor Gateway.<br>

      Verification: `dpkg -l | grep basicstation`
   
      ![image](https://github.com/user-attachments/assets/480717c5-328c-4ed4-977b-bf9a741cac20)

   5. Kerlink Basic Station Packet Forwarder has been installed on the Kerlink WirnetTM iFemtoCell-evolution LoRaWAN® Indoor Gateway.<br>

      Added a small [compendium](https://github.com/zacw-243L/JPTT-NYP-SMART-Water-meter-POC/blob/main/Useful%20commands.txt) of useful commands from operating KerOS 6 to interacting with Azure VM and databases




## Things tested to be Working
  1. Ability to connect to [The Things Industries](https://www.thethingsindustries.com/) which is part of [The Things Network](https://www.thethingsnetwork.org/)
   
     [Gateway can connect and send reading to the Network server](https://github.com/user-attachments/assets/9c5d5b8d-edff-4973-b75e-338a6b273358)

  
2. Ability to send data from the Network server on The Things Industries to an [IoT platform](https://wiki.thingseye.io/xwiki/bin/view/Main/Get%20ThingsEye%20Account/) of choice
   
     ![Data from the Network server can be sent to IoT Platform](https://cdn.discordapp.com/attachments/666917440910786581/1322044186903707688/0N13IAAAAAElFTkSuQmCC.png?ex=676f7118&is=676e1f98&hm=cb1835045201b62976eca806da7fd323b44f495976ff1e003de117e88ee995fb&)

3. Ability to modify and create new widgets to make raw data more useful on the IoT platform of choice 

   ![Data from the Network server can be sent to IoT Platform](https://cdn.discordapp.com/attachments/666917440910786581/1322043104517423186/xr6zxJkiRJkiRJcm3644KHuPPEveu8PyqYJEmSJEmSJK9M73gwEfw28u584t3z4w322c5IkSZIkSZK8Ur3jOUmSJEmSJEmyU73jOUmSJEmSJEmyUwWekyRJkiRJkiQ7VeA5SZIkSZIkSbJTBZ6TJEmSJEmSJDtV4DlJkiRJkiRJslMFnpMkSZIkSZIkO1XgOUmSJEmSJEmyUwWekyRJkiRJkiQ7VeA5SZIkSZIkSbJTBZ6TJEmSJEmSJDtV4DlJkiRJkiRJslMFnpMkSZIkSZIkO1XgOUmSJEmSJEmyUwWekyRJkiRJkiQ7VeA5SZIkSZIkSbJTBZ6TJEmSJEmSJDtV4DlJkiRJkiRJslMFnpMkSZIkSZIkO1XgOUmSJEmSJEmyUwWekyRJkiRJkiQ7VeA5SZIkSZIkSbJTBZ6TJEmSJEmSJDtV4DlJkiRJkiRJslMFnpMkSZIkSZIkO1XgOUmSJEmSJEmyUwWekyRJkiRJkiQ7VeA5SZIkSZIkS..png?ex=676f7016&is=676e1e96&hm=1e6b01417b84202f6ec4643f064f8f82e066db60674ed63ab1b7f4f4433f448d&)

4. This specific [guide](https://github.com/kartben/thethingsstack-on-azure?tab=readme-ov-file) on deploying The Things Stack v3 on Azure by [Kartben](https://github.com/kartben)

5. Ability to connect to [The Things Stack](https://github.com/TheThingsNetwork/lorawan-stack), hosted on an [Azure](https://azure.microsoft.com/en-us/) VM, which is an open-source LoRaWAN network stack provided by [The Things Network](https://www.thethingsnetwork.org/)
   
   ![image](https://github.com/user-attachments/assets/82bacd50-d8f8-490c-ad67-c2fa84d1a165)

## Things to do

### Notes
1. Kerlink WirnetTM iFemtoCell-evolution LoRaWAN® Indoor Gateway for the Internet of Things has been setup already just use the Password above.
2. Kerlink WirnetTM iFemtoCell-evolution LoRaWAN® Indoor Gateway for the Internet of Things has Basic Station Packet Forwarder already there is no need to reinstall
3. The Kerlink WirnetTM iFemtoCell-evolution LoRaWAN® Indoor Gateway for the Internet of Things already has a SSH key inside use the one provided in this repo instead of generating a new one

### Annex

   #### Useful commands for KerOS 6
   1. Firmware version: `cat /etc/os-release`
   2. Environment variables: `env`
   3. Network status and protocol statistics: `netstat`
   4. IP routing table: `route -n`
   5. IP Tables rules: `sudo iptables -L -v -n | more`
   6. Find IP: `ifconfig`
   7. Switch to root: `sudo -i`

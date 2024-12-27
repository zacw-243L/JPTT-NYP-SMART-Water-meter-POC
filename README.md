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
   1. Kerlink WirnetTM iFemtoCell-evolution LoRaWAN® Indoor Gateway for the Internet of Things has been upgraded to KerOS 6.
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


## Things Tested to be Working
  1. Ability to connect to [The Things Industries](https://www.thethingsindustries.com/) which is part of [The Things Network](https://www.thethingsnetwork.org/)
   
      ![Gateway can connect and send reading to the Network server](https://cdn.discordapp.com/attachments/666917440910786581/1322043014260064379/B828GgAAAAAElFTkSuQmCC.png?ex=676f7000&is=676e1e80&hm=45ab37022e6dc028a588ccfa724dd8ce5ff5355f453452693c4ee2c13b6daa14&)
  
2. Ability to send data from the Network server on The Things Industries to an [IoT platform](https://wiki.thingseye.io/xwiki/bin/view/Main/Get%20ThingsEye%20Account/) of choice
   
     ![Data from the Network server can be sent to IoT Platform](https://cdn.discordapp.com/attachments/666917440910786581/1322044186903707688/0N13IAAAAAElFTkSuQmCC.png?ex=676f7118&is=676e1f98&hm=cb1835045201b62976eca806da7fd323b44f495976ff1e003de117e88ee995fb&)

3. Ability to modify and create new widgets to make raw data more useful on the IoT platform of choice 

   ![Data from the Network server can be sent to IoT Platform](https://cdn.discordapp.com/attachments/666917440910786581/1322043104517423186/xr6zxJkiRJkiRJcm3644KHuPPEveu8PyqYJEmSJEmSJK9M73gwEfw28u584t3z4w322c5IkSZIkSZK8Ur3jOUmSJEmSJEmyU73jOUmSJEmSJEmyUwWekyRJkiRJkiQ7VeA5SZIkSZIkSbJTBZ6TJEmSJEmSJDtV4DlJkiRJkiRJslMFnpMkSZIkSZIkO1XgOUmSJEmSJEmyUwWekyRJkiRJkiQ7VeA5SZIkSZIkSbJTBZ6TJEmSJEmSJDtV4DlJkiRJkiRJslMFnpMkSZIkSZIkO1XgOUmSJEmSJEmyUwWekyRJkiRJkiQ7VeA5SZIkSZIkSbJTBZ6TJEmSJEmSJDtV4DlJkiRJkiRJslMFnpMkSZIkSZIkO1XgOUmSJEmSJEmyUwWekyRJkiRJkiQ7VeA5SZIkSZIkSbJTBZ6TJEmSJEmSJDtV4DlJkiRJkiRJslMFnpMkSZIkSZIkO1XgOUmSJEmSJEmyUwWekyRJkiRJkiQ7VeA5SZIkSZIkS..png?ex=676f7016&is=676e1e96&hm=1e6b01417b84202f6ec4643f064f8f82e066db60674ed63ab1b7f4f4433f448d&)
   
4. Ability to connect to [The Things Stack](https://github.com/TheThingsNetwork/lorawan-stack) which is an open-source LoRaWAN network stack provided by [The Things Network](https://www.thethingsnetwork.org/)
   
   ![image](https://github.com/user-attachments/assets/82bacd50-d8f8-490c-ad67-c2fa84d1a165)

## Things to do

### Notes

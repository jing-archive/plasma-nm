# Jing-nm

Wifi module for jingos-settings.



## Features

* Plasma applet written in QML for managing network connections

* Run on JingOS platform

* Brand new UI & UE with JingOS-style , based on JingUI Framework

* Support keyboard & touchpad & mouse & screen touch

* All keys support pressed / hovered effects

* Well-designed interface material:

  * Font
  * Icon
  * Picture
  


## Links

* Home page: https://www.jingos.com/

* Project page: https://invent.kde.org/plasma/plasma-nm

* Issues: https://invent.kde.org/plasma/plasma-nm/-/issues

* Development channel: https://forum.jingos.com/



## Dependencies

* Qt5 

* Cmake

* KI18n

* Kirigami (JingOS Version)

* Service

* Plasma

* networkmanager-qt
 
* NetworkManager 0.9.10 and newer

* Wallet

* Notifications

* modemmanager-qt
  - requires ModemManager 1.0.0 and newer as runtime dependency
  - Plasma-nm is compiled with ModemManager support by default when modemmanager-qt is found,
    when you want to explicitly disable ModemManager support, use -DDISABLE_MODEMMANAGER_SUPPORT=true cmake parameter.

* openconnect
  - if you want to build the OpenConnect VPN plugin

* NetworkManager-fortisslvpn|iodine|l2tp|openconnect|openswan|openvpn|pptp|ssh|sstp|strongswan|vpnc
  - these are runtime dependencies for VPN plugins




### Build

```
  mkdir build
  cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr [-DDISABLE_MODEMMANAGER_SUPPORT=true]
  make
```


### Install

```
sudo make install
```

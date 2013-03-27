#!/usr/bin/env bash

$EXTRACTRC `find declarative-plugins -name '*.ui' -o -name '*.rc'` >> rc.cpp
$XGETTEXT `find applet -name '*.cpp'` -o $podir/plasma_applet_org.kde.plasma-nm.pot
$XGETTEXT `find declarative-plugins -name '*.cpp'` -j -o $podir/plasma_applet_org.kde.plasma-nm.pot
$XGETTEXT `find applet -name '*.qml'` -j -L Java -o $podir/plasma_applet_org.kde.plasma-nm.pot
rm -f rc.cpp
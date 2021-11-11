#!/bin/bash

if [ $# == 0 ]; then
	burppath='/Applications/Burp Suite Professional.app'
elif [[ $# == 1 ]]; then
	burppath=$1
else
	echo '[ERROR] Param error...'
	echo "Usage: $0 /Path/Of/Burp Suite Professional.app   指定burp应用路径"
	echo "       $0                                        使用默认burp应用路径/Applications/Burp Suite Professional.app"
	exit
fi

burppath=$1
if [ ! -d "${burppath}" ]; then
	echo '未找到 ${burppath}'
 	exit
fi
echo "[!] 正在将 ${burppath} 变菜中！！！！"
mypath=$(cd `dirname $0`; pwd)
jarpath="${burppath}/Contents/java/app/"
mediapath="${burppath}/Contents/java/app/burpsuite_pro/resources/Media/"
install4jpath="${burppath}/Contents/java/app/.install4j"
iconpath="${burppath}/Contents/Resources"

cd "${jarpath}"
cp burpsuite_pro.jar burpsuite_pro.jar.bak
unzip burpsuite_pro.jar -d burpsuite_pro > /dev/null 2>&1

cd "${mediapath}"
mv burp-suite.gif burp-suite_.gif
mv BurpSuitePro.png BurpSuitePro_.png
mv icon16pro.png icon16pro_.png
mv icon20pro.png icon20pro_.png
mv icon28pro.png icon28pro_.png
mv icon32pro.png icon32pro_.png
mv icon64pro.png icon64pro_.png
mv splash.png splash_.png
mv splash-pro.png splash-pro_.png
mv dark/BurpSuitePro.png dark/BurpSuitePro_.png
cp ${mypath}/resources/Media/*.png ./
cp ${mypath}/resources/Media/*.gif ./
cp ${mypath}/resources/Media/dark/*.png ./dark/

cd "${install4jpath}"
mv i4j_extf_7_1dgj151_155a7zr.icns i4j_extf_7_1dgj151_155a7zr_.icns
mv s_1o7fa9s.png s_1o7fa9s_.png
cp ${mypath}/.install4j/i4j_extf_7_1dgj151_155a7zr.icns ./
cp ${mypath}/.install4j/s_1o7fa9s.png ./

cd "${iconpath}"
mv i4j_extf_7_1dgj151_155a7zr.icns i4j_extf_7_1dgj151_155a7zr_.icns
cp ${mypath}/app.icns ./
cp ${mypath}/i4j_extf_7_1dgj151_155a7zr.icns ./

cd "${jarpath}/burpsuite_pro"
zip -q -r ../burpsuite_pro.jar *

echo '[Tips] Run "refreshSystemIconCatch.sh" to refresh app icon.(Need ROOT permission)'
echo "     Usage: ${mypath}/refreshSystemIconCatch.sh"

echo '菜！菜！菜！菜！菜！菜！菜！菜！菜！菜！菜！菜！菜！菜！菜！菜！菜！菜！菜！菜！菜！菜！菜！菜！菜！菜！菜！菜！菜！菜！'
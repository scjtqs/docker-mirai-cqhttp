#!/bin/bash
if [ -f /mirai/install.lock ];then
    echo 'mirai installed'
    touch /mirai/install.lock
else
#    unzip -n /mirai.zip -d /mirai
#    rm /mirai.zip
    git clone https://gitee.com/scjtqs/mirai.git /mirai2
    mv -n /mirai2/* /mirai/
    rm -rf /mirai2
    touch /mirai/install.lock
fi

chmod +x /mirai/run*
sed -i "s/\$QQ/$QQ/" /mirai/run.sh
sed -i "s/\$PASSWORD/$PASSWORD/" /mirai/run.sh
sed -i "s/\$QQ/$QQ/" /mirai/run2.sh
sed -i "s/\$PASSWORD/$PASSWORD/" /mirai/run2.sh
sed -i "s/\$QQ/$QQ/" /mirai/plugins/CQHTTPMirai/setting.yml
sed -i "s/\$TOKEN/$TOKEN/" /mirai/plugins/CQHTTPMirai/setting.yml

sed  -i  "s,POST_URL,$POSTURL,"  /mirai/plugins/CQHTTPMirai/setting.yml

sed -i "s/\$SECRET/$SECRET/" /mirai/plugins/CQHTTPMirai/setting.yml
if [ $ENV == "all-in-one" ];then
	/mirai/run2.sh
else
	/mirai/run.sh
fi

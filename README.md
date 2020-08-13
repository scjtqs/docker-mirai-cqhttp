# docker-mirai-cqhttp
mirai的docker包，带一个 jar的cqhttp插件

## 关于安全验证
你可以用自动生成的mirai-data中的device.json  配置在本地跑一遍，认证一下。

## 关于配置信息
如果修改了 environment中的变量，请rm -rf mirai-data 重新生成配置

## 测试
```
curl -v 'http://127.0.0.1:5700/send_private_msg?access_token=token&user_id=你的qq号&message=hello'

## 简易使用说明

git clone https://github.com/scjtqs/docker-mirai-cqhttp

cd docker-mirai-cqhttp

docker-compose up -d 

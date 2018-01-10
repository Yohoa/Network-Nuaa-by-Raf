# Hack "nuaa.portal"
Hack “nuaa.portal”针对南京航空航天大学校办无线局域网“nuaa.portal”的认证进行了逆向之操作，提供了其*登陆过程的分析报告*。此外，本项目还根据这个成果实现了一组免除网页来登陆登陆的小程序，包含了以下的衍生版本：
1. 基于Python 的认证小程序
2. 基于curl 的认证小程序
3. 为实现常在线的路由器而准备的系列脚本

## 为实现常在线的路由器而准备的系列脚本
这个版本包含了这些文件
1. cron_conf_for_auto_login.sh 
  1. 该文件包含了为cron 准备的保持在线的脚本
2. PandoraBox-Network-\*.png 
  1. PandoraBox 配置页面的备份。

这些脚本对Linux-based 路由器需求的二进制文件：
1. cron
2. ping
3. curl

此外，需要对PandoraBox 进行的配置包括：
1. 设置WAN-on-WiFi，或ISP-on-WiFi。
2. Crontab 自動檢查在線情況，請參見[這個文檔](./Scripts_working_with_cURL/cron_conf_for_auto_login.sh)。

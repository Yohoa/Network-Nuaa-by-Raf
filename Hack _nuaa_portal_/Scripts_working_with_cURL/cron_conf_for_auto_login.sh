# Always-Up Cron Script for Router (Especially a linux-based router with ordinary CURL installed).
# 为安装了CURL 的路由器准备的保证其随时在线的cron 脚本

# Description of every command will be annotated below it.
# 每一个命令的含义将随其后注解。

# Just uncomment what you need. 
# 所有命令都已经被设置为注释，请根据需要解除注释使用。

# If a command is related to login, just replace the "{YOUR_USERNAME}" and "{YOUR_PASSWORD}" with yours.
# 如果命令涉及登陆，请将{YOUR_USERNAME}"替换为你的用户名，"{YOUR_PASSWORD}"替换为你的密码，方可使用。

# 命令之说明将以中文叙述。
# Descriptions will present in simplified Chinese.

# Thank you for your participation. Raphael.
# 感谢您的关注！

# Cron 文件格式说明
#  ——分钟 (0 - 59)
# |  ——小时 (0 - 23)
# | |  ——日   (1 - 31)
# | | |  ——月   (1 - 12)
# | | | |  ——星期 (0 - 7)（星期日=0或7）
# | | | | |
# * * * * * 被执行的命令


# */10 *   *   *   *    date >> /tmp/ping.output; ping -c 1000 -q www.baidu.com >> /tmp/ping.output
# 每十分钟，对www.baidu.com 进行一千次ICMP 的测试，将其运行时时间和丢包之结果放置于/tmp/ping.output

# */10 *   *   *   *    netstat >> /tmp/netstat.output
# 每十分钟将netstat 的执行结果放在/tmp/netstat.output

# 0 */5   *   *   *   /etc/init.d/shadowsocks restart; printf "Shadowsocks Restart Successfully, Again. Raf.\n">>/tmp/shadowsocks.output 
# 每天五点重启shadowsocks 程序，并记录这个事件。

# @reboot curl 'http://202.119.65.214/iPortal/action/doLogin.do'  -XPOST  -H 'Content-Type: application/x-www-form-urlencoded'  -H 'Referer: http://202.119.65.214/iPortal/index.htm?from=003cc944be32e25365428f2dd2adbbe2&wlanuserfirsturl=http://www.ip.cn/'  -H 'Accept: application/json, text/javascript, */*; q=0.01'  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/603.3.8 (KHTML, like Gecko) Version/10.1.2 Safari/603.3.8'  -H 'Origin: http://202.119.65.214'  -H 'X-Requested-With: XMLHttpRequest'  --data 'username={YOUR_USERNAME}&password={YOUR_PASSWORD}&saved=0&from=003cc944be32e25365428f2dd2adbbe2&domain=1' >> /tmp/Raf.Login.output
# 重启时，执行“nuaa.portal”的自动登陆，并将结果保存在/tmp/Raf.Login.output

# */60 *   *   *   * curl 'http://202.119.65.214/iPortal/action/doLogin.do'  -XPOST  -H 'Content-Type: application/x-www-form-urlencoded'  -H 'Referer: http://202.119.65.214/iPortal/index.htm?from=003cc944be32e25365428f2dd2adbbe2&wlanuserfirsturl=http://www.ip.cn/'  -H 'Accept: application/json, text/javascript, */*; q=0.01'  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/603.3.8 (KHTML, like Gecko) Version/10.1.2 Safari/603.3.8'  -H 'Origin: http://202.119.65.214'  -H 'X-Requested-With: XMLHttpRequest'  --data 'username={YOUR_USERNAME}&password={YOUR_PASSWORD}&saved=0&from=003cc944be32e25365428f2dd2adbbe2&domain=1' >> /tmp/Raf.Login.output
# 每六十分钟执行一次“nuaa.portal”的自动登陆，并将结果保存在/tmp/Raf.Login.output

# */30 *   *   *   * ping -q -w 1 -c 1 114.114.114.114 > /dev/null && printf "Make Internet Up Again!\n">>/tmp/InternetStatus.output || curl 'http://202.119.65.214/iPortal/action/doLogin.do'  -XPOST  -H 'Content-Type: application/x-www-form-urlencoded'  -H 'Referer: http://202.119.65.214/iPortal/index.htm?from=003cc944be32e25365428f2dd2adbbe2&wlanuserfirsturl=http://www.ip.cn/'  -H 'Accept: application/json, text/javascript, */*; q=0.01'  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/603.3.8 (KHTML, like Gecko) Version/10.1.2 Safari/603.3.8'  -H 'Origin: http://202.119.65.214'  -H 'X-Requested-With: XMLHttpRequest'  --data 'username={YOUR_USERNAME}&password={YOUR_PASSWORD}&saved=0&from=003cc944be32e25365428f2dd2adbbe2&domain=1' >> /tmp/Raf.Login.output
# 每三十分钟执行一次网络连通性的检查（通过对114.114.114.114 发ICMP 包实现）；若网络不在线，则执行“nuaa.portal”的自动登陆，并将结果保存在/tmp/Raf.Login.output；若连通性正常，则将"Make Internet Up Again!\n"保存到/tmp/InternetStatus.output。

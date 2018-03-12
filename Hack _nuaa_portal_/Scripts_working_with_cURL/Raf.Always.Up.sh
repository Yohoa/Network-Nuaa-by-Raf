# 保持永远在线的脚本
 ping -q -w 1 -c 1 114.114.114.114 > /dev/null \
 && printf "Make Internet Up Again!\n">>/tmp/InternetStatus.output \
 || curl 'http://202.119.65.214/iPortal/action/doLogin.do'  \
 -XPOST  -H 'Content-Type: application/x-www-form-urlencoded'  \
 -H 'Referer: http://202.119.65.214/iPortal/index.htm?from=003cc944be32e25365428f2dd2adbbe2&wlanuserfirsturl=http://www.ip.cn/'  \
 -H 'Accept: application/json, text/javascript, */*; q=0.01'  \
 -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/603.3.8 (KHTML, like Gecko) Version/10.1.2 Safari/603.3.8'  \
 -H 'Origin: http://202.119.65.214'  \
 -H 'X-Requested-With: XMLHttpRequest'  \
 --data 'username={YOUR_USERNAME}&password={YOURPASSWORD}&saved=0&from=003cc944be32e25365428f2dd2adbbe2&domain=1' \
 >> /tmp/Raf.Login.output
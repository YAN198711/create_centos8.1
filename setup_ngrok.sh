#!/bin/bash
cd ~

# 1行目末に改行を入れる
sed -i -e '$s/$/\n/' /root/.ngrok2/ngrok.yml
# 2行目に改行を入れる
sed -i -e '$s/$/\n/' /root/.ngrok2/ngrok.yml
# 3行目に'tunnels:'を入れる
sed -i -e '3a\tunnels:' /root/.ngrok2/ngrok.yml

# 4行目に'name:'を入れる
sed -i -e '4a\  tv1:' /root/.ngrok2/ngrok.yml
# 5行目に'addr: xx'を入れる
sed -i -e '5a\    addr: 80' /root/.ngrok2/ngrok.yml
# 6行目に'bind_tls: true'を入れる
sed -i -e '6a\    bind_tls: true' /root/.ngrok2/ngrok.yml
# 7行目に'proto: http'を入れる
sed -i -e '7a\    proto: http' /root/.ngrok2/ngrok.yml

sed -i -e '8a\  tv2:' /root/.ngrok2/ngrok.yml
sed -i -e '9a\    addr: 81' /root/.ngrok2/ngrok.yml
sed -i -e '10a\    bind_tls: true' /root/.ngrok2/ngrok.yml
sed -i -e '11a\    proto: http' /root/.ngrok2/ngrok.yml

sed -i -e '12a\  tv3:' /root/.ngrok2/ngrok.yml
sed -i -e '13a\    addr: 82' /root/.ngrok2/ngrok.yml
sed -i -e '14a\    bind_tls: true' /root/.ngrok2/ngrok.yml
sed -i -e '15a\    proto: http' /root/.ngrok2/ngrok.yml

sed -i -e '16a\  tv4:' /root/.ngrok2/ngrok.yml
sed -i -e '17a\    addr: 83' /root/.ngrok2/ngrok.yml
sed -i -e '18a\    bind_tls: true' /root/.ngrok2/ngrok.yml
sed -i -e '19a\    proto: http' /root/.ngrok2/ngrok.yml

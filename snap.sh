exec 1>>crawl_log  
exec 2>>crawl_log_err
#!/bin/bash
cd /root/snap2html/DiogenesList-master/
python3 /root/snap2html/DiogenesList-master/diogeneslist.py /home index
sed -i "s#\[LINK ROOT\]#https://media.dxz.plus#g"  /root/snap2html/DiogenesList-master/index.html
sed -i "s#\[LINK PROTOCOL\]##g"  /root/snap2html/DiogenesList-master/index.html
sed -i "s#\[SOURCE ROOT\]##g"  /root/snap2html/DiogenesList-master/index.html
sed -i "s#\\\\\\\root\\\\\\\rclone\\\\\\\00##g"  /root/snap2html/DiogenesList-master/index.html
sed -i "s#1>index#1>所有内容均来自公开分享_收藏自用_侵权联系https://t.me/whistle436(telegram)#g" /root/snap2html/DiogenesList-master/index.html
sed -i "s#e>index#e>影视资源收藏交流#g" /root/snap2html/DiogenesList-master/index.html
cp /root/snap2html/DiogenesList-master/index.html /root/snapGit/
cd /root/snapGit
git add .
git commit -m 'snap2htmlDailyUpdate'
git pull --rebase origin master
git push origin master
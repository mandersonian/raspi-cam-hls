# raspi-cam-hls
Simple HTTP Live Streaming (HLS) server for local Raspberry Pi camera.


```
sudo chmod 644 /lib/systemd/system/hls.service
chmod +x video.sh
sudo systemctl daemon-reload
sudo systemctl enable hls.service
sudo systemctl start hls.service
```

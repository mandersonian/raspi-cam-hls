# raspi-cam-hls
Simple HTTP Live Streaming (HLS) server for local Raspberry Pi camera.

Tested on Raspberry Pi Zero (non-W) with NoIR camera v2.  Using a WiFi dongle.  Also using a ramdisk for /var/www/html/segments to keep the write load low on the microSD card (although I have run this continuously writing HLS segments on the microSD for 6+ months with no issues).

After putting files in place on your Raspberry Pi, set up the HLS service as follows (this will ensure that it runs on boot and is managed by the system in case it crashes).

```
sudo chmod 644 /lib/systemd/system/hls.service
chmod +x ~/video.sh
sudo systemctl daemon-reload
sudo systemctl enable hls.service
sudo systemctl start hls.service
```

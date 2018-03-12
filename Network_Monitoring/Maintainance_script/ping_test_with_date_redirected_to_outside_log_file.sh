# DATE:     2017-11-13 09:43:10
# Author:   Raphael Yang
# INFO:
# This bash script help you to value the network status, especially the pack loss rate.
# It will ping a particular domain (e.g., qq.com) for a CNT of one thousand and redirect the statistic log to a file.
# It should be mention that the time of the begining of the ping operation will also be recorded to the file.
# Long live a Flank Network of Nanjing University of Aeronautics and Astronautics.
printf "BEGIN###############################\n" >> /media/AiDisk_a1/Raf.ping.log; date >> /media/AiDisk_a1/Raf.ping.log; printf "####################################\n" >> /media/AiDisk_a1/Raf.ping.log; ping -c 1000 -q www.qq.com >> /media/AiDisk_a1/Raf.ping.log; printf "END#################################\n\n\n" >> /media/AiDisk_a1/Raf.ping.log; printf "BEGIN###############################\n" >> /media/AiDisk_a1/Raf.ping.67.log; date >> /media/AiDisk_a1/Raf.ping.67.log; printf "####################################\n" >> /media/AiDisk_a1/Raf.ping.67.log; ping -c 1000 -q 67.209.187.224 >> /media/AiDisk_a1/Raf.ping.67.log; printf "END#################################\n\n\n" >> /media/AiDisk_a1/Raf.ping.67.log;

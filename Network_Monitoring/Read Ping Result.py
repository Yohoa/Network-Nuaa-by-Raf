import re, os
import datetime


csv = open('Banana67.csv', 'w', encoding = 'utf-8')

with open('Raf.ping.67.log', 'r', encoding = 'utf-8' ) as f:
    for line in f:
        # print(line)
        re_Spliter = re.compile(r"####################################")


        re_Time = re.compile(r'.*:.*:.*')


        TimeStamp = re_Time.search(line)
        if TimeStamp != None:
            TimeStamp = TimeStamp.group()
            print(TimeStamp) # Mon Nov 13 20:54:00 CST 2017
            # https://docs.python.org/3/library/datetime.html#strftime-and-strptime-behavior
            TimeStamp = datetime.datetime.strptime(TimeStamp, "%a %b %d %H:%M:%S CST %Y")
            time = TimeStamp.time()
            date = TimeStamp.date()
            csv.write(str(date)+','+str(time)+',')


        re_packets = re.compile(r'(.*) packets transmitted.*, (.*) packets received.*, (.*)% packet loss')
        Packets_Resu = re_packets.search(line)
        if Packets_Resu != None:
            quantity = int(Packets_Resu.group(1))
            pac_received = int(Packets_Resu.group(2))
            pac_loss = int(Packets_Resu.group(3))
            csv.write(str(quantity)+','+str(pac_received)+','+str(pac_loss)+',')


        re_roundtrip = re.compile(r'round-trip min/avg/max = (.*)/(.*)/(.*) ms')
        Round_Resu = re_roundtrip.search(line)
        if Round_Resu != None:
            min_r = float(Round_Resu.group(1))
            avegr = float(Round_Resu.group(2))
            max_r = float(Round_Resu.group(3))
            csv.write(str(min_r)+','+str(avegr)+','+str(max_r)+'\n')

csv.close()
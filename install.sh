#!/bin/bash
if [ ! -d ~/Apps ]
then
  mkdir ~/Apps/
fi
echo "masukan nama kota"
read city
cityId=$(curl -s "https://api.myquran.com/v1/sholat/kota/cari/$city" | jq '.data[0].id' | tr -d '"')
if [ $cityId == null ]
then
  echo 'Kota tidak ditemukan Silahkan coba lagi!'
fi
sed -i -e "s/\(cityId=\).*/\1$cityId/"  jadwalSholat.sh
currentYear=$(date +%Y)
currentMonth=$(date +%m)
nextMonth=$(expr $currentMonth + "1")
cp jadwalSholat.sh ~/Apps/jadwalSholat.sh
wget -O ~/Apps/jadwalbulandepan.json https://api.myquran.com/v1/sholat/jadwal/$cityId/$currentYear/$nextMonth
wget -O ~/Apps/jadwal.json https://api.myquran.com/v1/sholat/jadwal/$cityId/$currentYear/$currentMonth

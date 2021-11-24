today=$(date +%d)
tdmo=$(expr $today - "1")
nextMonth=$(expr $(date +%m) + 1)
currentYear=$(date +%Y)
date=$(date +%Y-%m-%d)
currentTime=$(date +%H%M)
cityId=1204

if [ $today -eq "1" ]
then
  detailCurrentTime=$(date +"%m%d%y")
  jadwalLastModified=$(date -r jadwal.json +"%m%d%y")
  if [ $detailCurrentTime -ne $jadwalLastModified ]
  then
    rm ~/Apps/jadwal.json
    more ~/Apps/jadwalbulandepan.json > jadwal.json
    wget -O ~/Apps/jadwalbulandepan.json https://api.myquran.com/v1/sholat/jadwal/$cityId/$currentYear/$nextMonth
  fi
  clear
fi
subuh=$(more ~/Apps/jadwal.json | jq --argjson td $tdmo '.data.jadwal[$td].subuh' | tr -d '"')
subuhpo=$(more ~/Apps/jadwal.json | jq --argjson td $today '.data.jadwal[$td].subuh' | tr -d '"')
dzuhur=$(more ~/Apps/jadwal.json | jq --argjson td $tdmo '.data.jadwal[$td].dzuhur' | tr -d '"')
ashar=$(more ~/Apps/jadwal.json | jq --argjson td $tdmo '.data.jadwal[$td].ashar' | tr -d '"')
maghrib=$(more ~/Apps/jadwal.json | jq --argjson td $tdmo '.data.jadwal[$td].maghrib' | tr -d '"')
isya=$(more ~/Apps/jadwal.json | jq --argjson td $tdmo '.data.jadwal[$td].isya' | tr -d '"')
subuhTime=$(echo $subuh | tr -d : )
dzuhurTime=$(echo $dzuhur | tr -d : )
asharTime=$(echo $ashar | tr -d : )
maghribTime=$(echo $maghrib | tr -d : )
isyaTime=$(echo $isya | tr -d : )
waktuIsya=$(expr $currentTime - $isyaTime)
waktuMaghrib=$(expr $currentTime - $maghribTime)
waktuAshar=$(expr $currentTime - $asharTime)
waktuDzuhur=$(expr $currentTime - $dzuhurTime)
waktuSubuh=$(expr $currentTime - $subuhTime)
if [ $waktuIsya -ge 0 ]
then
  lastElemen=$(more ~/Apps/jadwal.json | jq '.data.jadwal | length')
  if [ $today -eq $lastElemen ]
  then
    echo "\n\t\t\tSelf Reminder --> Subuh" `more ~/Apps/jadwal.json | jq '.data.jadwal[0].subuh' | tr -d '"' `
  else
    echo "\n\t\t\tSelf Reminder --> Subuh $subuhpo"
  fi
elif [ $waktuMaghrib -ge 0 ]
then
  echo "\n\t\t\tSelf Reminder --> Isya $isya"
elif [ $waktuAshar -ge 0 ]
then
  echo "\n\t\t\tSelf Reminder --> Maghrib $maghrib"
elif [ $waktuDzuhur -ge 0 ]
then
  echo "\n\t\t\tSelf Reminder --> Ashar $ashar"
elif [ $waktuSubuh -ge 0 ]
then
  echo "\n\t\t\tSelf Reminder --> Dzuhur $dzuhur"
else
  echo "\n\t\t\tSelf Reminder --> Subuh $subuh"
fi
echo "\n"

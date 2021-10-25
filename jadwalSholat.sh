today=$(date +%d)
currentMonth=$(date +%m)
currentYear=$(date +%Y)
date=$(date +%Y-%m-%d)
currentTime=$(date +%H%M)
if [ $today -eq "1" ]
then
  wget -O jadwal.json https://api.myquran.com/v1/sholat/jadwal/1601/$currentYear/$currentMonth
  clear
  more jadwal.json | jq '.data.lokasi'
else
  subuh=$(more jadwal.json | jq --argjson td $today '.data.jadwal[$td].subuh')
  dzuhur=$(more jadwal.json | jq --argjson td $today '.data.jadwal[$td].dzuhur')
  ashar=$(more jadwal.json | jq --argjson td $today '.data.jadwal[$td].ashar')
  maghrib=$(more jadwal.json | jq --argjson td $today '.data.jadwal[$td].maghrib')
  isya=$(more jadwal.json | jq --argjson td $today '.data.jadwal[$td].isya')
  subuhTime=$(echo $subuh | tr -d : | tr -d '"')
  dzuhurTime=$(echo $dzuhur | tr -d : | tr -d '"')
  asharTime=$(echo $ashar | tr -d : | tr -d '"')
  maghribTime=$(echo $maghrib | tr -d : | tr -d '"')
  isyaTime=`echo $isya | tr -d : | tr -d '"'`
  waktuIsya=$(expr $currentTime - $isyaTime)
  waktuMaghrib=$(expr $currentTime - $maghribTime)
  waktuAshar=$(expr $currentTime - $asharTime)
  waktuDzuhur=$(expr $currentTime - $dzuhurTime)
  waktuSubuh=$(expr $currentTime - $subuhTime)
  if [ $waktuIsya -ge 0 ]
  then
    echo "\n\t\t\tSelf Remainder --> $subuh"
  elif [ $waktuMaghrib -ge 0 ]
  then
    echo "\n\t\t\tSelf Remainder --> $isya"
  elif [ $waktuAshar -ge 0 ]
  then
    echo "\n\t\t\tSelf Remainder --> $maghrib"
  elif [ $waktuDzuhur -ge 0 ]
  then
    echo "\n\t\t\tSelf Remainder --> $ashar"
  elif [ $waktuSubuh -ge 0 ]
  then
    echo "\n\t\t\tSelf Remainder --> $dzuhur"
  fi
fi

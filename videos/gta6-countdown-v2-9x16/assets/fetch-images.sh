#!/usr/bin/env bash
# Lädt die im Video verwendeten offiziellen Bilder von rockstargames.com/VI (© Rockstar Games).
# Die Bilder liegen bewusst nicht im Repository. Benötigt curl und ffmpeg.
set -euo pipefail
cd "$(dirname "$0")" && mkdir -p img
base="https://www.rockstargames.com/VI/_next/static/media"
while read -r name file; do
  curl -sS -A 'Mozilla/5.0' -o "img/.tmp.jpg" "$base/$file"
  ffmpeg -v error -y -i "img/.tmp.jpg" -vf "scale='min(1920,iw)':-2" -q:v 3 "img/$name.jpg"
done <<'LIST'
keyart-date an-extended-look.0ijbsha5fo1te.jpg
city-night VINTAGE_VICE_CITY_PACK_01.05zaof7o1uz.3.jpg
boat ULTIMATE_EDITION_SARAS_SALON_01.0gn7dwlvcgz17.jpg
keyart t2.03tjzfo3b31.y.jpg
jason-lucia ULTIMATE_EDITION_02.0q-6.nrtf~jj0.jpg
heist launch-trailer.0_q-sdrgufc.s.jpg
leonida-day ULTIMATE_EDITION_SAFEHOUSE_VEHICLES_01.0wv6pw3t-mky3.jpg
couple-car t1.11adbh~jn5-gy.jpg
poster-a trailer-1.06b6paykx247w.jpg
poster-c GTAVI_FOB_StandardEdition_Desktop.09clbpu8-nv8i.jpg
car ULTIMATE_EDITION_RIDEOUT_CUSTOMS_01.065-ms8~k8vbq.jpg
pool ULTIMATE_EDITION_VICE_CITY_STYLE_01.0.u1gt~99yzks.jpg
LIST
rm -f img/.tmp.jpg

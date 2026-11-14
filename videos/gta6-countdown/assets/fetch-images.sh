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
city-night desktop.00.5pzu2sm-z4.jpg
leonida-day k4ak9okk485712.0cj_8hoskvfgy.jpg
couple-car desktop.0iky3x6.hl8fo.jpg
jason-lucia ULTIMATE_EDITION_01.16qc1xq5nigg1.jpg
heist mediaDesktop.11iioep6d3wsf.jpg
keyart-date 89834o94713o21.04n287k6o2lh9.jpg
boat ULTIMATE_EDITION_SQUALO_01.0cim7hj58ypb1.jpg
car ULTIMATE_EDITION_GROTTI_CHEETAH_01.0a.wy3s_ogjey.jpg
keyart pre-load.0h87nx-881hca.jpg
poster-a launch-trailer.0cq1gbt4507ty.jpg
poster-c trailer-2.0l.7aqib91fz6.jpg
pool onlyInLeonidaDesktop.15y2n40f3axwo.jpg
LIST
rm -f img/.tmp.jpg

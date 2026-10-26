#!/bin/bash
# Saca cuadros de un video con el tiempo en el nombre (t_03.25.jpg = 3,25 s).
# Uso: extract_frames.sh VIDEO CARPETA FPS [DESDE HASTA]
set -e
V="$1"; OUT="$2"; FPS="${3:-4}"; DESDE="${4:-}"; HASTA="${5:-}"
mkdir -p "$OUT"
TMP="$(mktemp -d)"
if [ -n "$DESDE" ] && [ -n "$HASTA" ]; then
  ffmpeg -v error -ss "$DESDE" -to "$HASTA" -i "$V" -vf "fps=$FPS,scale=640:-2" -q:v 3 "$TMP/f_%05d.jpg"
else
  DESDE=0
  ffmpeg -v error -i "$V" -vf "fps=$FPS,scale=640:-2" -q:v 3 "$TMP/f_%05d.jpg"
fi
n=0
for f in "$TMP"/f_*.jpg; do
  t=$(python3 -c "print(f'{$DESDE + $n / $FPS:05.2f}')")
  mv "$f" "$OUT/t_$t.jpg"; n=$((n+1))
done
rmdir "$TMP"
echo "$n cuadros en $OUT"

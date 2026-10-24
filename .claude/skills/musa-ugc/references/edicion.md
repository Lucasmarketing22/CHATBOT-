# Edición en HyperFrames

Proyecto por video en `/home/user/demo-musa/<nombre>/` (copiar `AGENTS.md`, `CLAUDE.md`, `hyperframes.json`, `meta.json`, `package.json` de un proyecto anterior). Versión fija: `npx --yes hyperframes@0.8.177 check | snapshot --at T -o DIR | render -o OUT.mp4 | remove-background IN -o OUT`.

## Analizar una referencia

```bash
ffprobe -v error -show_entries format=duration:stream=codec_type,width,height -of compact IN.mp4
ffmpeg -i IN.mp4 -vf "fps=2,scale=200:-1,tile=8x3" -frames:v 1 hoja.jpg            # hoja de contacto
ffmpeg -i IN.mp4 -vf "select='gt(scene,0.25)',showinfo" -f null - 2>&1 | grep -oE "pts_time:[0-9.]+"   # cortes
```
Transcripción con tiempos por palabra: `npx hyperframes transcribe` falla (SIGILL). Usar faster-whisper con `python3 -I`:
```python
from faster_whisper import WhisperModel
m = WhisperModel("small", device="cpu", compute_type="int8")
segs, _ = m.transcribe("a16.wav", language="en", word_timestamps=True)   # a16.wav = mono 16 kHz
```
Los tiempos de whisper pueden correrse ±0,3 s: confirmar los arranques con niveles de audio (RMS cada 20–50 ms, umbral ≈ −42 dB).

Avisos de entrada: los videos que Lucas sube por el chat llegan comprimidos a 480×848. Las capturas de pantalla traen barras y textos de la app: recortarlas antes de usarlas. Si el audio de una "grabación de pantalla" es el mismo que el del archivo original, usar el original.

## Recortar pausas

1. Detectar tramos con voz por RMS y unir huecos < 0,28 s.
2. Cada tramo: `[inicio − 0,06, fin + 0,10]`. Dejar 0,3 s en las pausas con intención ("…and this is my skin now", "Honestly… three weeks").
3. Si el arranque cae antes de un corte de toma, moverlo justo después del corte (que no se cuele un cuadro de la otra toma).
4. Cortar video y audio juntos con un `filter_complex_script` (trim/atrim + fundidos de 12 ms + concat). Agrandar con `scale=1080:1920:flags=lanczos,unsharp=5:5:0.55:5:5:0,fps=24`. Tratar la voz con `highpass=f=80,acompressor=threshold=-20dB:ratio=3:attack=5:release=80,loudnorm=I=-16:TP=-1.5:LRA=7`. Sacar video y audio en **un solo comando con dos salidas** (si no, loudnorm queda "sin conectar").
5. Volver a transcribir el audio cortado para verificar que no se comió ninguna palabra y tomar los tiempos nuevos para los subtítulos.
6. En los cortes dentro de la misma toma, alternar zoom (`scale` 1 ↔ 1,07 con `tl.set`) para que el salto parezca a propósito.
7. **La primera palabra necesita aire:** que el video arranque al menos 0,25 s antes de que hable (en el celular el sonido tarda un instante y se come el arranque). Si la IA dijo la primera palabra muy seca (ej. "Wait" de 0,2 s), estirar solo esa palabra con `setpts=PTS/v` + `atempo=v` (v ≈ 0,73). Luego correr todos los subtítulos lo mismo que se corrió el video (medirlo con los cortes reales, no calcularlo) y volver a transcribir para confirmar que se entiende. Lucas: "arranca cortado, no se entiende que dice wait" (VEYLA).

## Subtítulos

- **Una sola línea por frase** (dos textos a la vez no se leen), Inter 800 ≈ 74–76 px, blanco con trazo oscuro de 11 px (`paint-order: stroke fill`), `text-wrap: balance`, centrados a ≈ y 1250–1330.
- **Palabra clave dentro de la frase**, en Bricolage 800 ≈ 86–88 px con degradado (`background-clip: text`) y `filter: drop-shadow` (no trazo). `display: inline-block; margin: 0 8px` y un latido de escala 1,08 cuando la dice (más grande se pisa con las palabras de al lado).
- Cada subtítulo dura hasta que empieza el siguiente. Máximo ≈ 15–17 letras por segundo; si no entra, acortar la frase en español (decir lo mismo con menos letras) o dar respiros.
- Colores de palabra clave: musa.studio `#ff5fa2 → #a77bff`; skincare `#ffb38a → #ff5f8f`.

## Overlays y recursos que ya funcionaron

- **Selfies antes/ahora** en tarjeta con borde blanco, arriba a la derecha (sin tapar la cara: mirar dónde está la cara en cada toma con una hoja de contacto con grilla). El "ahora" entra girando (`rotationY`) en la palabra "now". El "antes" visible **desde el primer cuadro**.
- **Recorte de fondo** (persona delante de otra imagen): `remove-background tramo.mp4 -o tramo.webm --quality best` (≈ 0,5 s por cuadro en CPU). Poner la imagen de fondo debajo y el `.webm` encima, con la misma duración y el mismo zoom.
- **Producto flotante:** `remove-background` sobre la foto de estudio → PNG transparente. Entra con giro y `back.out`, flota con un yoyo suave. Después puede quedar chico en una esquina hasta el final.
- **B-roll de otra toma** sobre la voz: varios `<video>` del mismo archivo con `data-media-start` distintos (cortes de ≈ 0,8–1,2 s).
- **Imagen congelada + flecha de mouse** (estilo "clic en los productos"): congelar con un JPG del cuadro exacto, flecha SVG, doble clic (la flecha se achica y sale un anillo), zoom de 0,2 s hacia el punto del clic que se funde con la **foto real** del producto, que se acerca despacio. Copiar los tiempos de la referencia para que su audio calce. Si hay que saltear parte de la caminata, el salto va tapado por el primer plano.
- **Corregir una letra mal escrita en un cartel** (cámara casi fija): en Python/OpenCV, dibujar el trazo que falta sobre los cuadros 480p con supermuestreo, siguiendo el movimiento del cartel con `cv2.phaseCorrelate` y el desenfoque estimado por cuadro (comparar con versiones desenfocadas de un cuadro nítido). Revisar al principio, al medio y en los cuadros desenfocados.
- **Comentario que se escribe solo** ("Comment ACNE"): caja blanca redonda con avatar, letras que aparecen al ritmo de la voz y botón de enviar que late.
- **Cierre:** foto del producto (packshot) 1,5 s con un acercamiento suave y una línea de texto arriba; o placa de marca.
- Destellos de luz cálida (`mix-blend-mode: screen`) en los cambios de escena; flecha SVG en degradado para "Tap the link below".
- **Cámara lenta sin saltos** (Seedance da 24 cps): cortar el tramo y `minterpolate=fps=44:mi_mode=mci:mc_mode=aobmc:vsbmc=1,setpts=PTS/0.55` (×0,55). Revisar manos y bordes; en SOLVANE (ponerse anteojos) salió limpio. Script de ejemplo: `/home/user/demo-musa/solvane/armar-base.sh`.
- **Tablero de ingredientes** (SOLO si Lucas pide mostrar el proceso para musa.studio o la comunidad; **nunca en un anuncio de producto**): tarjetas tipo polaroid sobre fondo beige que caen con `back.out` y un pop cada una; la primera ya entrando en el cuadro 0; al final la cámara entra en la tarjeta del producto (escala 2,6 + desenfoque) y un destello lleva al primer plano. Proyecto: `/home/user/demo-musa/solvane/`.
- **Seedance a veces cambia la luz dentro de un plano** cuando entra la persona (SOLVANE: el poste pasó de verdoso a cálido en 0,92 s): arrancar el plano después del salto.

## Lo que queda falso (no hacerlo)

- **No simular con efectos lo que no se generó**: un time-lapse día→noche con capas de color y "luces" pintadas en las ventanas se ve falso (Lucas: "horrible", "las luces son cualquier cosa").
- **No rellenar escenas faltantes con fotos quietas animadas** en medio de tomas de video real: al lado del video se notan. Si una escena no se pudo generar, es mejor sacarla y acortar el video (avisando qué se perdió) que fingirla.
- Fotos con movimiento sí funcionan como **insertos breves de objetos** (un folleto volando, una vista cenital de un celular), no como reemplazo de tomas de lugares.

## Reglas de HyperFrames aprendidas a los golpes

- Videos e imágenes temporizados: hijos directos de `#root`, con `id` y `class="clip"`.
- **Todo lo que entra después de su `data-start`**: poner `opacity: 0` (u otro estado inicial) en el CSS. Si no, se ve completo unos cuadros antes de la animación (falla del "clic en la hamburguesa").
- Los `fromTo` que empiezan más tarde llevan `immediateRender: false` (sin eso, un flash blanco tapó todo el video).
- Nada de animar `height`/`margin`; usar transforms, `clip-path` u opacidad.
- `tl.set(..., 0)` no se ve en el cuadro 0: el estado del primer cuadro va en el CSS o en un `style` inline.
- Las advertencias de "sub-composition" y "track too dense" son de organización; no cambian el render.
- El render baja el audio ≈ 10 dB y el video de Seedance a veces trae audio más corto: **mezclar el sonido afuera** con ffmpeg (`adelay` + `amix normalize=0` + `alimiter`, `apad` hasta la duración total) y unirlo al MP4 del render (`-c:v libx264 -crf 20–23 -c:a aac -b:a 192k -movflags +faststart`). Efectos en `/root/.claude/skills/media-use/audio/assets/sfx/` (pop, whoosh-short, sparkle, click, impact-bass-1), licencia Pixabay.
- El render sale a 30 fps aunque el material sea de 24: al extraer cuadros por número, dividir por 30.

## Cortar sobre música

1. **Pedir siempre el audio de la parte que va a usar** (archivo o video). Sin audio no se corta "a ojo".
2. **Medir el compás, no solo el BPM:** con librosa sacar el golpe fuerte y ver si se divide en 2 o en 3. "Lose Control" (Teddy Swims) es una balada en 12/8: golpe fuerte ≈ 1,12 s dividido en 3 (0,37 s). En SOLVANE v2 corté dividiendo en 2 (0,566 s) y la mitad de los cortes caían entre notas.
3. **Encontrar el estribillo con la letra:** transcribir con faster-whisper (small.en, `word_timestamps=True`) y arrancar el anuncio en el golpe anterior al estribillo. (`hyperframes transcribe` falla con SIGILL en este servidor.)
4. **Balada = cortes lentos:** 1–2 golpes fuertes por plano, cámara lenta en la palabra clave, transiciones suaves (luz cálida + leve acercamiento), sin barridos ni ráfagas. Lucas: "que los cortes no sean tan rápidos".
5. **Entregar dos versiones:** con la música pegada (para ver cómo queda) y sin música (efectos + ambiente). La versión en vivo de una canción no es la de la biblioteca de Instagram: avisar que con la de estudio los cortes no caen exactos y decir dónde arrancarla.

## Control de calidad y entrega

- Snapshots del proyecto en los momentos clave **antes** del render. Después del render, tiras de cuadros alrededor de cada transición (`-ss T -t 1 -vf fps=10,tile=…`) para cazar cuadros colados.
- Verificar duración, que el audio dure lo mismo que el video y que el peso sea < 16 MB (si no, `crf 23`).
- Página Artifact con capacidad `downloads`: copiar la última página publicada y cambiar `<title>`, `<h1>`, la descripción y el nombre del archivo. Con canción: dos botones (con canción y sin música).
- El watch de comentarios de Artifact tiene límite por sesión: decirle a Lucas que escriba los cambios en el chat.

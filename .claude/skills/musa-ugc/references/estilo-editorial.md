# Estilo editorial / documental (para marcas premium)

Resumen de lo útil de la skill "editorial-film-edit" que compartió Lucas. **Ojo:** el ZIP que llegó traía solo el texto principal y código de ejemplo; faltaba la carpeta `references/` (guía de estilo, mapa de referencias, checklist de revisiones, guía de implementación, 4 fotos y 4 videos). Si Lucas la manda completa, completar este archivo con esa guía. Hasta entonces, esto es lo que se puede afirmar con lo que llegó.

## Qué lo define

- Mirada "archivo editorial": **grano de película** vivo, **bloom/halación** suave en las luces, algunos insertos en **blanco y negro claro y neutro**, viñeta leve. El presentador va más limpio que los insertos.
- Solo **tres familias tipográficas**: grotesca (Helvetica Neue → acá usar Inter), serif de display con itálica (Didot / Bodoni → acá **Bodoni Moda**, libre en Google Fonts) y mono (Menlo → JetBrains Mono / DejaVu Sans Mono). Las palabras fuertes son un **peso** de la grotesca (800), no una cuarta familia.
- Paleta de la referencia: papel `#f2efe8`, tinta `#111114`, un solo naranja `#ff5a1f`, rojo neón `#ff2a3d`, blanco. Adaptar por marca.

## Recursos

1. **Subtítulos palabra por palabra:** blancos en grotesca bold; cada palabra aparece en su lugar final cuando se dice (≈ 0,24 s con expo-out, sube un poco y pasa de desenfocada a nítida); las palabras clave en **itálica serif un 20 % más grande**. El bloque mantiene la posición aunque haya un corte y sube muy despacio mientras está en pantalla. Sobre insertos claros, la versión en tinta oscura sin sombra.
2. **Texto stop-motion (posterize time):** solo la animación del texto avanza a ≈ 8 fps (escalones) mientras el video y el grano siguen a 24–25 fps. En GSAP: `ease: "steps(N)"` o redondear el tiempo de la animación a una grilla de 1/8 s.
3. **Pantalla dividida con entrada suave:** presentador de un lado y B-roll del otro. El panel del B-roll entra empujando en ≈ 0,4 s (sine in-out). El presentador se re-encuadra, nunca se aplasta. El grano va solo en el lado del B-roll.
4. **Tipos de texto de énfasis:** grotesca extendida en mayúsculas, serif con brillo, mono en mayúsculas espaciadas (créditos, fuentes, "máquina de escribir" con cursor), números grandes en serif con subtítulo en itálica, palabra dentro de una caja de color.
5. **Grano bien hecho** (por qué la mayoría parece "un sticker encima"): tiene que ser **nuevo en cada cuadro**, no una textura que se desliza; estar pegado a la imagen (si la imagen se mueve, el grano también); ser fino (≈ 1,2 px) con una capa gruesa leve (≈ 10 %); pesar menos en sombras profundas y luces altas; y no repetirse en bucle. Polvo y rayas, solo si se piden.
6. **Bloom:** solo la parte alta de las luces (umbral suave), desenfocada a un cuarto de resolución y sumada antes del color y del grano.

## Reglas de trabajo que sumamos a todos los videos

- Al volver de un B-roll, que no se cuele ningún cuadro de la toma vecina.
- Si se mueve el límite de una toma, conservar el tiempo absoluto de las palabras.
- Probar tramos cortos (inserto claro y oscuro, B/N, tipografía, split, recorte) antes del render completo.
- Trabajar por capas limpias: fuente, insertos, texto, recortes, sonido. Guardar la versión anterior al revisar.
- Si se agrega música, entregar también la versión sin música. Si solo cambió la imagen y la duración es la misma, conservar el sonido aprobado.
- No dar por hecho un control que no se hizo.
- No presentar imágenes generadas como prueba histórica. Pinterest solo no da derechos de uso.

## Estado en HyperFrames

Antes de improvisar grano, bloom o B/N con CSS, cargar `/media-use` y leer `references/media-treatments.md` (tratamientos de imagen estándar de HyperFrames) y combinarlo con los criterios de arriba. Las tipografías de Mac no están en el servidor: usar los reemplazos libres.

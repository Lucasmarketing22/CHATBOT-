---
name: musa-ugc
description: Método de musa.studio para crear videos UGC con IA (portfolio y clientes) — analizar una referencia, escribir el guion, pedir las fotos en Google Flow, generar la toma en Seedance 2.5 (app → Escenas) y editar en HyperFrames con subtítulos en español, B-roll, recortes de fondo y cierre. Use when the user (Lucas, musa.studio) asks to replicate a reference video, make a UGC ad/promo, create presenters/models, or edit/fix one of his AI videos.
---

# musa.studio · videos UGC con IA

Lucas (dueño de musa.studio, habla español rioplatense, usa iPhone, no es técnico) arma un **portfolio de UGC hecho con IA** para vender su servicio a empresas, sobre todo de EE.UU. Esta skill guarda el método que ya funcionó en los videos de Zuri, Residente y ODUNA.

## Reglas de Lucas (siempre)

1. **Aprobación antes de crear.** Antes de generar, publicar o guardar algo, mostrar el plan y esperar el OK. Si dice **"dale"**, está aprobado.
2. **Costos primero.** Antes de gastar créditos de IA, decir el costo exacto (créditos y US$). Ver [costos](references/flujo-escenas.md#costos).
3. **Nunca inventar.** Si algo no se sabe o no se pudo verificar, decirlo. Analizar a fondo antes de entregar ("hacé bien el trabajo de una vez").
4. **Opinión honesta.** No darle la razón por darla: recomendar lo mejor y cambiar de opinión solo con datos nuevos. Señalar siempre los defectos que se vean (cartel mal escrito, producto que no se entiende, pelo distinto…).
5. **Instrucciones ultra concretas.** Pasos numerados, fotos con nombre (FOTO A, FOTO B…), nombres exactos de botones de la app, prompts listos para copiar en bloques de código.
6. **Nunca pedir API keys en el chat** (están en Vercel).
7. **"Publica"** = crear el PR de la app (repo App-avatar-) y hacer squash-merge a main. Solo con esa palabra.
8. **musa.studio** aparece solo escrito en pantalla; nunca hacer que la IA lo pronuncie.
9. **Mila** (su influencer IA): en sus videos nunca revelar que es IA. Sus redes tienen contenido adulto, así que los videos de portfolio **no** son para las cuentas de Mila. Las promos del servicio sí pueden decir "IA".
10. **Música:** la agrega Lucas. Entregar con voz + efectos y, si hay canción, también una versión sin música.
11. Sin datos de contacto en las placas finales (por ahora).
12. Borradores 480p alcanzan para el portfolio; no pagar el paso a 1080p salvo que lo pida.
13. **Video de referencia = copia exacta, escena por escena, con su avatar.** No resumir, no juntar escenas, no inventar elementos (etiquetas, placas, efectos) que no están, no saltear transiciones ni detalles (qué lleva puesto, cómo cae, cómo entra la cámara). Antes de gastar créditos, hacer el desglose completo y planear las tomas para cubrir **todas** las escenas en la menor cantidad de generaciones. Si algo no se puede copiar igual, decirlo antes, con la alternativa y su costo. Interpretar en vez de copiar le hizo gastar créditos de más (reel inmobiliario de Larkford).
14. **Chequear todo antes de crear cualquier cosa.** Antes de pasarle a Lucas un paso que gasta créditos (o que crea algo), revisar y mostrarle un checklist: cada foto con su nombre exacto (mandarle los archivos con nombre si hace falta) y el rol que hay que elegir; los roles que la app pone sola (Escenas: la 1.ª foto queda Persona A, la 2.ª Persona B y de la 3.ª en adelante Lugar); que el texto no tenga comillas salvo en lo que se habla (la app y la IA toman lo que va entre comillas como diálogo); el conteo de palabras; duración, formato, calidad y costo; y que cada plano, corte y transición coincida con la referencia (cortes reales vs. tomas continuas, quién entra por dónde, vestuario y objetos). Decir los riesgos y el plan B antes, no después.

## Formato por defecto del portfolio

- Vertical 9:16, **en inglés con subtítulos en español** (voseo: "Tocá", "Comentá").
- Productos y marcas **inventados**. Antes de usar un nombre, buscarlo en la web y descartar los parecidos a marcas reales (avisar que es una búsqueda rápida, no un chequeo legal).
- Presentadores **llamativos pero reales**: un rasgo que se recuerde (color de pelo, corte, accesorio, color de ropa) con piel con poros y sin retoque. Variar género, edad y origen entre videos.
- Nada de pausas ni silencios de "IA": recortar entre frases (ver [edición](references/edicion.md#recortar-pausas)).
- Algo visual cada 2–3 s (selfie, recorte, B-roll, producto, zoom). El primer cuadro tiene que enganchar.

## Flujo

1. **Desglosar la referencia escena por escena** (regla 13): cortes con `select='gt(scene,0.12)'` (0,25 se saltea muchos), hojas de contacto de **todo** el video a 2–3 cuadros por segundo con el tiempo impreso (`drawtext=text='%{pts\:flt}'`), en tramos de ~14 s; transcripción con tiempos por palabra; música y efectos. Armar una tabla: tiempo, encuadre, acción, objetos/vestuario, texto en pantalla, transición. Mostrársela a Lucas con el plan de tomas y el costo total antes de crear nada. → [edición § analizar](references/edicion.md#analizar-una-referencia)
2. **Plan + guion + costo.** Guion en inglés que entre en el tiempo (la app admite `round(dur × 2.3)` palabras habladas en Escenas). Proponer cómo replicarlo con lo que hay. Esperar aprobación.
3. **Fotos en Google Flow (Nano Banana Pro, gratis).** Pasar un prompt por foto. Las fotos de la misma persona se hacen **con la FOTO A como referencia**; el "después" de un antes y después, **editando la foto del "antes"**. Revisar cada foto que vuelve (identidad, rasgo distintivo, texto de la etiqueta, marcas reales visibles). → [prompts](references/flujo-escenas.md#fotos)
4. **Toma de video en la app → 🎬 Escenas (Seedance 2.5).** Darle a Lucas: qué foto va con qué rol, el texto para pegar, duración/formato/calidad y el costo. → [Escenas](references/flujo-escenas.md)
5. **Edición en HyperFrames** (proyecto en `/home/user/demo-musa/<nombre>`): recortar pausas, subtítulos, overlays, B-roll, recortes de fondo, sonido, render y mezcla. → [edición](references/edicion.md)
6. **Control de calidad** sobre el MP4 final (no solo números): cuadros alrededor de cada transición, textos legibles, sin cuadros colados, duración y audio. Arreglar y volver a revisar lo que cambió.
7. **Entrega:** página Artifact con botón de descarga (y versión sin música si corresponde). Explicar en español qué tiene, qué se cambió y qué limitaciones quedan.

## Estilos de edición disponibles

- **UGC / TikTok (por defecto):** subtítulo de una línea grande con la palabra clave en degradado, recortes con zoom alternado, pops y whooshes. → [edición § subtítulos](references/edicion.md#subtítulos)
- **Editorial / documental (marcas premium):** grano de película, bloom suave, palabra por palabra con acentos en itálica serif, texto stop-motion, pantalla dividida. → [estilo editorial](references/estilo-editorial.md)
- **Motion / anuncios de producto (igualar la calidad de las referencias, regla de Lucas):** recursos de las referencias que mandó Lucas (tipografía 3D, anillos de texto, lápiz que escribe, sonido por cada movimiento, paleta de un color), cuándo usarlos en UGC y cuándo en anuncios, y qué no usar nunca. → [referencias de motion](references/referencias-motion.md)

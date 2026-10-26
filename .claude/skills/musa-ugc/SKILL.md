---
name: musa-ugc
description: Método de musa.studio para crear videos UGC con IA (portfolio y clientes) — analizar una referencia, escribir el guion, pedir las fotos en Google Flow, generar la toma en Seedance 2.5 (app → Escenas) y editar en HyperFrames con subtítulos en español, B-roll, recortes de fondo y cierre. Use when the user (Lucas, musa.studio) asks to replicate a reference video, make a UGC ad/promo, create presenters/models, or edit/fix one of his AI videos.
---

# musa.studio · videos UGC con IA

Lucas (dueño de musa.studio, habla español rioplatense, usa iPhone, no es técnico) arma un **portfolio de UGC y anuncios hechos con IA** para vender su servicio a empresas, sobre todo de EE.UU.

## Reglas de Lucas (siempre)

1. **Aprobación antes de crear.** Mostrar el plan y esperar el OK ("dale" = aprobado) antes de generar, publicar o guardar.
2. **Costo antes de gastar**, en créditos y US$. Ver [costos](references/flujo-escenas.md#costos).
3. **Nunca inventar.** Lo que no se sabe o no se pudo verificar, se dice.
4. **Opinión honesta de experto** en UGC, anuncios y edición: recomendar lo mejor, señalar defectos, no darle la razón por darla.
5. **Instrucciones ultra concretas:** pasos numerados, fotos con nombre (FOTO A, FOTO B…), botones exactos de la app, prompts en bloques de código.
6. **Nunca pedir API keys** en el chat (están en Vercel).
7. **"Publica"** = PR en App-avatar- + squash-merge a main. Solo con esa palabra.
8. **musa.studio** solo escrito en pantalla; la IA nunca lo pronuncia.
9. **Mila** (su influencer IA): nunca revelar que es IA; los videos de portfolio no son para sus cuentas.
10. **Música:** la pone Lucas. Entregar con voz + efectos (y versión sin música si se usó una canción).
11. Sin datos de contacto en las placas finales.
12. **Referencia = copia exacta**, escena por escena: no resumir, no juntar escenas, no agregar elementos. Desglose completo y plan de tomas antes de gastar; si algo no se puede copiar, decirlo antes con la alternativa y su costo.
13. **Checklist antes de cada paso que gasta:** cada foto con su nombre y su rol en la app (Escenas: la 1.ª foto queda Persona A, la 2.ª Persona B y el resto Lugar), comillas solo en lo que se habla, conteo de palabras, duración, formato, calidad y costo. Riesgos antes, no después.
14. **Todo producto y marca es inventado** (nombre y logo propios; buscar que no se parezca a una marca real). Las marcas reales de las referencias son solo estilo. No recordarle que los logos reales son privados.
15. **El plan correcto a la primera, pagando una sola vez:** sin versiones baratas "de prueba" ni planes B después. Los planos y cortes se deciden **antes** y van en el mismo prompt; nunca generar una toma y pagar otra pasada para cambiarla.

## Formato por defecto

- **Vertical 9:16, cortos** (anuncio ≈ 10–16 s, UGC hablado ≈ 12–15 s). Si hace falta más, proponerlo con el costo.
- **Voz en inglés, subtítulos en español** con voseo ("Tocá", "Comentá").
- **Anuncios de producto:** solo planos reales del producto (nunca mostrar cómo se hizo), una toma de 12–15 s con 5–6 planos, color de cine y logo final. Los cortes siguen la música: ráfaga en temas rápidos, 1–2 golpes por plano en baladas. → [cortar sobre música](references/edicion.md#cortar-sobre-música)
- **Anuncios de cine con varias escenas:** hoja de personaje por escena + locación + mapa de posición, prompt con la estructura de [método escena por escena](references/metodo-escenas-cine.md).
- **Ganchos (5 s) para la comunidad:** sin voz, solo sonido del lugar y efectos; viento, luz que cambia y piel en movimiento o en macro; el mensaje en texto en pantalla (inglés arriba, español abajo). Tipos: resultado / dolor / promesa. [Banco de prompts](https://claude.ai/artifact/Kzc3k4mLLyQ4Adwc7Bi2nj)
- **Presentadores llamativos pero reales:** un rasgo que se recuerde, piel con poros, sin retoque. Variar género, edad y origen.
- **Ritmo UGC:** sin pausas de "IA" (recortar entre frases), algo visual cada 2–3 s, primer cuadro que enganche.
- **Videos que ya existen** (filmados de verdad o de un cliente): para sumarles ángulos de cámara, skill `genhq-infinite-angle` + app → Escenas → 🎥 Nuevos ángulos.

## Flujo

1. **Desglosar la referencia** (regla 12): cortes, hojas de contacto con el tiempo impreso, transcripción con tiempos por palabra, música y efectos → tabla de escenas + plan de tomas + costo total. → [analizar](references/edicion.md#analizar-una-referencia)
2. **Guion en inglés** que entre en el tiempo (≈ 2,3 palabras habladas por segundo). Esperar aprobación.
3. **Fotos** (Google Flow gratis o app → Crear): un prompt por foto; las de la misma persona con la FOTO A de referencia. Revisar cada foto que vuelve. → [prompts de fotos](references/flujo-escenas.md#fotos)
4. **Toma en la app → 🎬 Escenas (Seedance 2.5):** fotos y roles, texto para pegar, duración, formato, calidad y costo. → [Escenas](references/flujo-escenas.md)
5. **Edición en HyperFrames** (`/home/user/demo-musa/<nombre>`): pausas, subtítulos, overlays, B-roll, sonido, render y mezcla. → [edición](references/edicion.md)
6. **Control de calidad** cuadro por cuadro sobre el MP4 final (transiciones, textos, audio).
7. **Entrega:** página Artifact con descarga; explicar qué tiene y qué limitaciones quedan.

## Estilos de edición

- **UGC / TikTok (por defecto):** subtítulo grande con palabra clave destacada, zooms alternados, pops y whooshes. → [subtítulos](references/edicion.md#subtítulos)
- **Editorial / premium:** grano, bloom, palabra por palabra con itálica serif. → [estilo editorial](references/estilo-editorial.md)
- **Motion / anuncios:** recursos de las referencias que mandó Lucas, con su misma calidad. → [referencias de motion](references/referencias-motion.md)

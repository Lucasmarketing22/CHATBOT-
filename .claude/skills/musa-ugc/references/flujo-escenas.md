# Fotos (Google Flow) y toma de video (app → Escenas)

## Fotos

Lucas genera las imágenes gratis en **Google Flow con Nano Banana Pro**. Pasarle un bloque por foto, con nombre (FOTO A, B…), en inglés, terminando siempre con `No text, no logos, no watermark.` (salvo el producto, que lleva su texto).

**Presentador/a (FOTO A).** Plano de cintura para arriba, vertical, con luz y lugar del video de referencia:
```
Candid photo taken by a friend with an iPhone 16 Pro, 1x lens, eye level, vertical 9:16, waist-up. A [edad]-year-old [origen] [woman/man] standing [lugar], [luz]. [Pelo con rasgo distintivo], [rasgos], [accesorios]. [He/She] wears [ropa con un color que contraste]. Looks straight into the camera with [expresión]. Natural skin texture with visible pores, no retouching, light makeup. Realistic, unedited, sharp focus on the face, softly blurred background. No text, no logos, no watermark.
```

**Misma persona en otra situación:** subir la FOTO A como referencia y empezar con `Use the woman from the reference image, same face.` Recordar el rasgo distintivo (ej. mechones platinados): Flow lo pierde si no se nombra.

**Antes y después:** hacer primero el "antes". El "después" se hace **subiendo la foto del antes y pidiendo que la edite**: así salen la misma pose, el mismo baño y la misma ropa, y cambia solo la piel:
```
Edit this photo. Keep everything exactly the same: the same woman and face, the same pose, the same place, the same clothes, the same hair [rasgo], the same light. Only change [lo que cambia]. Realistic, unedited, natural skin texture with visible pores. No text, no watermark.
```

**Producto (marca inventada):** foto de estudio sobre fondo gris claro liso (se recorta fácil). Nombre corto y grande en la etiqueta. Revisar que esté bien escrito; si no, generar de nuevo.

**Agregar algo que falta a una foto real** (ej. el pan de arriba de una hamburguesa): subir la foto y pedir `Edit this photo. Keep [todo lo que importa] exactly as it is… Add […] sitting naturally… Remove [lo que sobra]. Extend the image to a vertical 9:16 frame…`

**Revisión de cada foto que vuelve:** misma identidad y rasgo distintivo; manos y dedos bien; ninguna marca real visible; texto del producto correcto; ropa y lugar coherentes con el video. Decir cuál sirve, cuál no y por qué, con el prompt corregido.

## Escenas (Seedance 2.5)

En la app (app-avatar-silk.vercel.app) → **🎬 Escenas**. Tres pasos en pantalla:

1. **🖼️ Fotos de referencia.** Hasta 9. Debajo de cada una, elegir qué es: *Persona A/B/C, Lugar, Ropa, Objeto*. Solo van las fotos que la IA tiene que usar en la toma. Las que son para la edición (selfies, frasco flotante, estantes) **no van acá**: Lucas las manda por el chat.
2. **✍️ La escena y los diálogos.** Cuadro de texto grande (ejemplo en gris "Ej: Handheld smartphone video…"). Si quedó el texto de la escena anterior, borrarlo. Lo hablado va **entre comillas**. La app cuenta las palabras: máximo `round(dur × 2.3)` → 8 s: 18, 10 s: 23, 15 s: 35, 20 s: 46, 30 s: 69.
3. **🎬 Video.** ⏱️ Duración (8/10/15/20/30 s), 📐 Formato (📱 Vertical 9:16), ✨ Calidad (🧪 Borrador 480p) → botón **🧪 Crear borrador** → confirmar. Puede tardar más de 10 min.

**Plantilla: persona hablando a cámara con cortes (UGC)**
```
Vertical smartphone video, UGC talking-head style, filmed handheld by a friend at chest height. Person A stands [lugar], [luz], wearing [ropa]. [Objeto en mano, ej. a small black handheld wireless microphone with a fluffy windscreen close to her chin] and talks directly to the camera: natural, confident and relatable, with small hand gestures. Hard jump cuts between lines, each cut with slightly closer or wider framing.
Person A (to camera): "…"
Person A (counting on her fingers): "…"
…
No text on screen, no music.
```

**Plantilla: producto en uso (B-roll, sin diálogo)**
```
Vertical smartphone video, close-up UGC [rubro] b-roll in [lugar] with soft natural window light, filmed handheld, two shots.
Shot 1, macro close-up of hands only: Person A holds the [producto] from the object photo with the label facing the camera, [acción simple].
Hard cut.
Shot 2, close-up of Person A's face […]: [acción simple], [resultado visible], and [gesto final] to the camera.
Slow, natural movements. No dialogue, only soft ambient sound. No text on screen.
```

**Plantilla: escena caminando con producto (cámara fija)**
```
Vertical smartphone video, one continuous shot. The camera is static at chest height on the sidewalk in front of [lugar de la foto], facing its entrance. [Luz].
Person A walks out of [puerta] and walks straight toward the camera at a relaxed pace. In her right hand she holds [objeto 1 from the object photo]… In her left hand […objeto 2…].
Halfway, she glances to her left as if someone called her, with a small curious smile, and keeps walking. At the end she walks past the camera on its right side and leaves the frame.
Natural walking motion […]. No dialogue, only ambient street sound.
```

**Lo que la IA hace mal (evitar o arreglar después):**
- Letras en movimiento: carteles y etiquetas se deforman (ej. "RESIDENIE"). Mejor mostrar el producto con la **foto real** en un primer plano o flotando, y revisar cada cartel de la toma.
- Líquidos sirviéndose, tapas a rosca, muchos objetos a la vez, el celular que filma apareciendo en cuadro.
- Una persona con el pelo recogido pierde el rasgo distintivo (mechones): nombrarlo en el texto.
- Seedance actúa mucho más natural que Omni (Hablados); para escenas con varias tomas, Seedance.

## Costos

Kie.ai, 1 crédito = US$0,005 (verificado en kie.ai/seedance-2-5).

| Seedance 2.5 sin video de entrada | por segundo | 8 s | 15 s | 20 s | 30 s |
|---|---|---|---|---|---|
| 480p (borrador) | 28 | 224 (US$1,12) | 420 (US$2,10) | 560 (US$2,80) | 840 (US$4,20) |
| 720p | 63 | 504 | 945 | 1260 | 1890 |
| 1080p | 158 | 1264 | 2370 | 3160 | 4740 |

- El paso de borrador a 1080p ("✨ Me gusta: pasarlo a 1080p", hasta 7 días) no tiene precio publicado; la app lo estima como un 1080p completo. Avisarlo así.
- Gemini Omni (Hablados): 4/6/8/10 s = 63/84/105/126 créditos.
- Google Flow (fotos): gratis.

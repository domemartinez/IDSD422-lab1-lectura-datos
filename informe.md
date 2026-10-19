# Informe técnico — Consolidación de reportes de ventas

**Para:** Gerencia de RetailAndina S.A. · **De:** Equipo de Business Intelligence
**Fecha:** ___/___/2026 · **Asunto:** Primer análisis de los reportes de ventas (semana 39)

---

## Resumen ejecutivo

*Escribe 3–4 líneas para gerencia: qué reportes recibiste, qué confirmaste y qué recomienda el equipo.*

## 1. ¿Los tres formatos contienen la misma información?

*Carga los tres archivos (CSV, JSON y Excel) en Python y en R, y compara dimensiones y estructura. Completa la tabla:*

| Formato | Origen | Filas | Columnas | Lectura en código |
|---|---|---|---|---|
| CSV | ERP de sucursales | 5 | 4| `pd.read_csv()` / `read_csv()` |
| JSON | API de fidelización | 5 | 4 | `json.load()` + `pd.json_normalize()` / `fromJSON()` |
| Excel | Consolidado de finanzas | 5 | 4 | `pd.read_excel()` / `read_excel()` |

**Responde: ¿la estructura interna del archivo (texto plano, anidada, binaria) cambia el contenido?**
La estructura interna del archivo no cambia el contenido final, siempre que la etapa de lectura y desestructuración interprete correctamente la tabla de origen.

## 2. Tipos de datos y calidad

*Inspecciona los tipos que infiere cada lenguaje. Completa la tabla y comenta si los tipos son los esperados para cada variable:*

| Variable | Tipo inferido (Python) | Tipo inferido (R) | Interpretación |
|---|---|---|---|
| `ventas` | `int64` | `num` | Número entero hace referencia a las ventas en dólares |
| `clientes` | `int64` | `num` | Número entero hace referencia a la cantidad de clientes |
| `sucursal` | `object` | `chr` | Cadena de texto indica el nombre de la sucursal |
| `region` | `object` | `chr` | Cadena de texto indica la región geográfica |

**¿Qué habría indicado un dato sucio si, por ejemplo, `ventas` llegara como texto?**
Si `ventas` hubiese llegado formateado como texto, habría impedido realizar operaciones aritméticas directas como la suma total o el promedio sin una limpieza previa.

## 3. Particularidades técnicas encontradas

**Anota qué encontraste al leer cada formato (una nota por formato): ¿el JSON llegó como tabla? ¿hubo que indicar una hoja en el Excel? ¿cómo se expresan las categóricas en cada lenguaje?**
* **JSON:** No llegó directamente como una tabla plana; `json.load()` devolvió una lista de diccionarios que debió ser aplanada mediante `pd.json_normalize()` en Python y `fromJSON()` en R.
* **Excel:** Fue indispensable especificar el parámetro `sheet_name="ventas"` en pandas Y `sheet="ventas"` en R para asegurar la lectura de la hoja correcta del libro consolidado.
* **Variables categóricas:** En Python los textos se leen por defecto como tipo `object` (strings), mientras que R los importa como `character` con la opción implícita de convertirlos a factores para modelado estadístico.

## 4. Indicadores para la reunión del lunes

*Calcula los indicadores con los datos consolidados y completa la tabla:*

| Indicador | Valor |
|---|---|
| Venta promedio por sucursal | $12,008.00  |
| Ticket promedio (ventas ÷ clientes) | $38.07 |
| Sucursal con mayor venta | Guayaquil Centro |
| Sucursal con menor venta | Cuenca |
| Región con mayor venta total | Sierra |

## 5. Conclusiones y recomendación

1. Se confirmó la absoluta sincronización entre el ERP, la API y Finanzas, debido a que los tres formatos presentados cuentan con exactamente 5 filas y 4 columnas con valores idénticos.
2. Las ventas totales alcanzaron $60,040 con 1,577 clientes y un ticket promedio de $38.07. Guayaquil Centro lideró las ventas, mientras que Cuenca registró el menor volumen. Además la región Sierra obtuvo la mayor venta acumulada.
3. Como recomendación se garantiza a la gerencia que las fuentes son 100% confiables para consolidar el informe ejecutivo. Algo fundamental es que este análisis solo es de la semana 39 así que no cuenta con una proyección futura.

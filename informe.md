
# Informe General de Backtesting — Agente Causal BonanzAR

---

## 1. Resumen Ejecutivo

> 📝 **[COMPLETAR]** Párrafo breve (3-5 líneas) que sintetice los resultados más relevantes del conjunto de tests ejecutados. Debe poder leerse de forma aislada y dar una idea clara del estado del proyecto. Incluir: período evaluado, capital inicial/final, retorno nominal y real, accuracy general del modelo, y una conclusión sobre la viabilidad del agente.

---

## 2. Metodología

El backtest se organiza de forma tal para que el Agente tome en cuenta los activos cuya señal indica baja de precios, y aquellos cuya señal indica suba de precios. Finalmente, a partir de ambos informes, se le indica al Agente que proponga un Portfolio.

Para determinar las señales de subida de precios, se utiliza un prompt con una pregunta disparadora: `¿Cuáles subirán de precio en el corto plazo debido a factores macroeconómicos y políticos (...)?`. A partir de ella, el agente realiza las siguientes acciones:

1. Una petición al grafo para determinar las variables macroecónómicas que necita para determinar qué bonos suben
2. Una petición a la base de datos para adquirir los datos macroeconómicos del día.
3. Selecciona qué señales se activan del grafo causal, y elabora una respuesta

**Respuesta ejemplo**:
```
Strong Fiscal Surplus $\rightarrow$ Lower Default Risk $\rightarrow$ Lower Country Risk $\rightarrow$ Higher Bond Prices.
Low Inflation $\rightarrow$ Lower pressure on the exchange rate $\rightarrow$ Stability in Hard Dollar bonds.
```

Realiza un proceso análogo para determinar cuales bonos bajarán de precios `¿cuáles bajarán de precio en el corto plazo? (30 días)`. 

Finalmente, para armar el portfolio se le incluye una lista de los precios actuales de cada bono, así cómo los caminos causales para determinar lase señales "UP" y "DOWN". En el caso de obtener causales contradictorios, se ejecuta el proceso de `REBALANCE`, dónde analiza el "score" de cara conección lógica para seleccionar cuál camino es más "pesado" (UP|DOWN).

**Prompt ejemplo**

El siguiente texto es una "prompt" generada al agente, con la información obtenida de las dos preguntas anteriores "cuáles bajarán de precio" y "cuáles subirán de precios"

```
Estás administrando un portafolio de inversión en bonos. Hoy es 2025-06-03.

Estado actual del portafolio:
- Efectivo disponible (Cash): $1000000.00 ARS
- Valor total del portafolio: $1000000.00 ARS
Tenencias actuales:
No tienes tenencias actualmente (100% en efectivo).

Bonos disponibles para operar hoy:
- TZV26 (Precio actual: $108800.00)
- AE38 (Precio actual: $85230.00)
- AL29 (Precio actual: $87910.00)
- CUAP (Precio actual: $27980.00)

(...)

**Escenarios Condicionales:**
- **Si** el superávit financiero se mantiene o aumenta en el próximo reporte mensual, **entonces** los bonos AL30 y GD30 deberían continuar su tendencia alcista hacia niveles de TIR más bajos.
- **Si** la inflación mensual vuelve a acelerarse por encima del 4%, **entonces** se recomienda reducir exposición a bonos de tasa fija y rotar hacia activos ajustados por CER.

**Trigger de Salida:** Considerar la venta de las posiciones si el Riesgo País cae por debajo de los 500 bps o si se alcanza un objetivo de TIR acorde al valor razonable de mercado para el corto plazo.
```
\* *el fragmento fue recortado para mejorar la legibilidad*

Cómo respuesta, devuelve una lista de bonos, y cuánto dinero invertir en cada uno de ellos

```
"action": "REBALANCE",
  "bonds": {
    "AL30": 300000.0,
    "GD30": 300000.0,
    "AL29": 200000.0,
    "GD29": 200000.0
  },
  "justification": "Se procede a invertir el 100% del efectivo disponible basándose en la fuerte señal alcista derivada de la sostenibilidad fiscal. La cadena causal identificada es: Superávit Financiero y Primario ──► ↓ Riesgo País ──► ↑ Precio de Bonos Hard Dollar. Dado que el portafolio tiene un horizonte de 30 días, se priorizan los bonos AL30 y GD30 por su liquidez y sensibilidad a la mejora del riesgo país, complementando con AL29 y GD29 para diversificar la duración. El escenario se ve respaldado por una inflación mensual baja (1,5%) y una brecha cambiaria mínima, lo que reduce la volatilidad inmediata y favorece la apreciación de los activos en moneda dura."
```

---

## 3. Comparación entre Versiones de Tests

> 📝 **[COMPLETAR]** Tabla comparativa de todos los tests ejecutados hasta la fecha. Cada fila es una versión del test. Incluir columnas como: versión, modelo LLM utilizado, período evaluado, capital inicial, retorno nominal, retorno real, accuracy global, Sharpe Ratio (si está disponible), y una columna de "cambios respecto a la versión anterior" para registrar qué se modificó entre iteraciones (ej: prompt, modelo, universo de bonos, horizonte temporal).

| Versión | Modelo | Período | Capital Inicial | Retorno Nom. | Retorno Real | Accuracy | Cambios |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Test 1.3 | `gemma-4-31b-it` | 2025-06-03 → 2025-07-03 | $1,000,000 ARS | 4.89% | 3.34% | 58.82% | — |
| *(agregar)* | | | | | | | |

---

## 4. Resultados por Test

> 📝 **[INSTRUCCIÓN]** Cada test ejecutado debe tener su propia subsección con el formato definido a continuación. Copiar el bloque completo por cada nuevo test que se incorpore al informe.

---

### Test 1.3 — `gemma-4-31b-it`

**Modelo Utilizado**: `gemma-4-31b-it`

Este informe detalla los resultados de la simulación del agente BonanzAR y la administración de su portfolio.

#### 4.1 Parámetros de la Simulación

- **Rango de Fechas**: Desde 2025-06-03 hasta 2025-06-03
- **Horizonte de Evaluación**: 30 días
- **Paso temporal**: 1 días
- **Restricción de Tickers**: Ninguna

#### 4.2 Resumen de Métricas de Predicción

| Métrica | Valor |
| --- | --- |
| **Predicciones Totales** | 17 |
| **Predicciones Correctas** | 10 |
| **Accuracy Global** | 58.82% |
| **Precisión Alzas (UP)** | 100.00% (10/10) |
| **Precisión Bajas (DOWN)** | 0.00% (0/7) |

#### 4.3 Análisis de Señales (Matriz de Confusión)

> 📝 **[COMPLETAR]** Presentar la matriz de confusión para las predicciones UP/DOWN. Incluir: Verdaderos Positivos (VP), Falsos Positivos (FP), Verdaderos Negativos (VN), Falsos Negativos (FN). Derivar de ahí el **Recall** (sensibilidad) para UP y DOWN, y el **F1-Score** por dirección. Si hay un sesgo sistemático del modelo hacia UP o DOWN, mencionarlo y discutir posibles causas (ej: contexto macroeconómico del período, sesgo en el prompt, etc.).

|  | Predicho UP | Predicho DOWN |
| --- | --- | --- |
| **Real UP** | VP = 10 | FN = 0 |
| **Real DOWN** | FP = 7 | VN = 0 |

| Métrica | UP | DOWN |
| --- | --- | --- |
| **Precisión** | 100.00% | 0.00% |
| **Recall** | *(completar)* | *(completar)* |
| **F1-Score** | *(completar)* | *(completar)* |

#### 4.4 Métricas de Rendimiento del Portfolio

> 📝 **[COMPLETAR]** Ampliar con métricas de riesgo/retorno más allá del P&L simple. Si el período es corto (un solo mes), aclarar que algunas métricas como el Sharpe Ratio requieren una serie temporal más larga para ser estadísticamente significativas. Incluir: Sharpe Ratio (anualizado), Max Drawdown del período, Volatilidad del portfolio, Win Rate de trades, Profit Factor.

| Métrica | Valor Nominal | Valor Real (Ajustado por Inflación) |
| --- | --- | --- |
| **Total de Trades (Cerrados)** | 4 | 4 |
| **Trades Acertados (Ganadores)** | 4 | 4 |
| **Trades Fallados (Perdedores)** | 0 | 0 |
| **Ganancia Total** | +$48,888.86 ARS | +$33,888.86 ARS |
| **Pérdida Total** | -$0.00 ARS | -$0.00 ARS |
| **P&L Operaciones Completadas** | $0.00 ARS | $0.00 ARS |
| **P&L Liquidaciones Fin de Simulación** | $48,888.86 ARS | $33,888.86 ARS |
| **P&L Total (Neto)** | $48,888.86 ARS | $33,888.86 ARS |
| **Win Rate** | 100% | 100% |
| **Profit Factor** | *(completar — no aplica si pérdidas = 0)* | — |
| **Sharpe Ratio** | *(completar)* | — |
| **Max Drawdown** | *(completar)* | — |

---
#### Balance del portfolio: $1,048,888.86 ARS
---

#### 4.5 Comparación con Benchmark

> 📝 **[COMPLETAR]** Comparar el retorno del portfolio contra al menos un benchmark relevante para el mismo período. Opciones sugeridas: (a) Buy & Hold equitativo de todos los bonos disponibles en el universo del test, (b) Buy & Hold del bono más líquido del período (ej: AL30), (c) rendimiento de un plazo fijo en ARS al mismo plazo. El objetivo es responder: ¿el agente agregó valor respecto a una estrategia pasiva?

| Estrategia | Retorno Nominal | Retorno Real |
| --- | --- | --- |
| **Agente BonanzAR (Test 1.3)** | 4.89% | 3.34% |
| **Buy & Hold — universo completo** | *(completar)* | *(completar)* |
| **Buy & Hold — AL30** | *(completar)* | *(completar)* |
| **Plazo Fijo ARS (referencia)** | *(completar)* | *(completar)* |

#### 4.6 Detalle de Trades

| Fecha | Bono | Acción | Cantidad | Pr. Compra (Nom) | Pr. Compra (Real) | Pr. Venta / Liq | P&L Nom ($) | P&L Nom (%) | P&L Real ($) | P&L Real (%) | Resultado |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 2025-06-03 | AL29 | Compra | 2.2751 | $87910.00 | $87910.00 | - | - | - | - | - | N/A |
| 2025-06-03 | AL30 | Compra | 3.6991 | $81100.00 | $81100.00 | - | - | - | - | - | N/A |
| 2025-06-03 | GD29 | Compra | 2.2254 | $89870.00 | $89870.00 | - | - | - | - | - | N/A |
| 2025-06-03 | GD30 | Compra | 3.6062 | $83190.00 | $83190.00 | - | - | - | - | - | N/A |
| 2025-07-03 | AL29 | Liquidación Final | 2.2751 | $87910.00 | $89228.65 | $91730.00 | $8690.71 | 4.35% | $5690.71 | 2.80% | 🟢 GANADOR |
| 2025-07-03 | AL30 | Liquidación Final | 3.6991 | $81100.00 | $82316.50 | $85200.00 | $15166.46 | 5.06% | $10666.46 | 3.50% | 🟢 GANADOR |
| 2025-07-03 | GD29 | Liquidación Final | 2.2254 | $89870.00 | $91218.05 | $94620.00 | $10570.82 | 5.29% | $7570.82 | 3.73% | 🟢 GANADOR |
| 2025-07-03 | GD30 | Liquidación Final | 3.6062 | $83190.00 | $84437.85 | $87200.00 | $14460.87 | 4.82% | $9960.87 | 3.27% | 🟢 GANADOR |

#### 4.7 Evolución del Portfolio

El portfolio comenzó con un capital de $1,000,000.00 ARS.

| Fecha | Efectivo (Cash) | Valor Tenencias | Valor Total (Nominal) | Retorno Nom. | Inflación Acum. | Valor Total (Real) | Retorno Real |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2025-06-03 | $0.00 | $1,000,000.00 | $1,000,000.00 | 0.00% | 0.00% | $1,000,000.00 | 0.00% |
| 2025-07-03 | $1,048,888.86 | $0.00 | $1,048,888.86 | 4.89% | 1.50% | $1,033,388.04 | 3.34% |

#### 4.8 Composición Final del Portfolio

> 📝 **[COMPLETAR]** Describir cómo quedó distribuido el portfolio al cierre de la simulación: qué porcentaje del capital terminó en cada bono o en efectivo. Si hay un gráfico de torta o tabla de asignación, incluirlo aquí.

#### 4.9 Detalle de Predicciones

| Fecha | Bono | Predicción | Precio Inicial | Precio Final | Cambio | Resultado |
| --- | --- | --- | --- | --- | --- | --- |
| 2025-06-03 | AL30 | UP | 81100.00 | 85200.00 | 4100.00 | ✅ ACERTADO |
| 2025-06-03 | GD30 | UP | 83190.00 | 87200.00 | 4010.00 | ✅ ACERTADO |
| 2025-06-03 | AL35 | UP | 81850.00 | 85100.00 | 3250.00 | ✅ ACERTADO |
| 2025-06-03 | GD35 | UP | 82580.00 | 85890.00 | 3310.00 | ✅ ACERTADO |
| 2025-06-03 | AL29 | UP | 87910.00 | 91730.00 | 3820.00 | ✅ ACERTADO |
| 2025-06-03 | GD29 | UP | 89870.00 | 94620.00 | 4750.00 | ✅ ACERTADO |
| 2025-06-03 | AL41 | UP | 75450.00 | 78400.00 | 2950.00 | ✅ ACERTADO |
| 2025-06-03 | GD41 | UP | 76440.00 | 79610.00 | 3170.00 | ✅ ACERTADO |
| 2025-06-03 | AE38 | UP | 85230.00 | 88900.00 | 3670.00 | ✅ ACERTADO |
| 2025-06-03 | GD38 | UP | 87750.00 | 91380.00 | 3630.00 | ✅ ACERTADO |
| 2025-06-03 | AL30 | DOWN | 81100.00 | 85200.00 | 4100.00 | ❌ FALLADO |
| 2025-06-03 | GD30 | DOWN | 83190.00 | 87200.00 | 4010.00 | ❌ FALLADO |
| 2025-06-03 | AL35 | DOWN | 81850.00 | 85100.00 | 3250.00 | ❌ FALLADO |
| 2025-06-03 | GD35 | DOWN | 82580.00 | 85890.00 | 3310.00 | ❌ FALLADO |
| 2025-06-03 | AL41 | DOWN | 75450.00 | 78400.00 | 2950.00 | ❌ FALLADO |
| 2025-06-03 | GD41 | DOWN | 76440.00 | 79610.00 | 3170.00 | ❌ FALLADO |
| 2025-06-03 | GD46 | DOWN | 78990.00 | 82040.00 | 3050.00 | ❌ FALLADO |

---

## 5. Limitaciones y Consideraciones

> 📝 **[COMPLETAR]** Sección honesta sobre los límites de validez de los resultados. Abordar los siguientes puntos (los que apliquen):
> - **Look-ahead bias**: ¿El agente tuvo acceso, aunque sea indirecto, a información futura durante la simulación?
> - **Costos de transacción**: ¿Se modelaron comisiones, spreads bid-ask o impuestos? Si no, ¿cuánto podrían impactar?
> - **Slippage**: ¿Se asumió ejecución al precio exacto? En bonos con baja liquidez esto puede ser significativo.
> - **Liquidez**: ¿Las cantidades operadas son realistas para el mercado de bonos argentino en el período?
> - **Overfitting al período**: Con un solo mes de datos, los resultados pueden ser muy dependientes del contexto macroeconómico puntual.
> - **Sesgo del modelo LLM**: ¿El modelo tiene tendencia a ser optimista (sesgo UP)? ¿Cómo se mitiga?

---

## 6. Conclusiones y Próximos Pasos

> 📝 **[COMPLETAR]** Dos bloques diferenciados:
>
> **Conclusiones**: ¿Qué aprendizajes deja este conjunto de tests? ¿Qué hipótesis se confirmaron o refutaron? ¿El agente mostró capacidad de generar alpha sobre el mercado?
>
> **Próximos Pasos**: Lista de mejoras concretas a implementar en la siguiente iteración. Ejemplos: ampliar el período de backtest, incorporar más modelos LLM, mejorar el prompt de señales DOWN, agregar costos de transacción, testear con restricciones de liquidez, incorporar rebalanceo dinámico.

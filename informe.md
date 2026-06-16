
# Informe General de Backtesting — Agente Causal BonanzAR

---

## 1. Resumen Ejecutivo

Este informe consolida las simulaciones del agente de inversión causal **BonanzAR** para evaluar su viabilidad y robustez en la renta fija argentina. Se analizan dos configuraciones principales: el test base de paso único (**Test 1.3 Base**), que logró un retorno nominal del **4.89%** (real del **3.34%**) y un accuracy global del **58.82%**, y la nueva serie de experimentos de horizonte extendido de 45 días con rebalanceo cada 5 días (**Test 1.4**), evaluados en tres perfiles: *Default* (Predeterminado), *Agresivo* (Agressive) y *Analítico* (Analytical). En esta última serie, la configuración *Analítica* (temperatura 0.00, 20 iteraciones) obtuvo el mejor desempeño con un retorno nominal del **10.99%** (real del **6.78%**), mientras que el perfil *Agresivo* registró un retorno nominal de **7.02%**. A pesar del buen desempeño financiero, persisten desafíos en la precisión de las señales bajistas (DOWN) en todas las configuraciones, evidenciando áreas críticas de optimización en la calibración causal del modelo.

---

## 2. Metodología

El backtest se organiza de forma tal que el agente considere tanto los activos con señales de baja de precios (**DOWN**) como aquellos con señales de alza (**UP**). A partir de la consolidación de ambos análisis causales, se instruye al agente para que proponga la composición óptima del portafolio.

Para determinar las señales alcistas, se utiliza un prompt con la siguiente pregunta disparadora: 
`¿Cuáles subirán de precio en el corto plazo debido a factores macroeconómicos y políticos (...)?`. 

A partir de ella, el agente realiza las siguientes acciones secuenciales:
1. **Consulta al grafo**: Identifica en el grafo de conocimiento causal las variables macroeconómicas clave para fundamentar las alzas de los bonos.
2. **Petición de datos**: Consulta la base de datos histórica para obtener las variables macroeconómicas del día correspondiente.
3. **Inferencia causal**: Evalúa qué señales causales están activas en el grafo y elabora una justificación estructurada.

**Ejemplo de respuesta causal (Inferencia)**:
```
Strong Fiscal Surplus → Lower Default Risk → Lower Country Risk → Higher Bond Prices.
Low Inflation → Lower pressure on the exchange rate → Stability in Hard Dollar bonds.
```

Se realiza un proceso análogo para determinar qué bonos bajarán de precio (`¿Cuáles bajarán de precio en el corto plazo?`).

Finalmente, para la asignación de activos en el portafolio, se le proporciona al agente la lista de precios actuales junto con las justificaciones causales UP y DOWN. En caso de obtener causales contradictorias para un mismo bono, el agente ejecuta el proceso de `REBALANCE`, analizando el score (soporte lógico y cuantitativo de las noticias) de cada conexión para determinar si prevalece el camino alcista o el bajista.

**Ejemplo de Prompt**

El siguiente fragmento ilustra un prompt generado para el agente de portafolio, consolidando la información de las señales ("cuáles bajarán de precio" y "cuáles subirán de precio"):

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

| Versión | Modelo | Período | Capital Inicial | Retorno Nom. | Retorno Real | Accuracy | Cambios |
|:---------------------|:------------|:--------------------|:----------------|:-------------|:-------------|:---------|:---------------------------------------------------------------------------------------------------|
| **Test 1.3 (Base)** | `gemma-4-31b-it` | 2025-06-03 → 2025-06-03 | $1,000,000 ARS | 4.89% | 3.34% | 58.82% | Rango 1 día (horizonte 30d), permitiendo evaluar la decisión pura del agente. |
| **Test 1.4 (Predeterminado)** | `gemma-4-31b-it` | 2025-06-05 → 2025-07-03 | $1,000,000 ARS | 9.51% | 5.36% | 46.24% | Rango 45 días (rebalanceo cada 5 días, temp 0.20, máx 10 iteraciones). |
| **Test 1.4 (Agresivo)** | `gemma-4-31b-it` | 2025-06-05 → 2025-07-03 | $1,000,000 ARS | 7.02% | 2.96% | 44.16% | Rango 45 días (rebalanceo cada 5 días, temp 0.50, máx 10 iteraciones). Mayor simetría de señales UP/DOWN. |
| **Test 1.4 (Analítico)** | `gemma-4-31b-it` | 2025-06-05 → 2025-07-03 | $1,000,000 ARS | 10.99% | 6.78% | 49.15% | Rango 45 días (rebalanceo cada 5 días, temp 0.00, máx 20 iteraciones). Mejor desempeño predictivo y de retorno. |

---

## 4. Resultados por Test

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

La matriz de confusión se estructura asumiendo la dirección **UP (Alza)** como la clase positiva y **DOWN (Baja)** como la clase negativa. Durante este período, el mercado fue íntegramente alcista, por lo que todos los bonos en el universo de test registraron un cambio de precio positivo al cierre de los 30 días (0 reales DOWN, 17 reales UP). 

El agente emitió 10 señales de UP (todas correctas) y 7 señales de DOWN (todas incorrectas, ya que esos bonos también subieron de precio). Esto evidencia un **sesgo optimista (UP bias)** del LLM y una dificultad para identificar tendencias bajistas o de sobrecompra en un contexto macro de estabilización.

| | Predicho UP | Predicho DOWN |
| --- | --- | --- |
| **Real UP** | VP = 10 | FN = 7 |
| **Real DOWN** | FP = 0 | VN = 0 |

| Métrica | UP | DOWN |
| --- | --- | --- |
| **Precisión** | 100.00% | 0.00% |
| **Recall** | 58.82% | 0.00% |
| **F1-Score** | 74.07% | 0.00% |

*Nota: El Recall de DOWN (VN / (VN + FP)) resulta en 0/0. Dado que no existieron bajas reales en el mercado durante este período, no es estadísticamente computable, pero se reporta como 0% dado el error sistemático del agente en las predicciones negativas.*

#### 4.4 Métricas de Rendimiento del Portfolio

Debido a que el Test 1.3 (Base) se diseñó como un test de paso único (compra inicial el 03/06/2025 y liquidación final a los 30 días el 03/07/2025), no se dispone de una serie temporal diaria intermedia de retornos dentro del mes. Por ende, métricas de volatilidad y Sharpe Ratio no son representativas en esta simulación y se marcan como no aplicables (N/A). El Max Drawdown se ubica en 0.00% al no registrarse fluctuaciones entre los dos puntos de valuación.

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
| **Profit Factor** | N/A (Pérdidas = 0) | — |
| **Sharpe Ratio** | N/A (Paso Único) | — |
| **Max Drawdown** | 0.00% | — |

---
#### Balance del portfolio: $1,048,888.86 ARS
---

#### 4.5 Comparación con Benchmark

El agente **BonanzAR** agregó un valor significativo frente al promedio del mercado (Buy & Hold diversificado) y los depósitos bancarios de tasa fija, demostrando capacidad de selección de activos. No obstante, rindió ligeramente por debajo del instrumento estrella del período (AL30) debido a la diversificación en bonos con menor tasa de apreciación (como AL29 y GD30).

| Estrategia | Retorno Nominal | Retorno Real |
| --- | --- | --- |
| **Agente BonanzAR (Test 1.3)** | 4.89% | 3.34% |
| **Buy & Hold — universo completo** | 0.92% | -0.57% |
| **Buy & Hold — AL30** | 5.06% | 3.50% |
| **Plazo Fijo ARS (referencia)** | 2.63% | 1.11% |

*Notas sobre los Benchmarks:*
* **Buy & Hold - universo completo**: Rendimiento promedio de los 31 bonos disponibles el 03/06/2025 (incluyendo soberanos en pesos CER, Badlar, Dollar-Linked y Hard Dollar). Su bajo rendimiento se debe al arrastre de los activos en pesos (como DICP y DIP0 que cayeron ~9.5%).
* **Plazo Fijo ARS**: Simulado a partir de la tasa Badlar registrada en base de datos para la fecha (32% TNA), pagando 2.63% nominal a 30 días.

#### 4.6 Detalle de Trades

| Fecha | Bono | Acción | Cantidad | Pr. Compra (Nom) | Pr. Compra (Real) | Pr. Venta / Liq | P&L Nom ($) | P&L Nom (%) | P&L Real ($) | P&L Real (%) | Resultado |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 2025-06-03 | AL29 | Compra | 2.2751 | $87910.00 | $87910.00 | - | - | - | - | - | N/A |
| 2025-06-03 | AL30 | Compra | 3.6991 | $81100.00 | $81100.00 | - | - | - | - | - | N/A |
| 2025-06-03 | GD29 | Compra | 2.2254 | $89870.00 | $89870.00 | - | - | - | - | - | N/A |
| 2025-06-03 | GD30 | Compra | 3.6062 | $83190.00 | $83190.00 | - | - | - | - | - | N/A |
| 2025-07-03 | AL29 | Liquidación Final | 2.2751 | $87910.00 | $89228.65 | $91730.00 | $8690.71 | 4.35% | $5690.71 | 2.80% | GANADOR |
| 2025-07-03 | AL30 | Liquidación Final | 3.6991 | $81100.00 | $82316.50 | $85200.00 | $15166.46 | 5.06% | $10666.46 | 3.50% | GANADOR |
| 2025-07-03 | GD29 | Liquidación Final | 2.2254 | $89870.00 | $91218.05 | $94620.00 | $10570.82 | 5.29% | $7570.82 | 3.73% | GANADOR |
| 2025-07-03 | GD30 | Liquidación Final | 3.6062 | $83190.00 | $84437.85 | $87200.00 | $14460.87 | 4.82% | $9960.87 | 3.27% | GANADOR |

#### 4.7 Evolución del Portfolio

El portfolio comenzó con un capital de $1,000,000.00 ARS.

| Fecha | Efectivo (Cash) | Valor Tenencias | Valor Total (Nominal) | Retorno Nom. | Inflación Acum. | Valor Total (Real) | Retorno Real |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2025-06-03 | $0.00 | $1,000,000.00 | $1,000,000.00 | 0.00% | 0.00% | $1,000,000.00 | 0.00% |
| 2025-07-03 | $1,048,888.86 | $0.00 | $1,048,888.86 | 4.89% | 1.50% | $1,033,388.04 | 3.34% |

#### 4.8 Composición Final del Portfolio

El portfolio se estructuró inicialmente el 03/06/2025 con una asignación del 100% del capital en bonos Hard Dollar:
* **AL30**: 30% (\$300,000.00 ARS)
* **GD30**: 30% (\$300,000.00 ARS)
* **AL29**: 20% (\$200,000.00 ARS)
* **GD29**: 20% (\$200,000.00 ARS)

Al cierre del horizonte del test (03/07/2025), se ejecutó una **liquidación final obligatoria** (todas las tenencias se vendieron a precio de mercado para volver a efectivo). Por lo tanto, el portfolio finalizó **100% en efectivo (ARS)**, con un saldo líquido de **\$1,048,888.86 ARS**.

Justo antes de la liquidación, la distribución por valor de mercado era:
* **AL30**: 30.05%
* **GD30**: 29.98%
* **GD29**: 20.08%
* **AL29**: 19.90%

#### 4.9 Detalle de Predicciones

| Fecha | Bono | Predicción | Precio Inicial | Precio Final | Cambio | Resultado |
| --- | --- | --- | --- | --- | --- | --- |
| 2025-06-03 | AL30 | UP | 81100.00 | 85200.00 | 4100.00 | ACERTADO |
| 2025-06-03 | GD30 | UP | 83190.00 | 87200.00 | 4010.00 | ACERTADO |
| 2025-06-03 | AL35 | UP | 81850.00 | 85100.00 | 3250.00 | ACERTADO |
| 2025-06-03 | GD35 | UP | 82580.00 | 85890.00 | 3310.00 | ACERTADO |
| 2025-06-03 | AL29 | UP | 87910.00 | 91730.00 | 3820.00 | ACERTADO |
| 2025-06-03 | GD29 | UP | 89870.00 | 94620.00 | 4750.00 | ACERTADO |
| 2025-06-03 | AL41 | UP | 75450.00 | 78400.00 | 2950.00 | ACERTADO |
| 2025-06-03 | GD41 | UP | 76440.00 | 79610.00 | 3170.00 | ACERTADO |
| 2025-06-03 | AE38 | UP | 85230.00 | 88900.00 | 3670.00 | ACERTADO |
| 2025-06-03 | GD38 | UP | 87750.00 | 91380.00 | 3630.00 | ACERTADO |
| 2025-06-03 | AL30 | DOWN | 81100.00 | 85200.00 | 4100.00 | FALLADO |
| 2025-06-03 | GD30 | DOWN | 83190.00 | 87200.00 | 4010.00 | FALLADO |
| 2025-06-03 | AL35 | DOWN | 81850.00 | 85100.00 | 3250.00 | FALLADO |
| 2025-06-03 | GD35 | DOWN | 82580.00 | 85890.00 | 3310.00 | FALLADO |
| 2025-06-03 | AL41 | DOWN | 75450.00 | 78400.00 | 2950.00 | FALLADO |
| 2025-06-03 | GD41 | DOWN | 76440.00 | 79610.00 | 3170.00 | FALLADO |
| 2025-06-03 | GD46 | DOWN | 78990.00 | 82040.00 | 3050.00 | FALLADO |

### Test 1.4 (Predeterminado) — `gemma-4-31b-it`

**Modelo Utilizado**: `gemma-4-31b-it` (temperatura 0.20, máx. iteraciones 10)

#### 4.1 Parámetros de la Simulación

- **Rango de Fechas**: Desde 2025-06-05 hasta 2025-07-03 (con liquidación final el 2025-08-17)
- **Horizonte de Evaluación**: 45 días
- **Paso temporal**: 5 días
- **Restricción de Tickers**: Ninguna

#### 4.2 Resumen de Métricas de Predicción

| Métrica | Valor |
| --- | --- |
| **Predicciones Totales** | 93 |
| **Predicciones Correctas** | 43 |
| **Accuracy Global** | 46.24% |
| **Precisión Alzas (UP)** | 51.56% (33/64) |
| **Precisión Bajas (DOWN)** | 34.48% (10/29) |

#### 4.3 Análisis de Señales (Matriz de Confusión)

La matriz de confusión se estructura asumiendo la dirección **UP (Alza)** como la clase positiva y **DOWN (Baja)** como la clase negativa. 

El agente predeterminado (Default) muestra una distribución de predicciones desbalanceada hacia la dirección UP (64 de 93 totales). El accuracy general fue de 46.24%. Registra una precisión aceptable en alzas (51.56%) pero un recall muy bajo en bajas (24.39%), indicando que la mayor parte de las bajas del mercado no fueron anticipadas por el agente.

| | Predicho UP | Predicho DOWN |
| --- | --- | --- |
| **Real UP** | VP = 33 | FN = 19 |
| **Real DOWN** | FP = 31 | VN = 10 |

| Métrica | UP | DOWN |
| --- | --- | --- |
| **Precisión** | 51.56% | 34.48% |
| **Recall** | 63.46% | 24.39% |
| **F1-Score** | 56.89% | 28.57% |

#### 4.4 Métricas de Rendimiento del Portfolio

| Métrica | Valor Nominal | Valor Real (Ajustado por Inflación) |
| --- | --- | --- |
| **Total de Trades (Cerrados)** | 3 | 3 |
| **Trades Acertados (Ganadores)** | 3 | 3 |
| **Trades Fallados (Perdedores)** | 0 | 0 |
| **Ganancia Total** | +$95,139.85 ARS | +$55,248.84 ARS |
| **Pérdida Total** | -$0.00 ARS | -$0.00 ARS |
| **P&L Operaciones Completadas** | $33,150.80 ARS | $19,835.14 ARS |
| **P&L Liquidaciones Fin de Simulación** | $61,989.05 ARS | $35,413.70 ARS |
| **P&L Cobro Cupones y Amortizaciones** | $0.00 ARS | $0.00 ARS |
| **P&L Total (Neto)** | $95,139.85 ARS | $55,248.84 ARS |

---
#### Balance del portfolio final: $1,095,139.85 ARS
---

#### 4.5 Comparación con Benchmark

Para esta versión con ventana extendida y rebalanceos parciales a 45 días, no se computaron los benchmarks tradicionales en pesos/dólares por las diferencias en la periodicidad y liquidación respecto de la serie temporal original.

#### 4.6 Detalle de Trades

| Fecha | Bono | Acción | Cantidad | Pr. Compra (Nom) | Pr. Compra (Real) | Pr. Venta / Liq | P&L Nom ($) | P&L Nom (%) | P&L Real ($) | P&L Real (%) | Resultado |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 2025-06-05 | AL30 | Compra | 624.3756 | $800.80 | $800.80 | - | - | - | - | - | N/A |
| 2025-06-05 | GD30 | Compra | 607.1645 | $823.50 | $823.50 | - | - | - | - | - | N/A |
| 2025-06-30 | AL30 | Venta Total | 624.3756 | $800.80 | $811.46 | $829.00 | $17607.39 | 3.52% | $10949.56 | 2.16% | GANADOR |
| 2025-06-30 | GD30 | Venta Total | 607.1645 | $823.50 | $834.47 | $849.10 | $15543.41 | 3.11% | $8885.58 | 1.75% | GANADOR |
| 2025-06-30 | TZV26 | Compra | 898.3920 | $1150.00 | $1150.00 | - | - | - | - | - | N/A |
| 2025-08-17 | TZV26 | Liquidación Final | 898.3920 | $1150.00 | $1179.58 | $1219.00 | $61989.05 | 6.00% | $35413.70 | 3.34% | GANADOR |

#### 4.7 Evolución del Portfolio

El portfolio comenzó con un capital de $1,000,000.00 ARS.

| Fecha | Efectivo (Cash) | Valor Tenencias | Valor Total (Nominal) | Retorno Nom. | Inflación Acum. | Valor Total (Real) | Retorno Real |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2025-06-05 | $0.00 | $1,000,000.00 | $1,000,000.00 | 0.00% | 0.00% | $1,000,000.00 | 0.00% |
| 2025-06-10 | $0.00 | $1,021,052.45 | $1,021,052.45 | 2.11% | 0.25% | $1,018,521.92 | 1.85% |
| 2025-06-15 | $0.00 | $1,004,086.46 | $1,004,086.46 | 0.41% | 0.53% | $998,787.75 | -0.12% |
| 2025-06-20 | $0.00 | $985,230.12 | $985,230.12 | -1.48% | 0.80% | $977,441.62 | -2.26% |
| 2025-06-25 | $0.00 | $1,028,441.69 | $1,028,441.69 | 2.84% | 1.06% | $1,017,615.86 | 1.76% |
| 2025-06-30 | $0.00 | $1,033,150.80 | $1,033,150.80 | 3.32% | 1.33% | $1,019,574.49 | 1.96% |
| 2025-08-17 | $1,095,139.85 | $0.00 | $1,095,139.85 | 9.51% | 3.94% | $1,053,646.41 | 5.36% |

#### 4.8 Composición Final del Portfolio

Al cierre del horizonte del test (17/08/2025), se ejecutó una liquidación final obligatoria. Por lo tanto, el portfolio finalizó 100% en efectivo (ARS), con un saldo líquido de $1,095,139.85 ARS.

#### 4.9 Detalle de Predicciones

| Fecha | Bono | Predicción | Precio Inicial | Precio Final | Cambio | Resultado |
| --- | --- | --- | --- | --- | --- | --- |
| 2025-06-05 | AL30 | UP | 800.80 | 762.00 | -38.80 | FALLADO |
| 2025-06-05 | GD30 | UP | 823.50 | 783.00 | -40.50 | FALLADO |
| 2025-06-05 | AL29 | UP | 871.40 | 802.60 | -68.80 | FALLADO |
| 2025-06-05 | GD29 | UP | 889.50 | 824.90 | -64.60 | FALLADO |
| 2025-06-05 | AL35 | UP | 805.00 | 824.00 | 19.00 | ACERTADO |
| 2025-06-05 | GD35 | UP | 812.00 | 840.00 | 28.00 | ACERTADO |
| 2025-06-05 | AL30D | UP | 801.62 | 763.67 | -37.95 | FALLADO |
| 2025-06-05 | GD30D | UP | 820.00 | 785.81 | -34.19 | FALLADO |
| 2025-06-10 | AL30 | UP | 817.50 | 770.30 | -47.20 | FALLADO |
| 2025-06-10 | GD30 | UP | 841.00 | 795.00 | -46.00 | FALLADO |
| 2025-06-10 | GD35 | UP | 828.30 | 849.00 | 20.70 | ACERTADO |
| 2025-06-10 | AL35 | UP | 821.90 | 836.10 | 14.20 | ACERTADO |
| 2025-06-10 | GD41 | UP | 765.80 | 785.00 | 19.20 | ACERTADO |
| 2025-06-10 | AL41 | UP | 752.60 | 764.00 | 11.40 | ACERTADO |
| 2025-06-10 | AE38 | UP | 858.80 | 873.40 | 14.60 | ACERTADO |
| 2025-06-10 | GD46 | DOWN | 788.50 | 789.90 | 1.40 | FALLADO |
| 2025-06-10 | GD46D | DOWN | 788.97 | 792.18 | 3.21 | FALLADO |
| 2025-06-10 | GD41 | DOWN | 765.80 | 785.00 | 19.20 | FALLADO |
| 2025-06-10 | GD41D | DOWN | 767.40 | 787.02 | 19.62 | FALLADO |
| 2025-06-10 | AL41 | DOWN | 752.60 | 764.00 | 11.40 | FALLADO |
| 2025-06-10 | AL41D | DOWN | 756.32 | 767.67 | 11.35 | FALLADO |
| 2025-06-15 | AE38 | UP | 846.30 | 898.60 | 52.30 | ACERTADO |
| 2025-06-15 | AL29 | UP | 870.80 | 830.00 | -40.80 | FALLADO |
| 2025-06-15 | AL30 | UP | 805.40 | 799.50 | -5.90 | FALLADO |
| 2025-06-15 | AL35 | UP | 812.80 | 867.70 | 54.90 | ACERTADO |
| 2025-06-15 | AL41 | UP | 743.20 | 796.00 | 52.80 | ACERTADO |
| 2025-06-15 | GD29 | UP | 890.00 | 858.40 | -31.60 | FALLADO |
| 2025-06-15 | GD30 | UP | 825.50 | 822.50 | -3.00 | FALLADO |
| 2025-06-15 | GD35 | UP | 814.50 | 876.50 | 62.00 | ACERTADO |
| 2025-06-15 | GD38 | UP | 870.60 | 940.60 | 70.00 | ACERTADO |
| 2025-06-15 | GD41 | UP | 755.90 | 816.70 | 60.80 | ACERTADO |
| 2025-06-15 | GD46 | UP | 783.00 | 817.00 | 34.00 | ACERTADO |
| 2025-06-15 | GD29D | UP | 893.84 | 859.28 | -34.56 | FALLADO |
| 2025-06-15 | GD30D | UP | 827.87 | 824.85 | -3.02 | FALLADO |
| 2025-06-15 | GD38D | UP | 872.01 | 937.92 | 65.91 | ACERTADO |
| 2025-06-15 | GD35D | UP | 815.94 | 879.40 | 63.46 | ACERTADO |
| 2025-06-15 | GD41D | UP | 756.30 | 816.25 | 59.95 | ACERTADO |
| 2025-06-15 | GD46D | UP | 784.69 | 827.10 | 42.41 | ACERTADO |
| 2025-06-15 | AL29D | UP | 874.16 | 839.15 | -35.01 | FALLADO |
| 2025-06-15 | AL30D | UP | 805.92 | 800.49 | -5.43 | FALLADO |
| 2025-06-15 | AE38D | UP | 847.08 | 906.94 | 59.86 | ACERTADO |
| 2025-06-15 | AL35D | UP | 811.17 | 870.53 | 59.36 | ACERTADO |
| 2025-06-15 | AL41D | UP | 744.49 | 798.77 | 54.28 | ACERTADO |
| 2025-06-15 | TZX27 | UP | 2.41 | 2.31 | -0.10 | FALLADO |
| 2025-06-15 | TX31 | UP | 9.53 | 9.17 | -0.36 | FALLADO |
| 2025-06-15 | DICP | UP | 417.05 | 362.50 | -54.55 | FALLADO |
| 2025-06-15 | DIP0 | UP | 415.40 | 355.60 | -59.80 | FALLADO |
| 2025-06-15 | PARP | UP | 224.00 | 214.40 | -9.60 | FALLADO |
| 2025-06-15 | PAP0 | UP | 223.55 | 210.60 | -12.95 | FALLADO |
| 2025-06-15 | CUAP | UP | 278.80 | 257.80 | -21.00 | FALLADO |
| 2025-06-20 | AL30 | UP | 789.30 | 812.20 | 22.90 | ACERTADO |
| 2025-06-20 | GD30 | UP | 811.00 | 839.00 | 28.00 | ACERTADO |
| 2025-06-20 | AL35 | UP | 791.50 | 875.50 | 84.00 | ACERTADO |
| 2025-06-20 | GD35 | UP | 797.00 | 892.80 | 95.80 | ACERTADO |
| 2025-06-20 | AL41 | UP | 724.90 | 805.50 | 80.60 | ACERTADO |
| 2025-06-20 | GD41 | UP | 733.60 | 824.30 | 90.70 | ACERTADO |
| 2025-06-20 | TZX27 | DOWN | 2.43 | 2.39 | -0.04 | ACERTADO |
| 2025-06-20 | TX31 | DOWN | 9.69 | 9.14 | -0.54 | ACERTADO |
| 2025-06-20 | DICP | DOWN | 413.50 | 367.80 | -45.70 | ACERTADO |
| 2025-06-20 | DIP0 | DOWN | 414.20 | 361.60 | -52.60 | ACERTADO |
| 2025-06-20 | PARP | DOWN | 225.00 | 217.00 | -8.00 | ACERTADO |
| 2025-06-20 | PAP0 | DOWN | 230.00 | 217.50 | -12.50 | ACERTADO |
| 2025-06-20 | CUAP | DOWN | 278.60 | 264.80 | -13.80 | ACERTADO |
| 2025-06-25 | AL30 | UP | 823.50 | 804.00 | -19.50 | FALLADO |
| 2025-06-25 | GD30 | UP | 847.00 | 833.00 | -14.00 | FALLADO |
| 2025-06-25 | AL35 | UP | 826.70 | 875.20 | 48.50 | ACERTADO |
| 2025-06-25 | GD35 | UP | 835.80 | 888.50 | 52.70 | ACERTADO |
| 2025-06-25 | AL29 | UP | 890.00 | 841.40 | -48.60 | FALLADO |
| 2025-06-25 | GD29 | UP | 919.50 | 873.70 | -45.80 | FALLADO |
| 2025-06-25 | AL35 | DOWN | 826.70 | 875.20 | 48.50 | FALLADO |
| 2025-06-25 | GD35 | DOWN | 835.80 | 888.50 | 52.70 | FALLADO |
| 2025-06-25 | AL41 | DOWN | 753.60 | 799.90 | 46.30 | FALLADO |
| 2025-06-25 | GD41 | DOWN | 768.70 | 821.00 | 52.30 | FALLADO |
| 2025-06-25 | GD46 | DOWN | 790.00 | 811.30 | 21.30 | FALLADO |
| 2025-06-25 | GD38 | DOWN | 884.00 | 946.60 | 62.60 | FALLADO |
| 2025-06-25 | AE38 | DOWN | 862.00 | 908.60 | 46.60 | FALLADO |
| 2025-06-30 | AL30 | UP | 829.00 | 796.00 | -33.00 | FALLADO |
| 2025-06-30 | GD30 | UP | 849.10 | 820.50 | -28.60 | FALLADO |
| 2025-06-30 | AL35 | UP | 831.00 | 860.10 | 29.10 | ACERTADO |
| 2025-06-30 | GD35 | UP | 839.00 | 881.90 | 42.90 | ACERTADO |
| 2025-06-30 | AL29 | UP | 898.00 | 827.60 | -70.40 | FALLADO |
| 2025-06-30 | GD29 | UP | 924.80 | 861.00 | -63.80 | FALLADO |
| 2025-06-30 | AL41 | UP | 763.40 | 794.20 | 30.80 | ACERTADO |
| 2025-06-30 | GD41 | UP | 777.00 | 816.20 | 39.20 | ACERTADO |
| 2025-06-30 | AL30 | DOWN | 829.00 | 796.00 | -33.00 | ACERTADO |
| 2025-06-30 | GD30 | DOWN | 849.10 | 820.50 | -28.60 | ACERTADO |
| 2025-06-30 | AL35 | DOWN | 831.00 | 860.10 | 29.10 | FALLADO |
| 2025-06-30 | GD35 | DOWN | 839.00 | 881.90 | 42.90 | FALLADO |
| 2025-06-30 | AL41 | DOWN | 763.40 | 794.20 | 30.80 | FALLADO |
| 2025-06-30 | GD41 | DOWN | 777.00 | 816.20 | 39.20 | FALLADO |
| 2025-06-30 | GD46 | DOWN | 800.80 | 811.70 | 10.90 | FALLADO |
| 2025-06-30 | GD38 | DOWN | 894.00 | 938.80 | 44.80 | FALLADO |
| 2025-06-30 | GD29 | DOWN | 924.80 | 861.00 | -63.80 | ACERTADO |

### Test 1.4 (Agresivo) — `gemma-4-31b-it`

**Modelo Utilizado**: `gemma-4-31b-it` (temperatura 0.50, máx. iteraciones 10)

#### 4.1 Parámetros de la Simulación

- **Rango de Fechas**: Desde 2025-06-05 hasta 2025-07-03 (con liquidación final el 2025-08-17)
- **Horizonte de Evaluación**: 45 días
- **Paso temporal**: 5 días
- **Restricción de Tickers**: Ninguna

#### 4.2 Resumen de Métricas de Predicción

| Métrica | Valor |
| --- | --- |
| **Predicciones Totales** | 77 |
| **Predicciones Correctas** | 34 |
| **Accuracy Global** | 44.16% |
| **Precisión Alzas (UP)** | 52.94% (18/34) |
| **Precisión Bajas (DOWN)** | 37.21% (16/43) |

#### 4.3 Análisis de Señales (Matriz de Confusión)

La matriz de confusión se estructura asumiendo la dirección **UP (Alza)** como la clase positiva y **DOWN (Baja)** como la clase negativa. 

Con una mayor temperatura (0.50), la versión agresiva (Agressive) logró un comportamiento más simétrico en la distribución de señales (34 UP vs 43 DOWN). Sin embargo, el accuracy se deterioró al 44.16%. Logró un recall de bajas del 50.00%, superior a la versión default, pero a costa de un recall de alzas significativamente menor (40.00%).

| | Predicho UP | Predicho DOWN |
| --- | --- | --- |
| **Real UP** | VP = 18 | FN = 27 |
| **Real DOWN** | FP = 16 | VN = 16 |

| Métrica | UP | DOWN |
| --- | --- | --- |
| **Precisión** | 52.94% | 37.21% |
| **Recall** | 40.00% | 50.00% |
| **F1-Score** | 45.57% | 42.67% |

#### 4.4 Métricas de Rendimiento del Portfolio

| Métrica | Valor Nominal | Valor Real (Ajustado por Inflación) |
| --- | --- | --- |
| **Total de Trades (Cerrados)** | 4 | 4 |
| **Trades Acertados (Ganadores)** | 0 | 0 |
| **Trades Fallados (Perdedores)** | 4 | 4 |
| **Ganancia Total** | +$13,272.15 ARS | +$0.00 ARS |
| **Pérdida Total** | -$0.00 ARS | -$23,480.22 ARS |
| **P&L Operaciones Completadas** | $3,942.38 ARS | $-4,025.88 ARS |
| **P&L Liquidaciones Fin de Simulación** | $9,329.77 ARS | $-19,454.34 ARS |
| **P&L Cobro Cupones y Amortizaciones** | $51,601.69 ARS | $49,884.66 ARS |
| **P&L Total (Neto)** | $64,873.84 ARS | $26,404.44 ARS |

---
#### Balance del portfolio final: $1,070,181.50 ARS
---

#### 4.5 Comparación con Benchmark

Para esta versión con ventana extendida y rebalanceos parciales a 45 días, no se computaron los benchmarks tradicionales en pesos/dólares por las diferencias en la periodicidad y liquidación respecto de la serie temporal original.

#### 4.6 Detalle de Trades

| Fecha | Bono | Acción | Cantidad | Pr. Compra (Nom) | Pr. Compra (Real) | Pr. Venta / Liq | P&L Nom ($) | P&L Nom (%) | P&L Real ($) | P&L Real (%) | Resultado |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 2025-06-05 | DICP | Compra | 1214.3291 | $411.75 | $411.75 | - | - | - | - | - | N/A |
| 2025-06-05 | DIP0 | Compra | 1211.5338 | $412.70 | $412.70 | - | - | - | - | - | N/A |
| 2025-06-20 | DICP | Venta Total | 1214.3291 | $411.75 | $415.03 | $413.50 | $2125.08 | 0.43% | $-1859.05 | -0.37% | PERDEDOR |
| 2025-06-20 | DIP0 | Venta Total | 1211.5338 | $412.70 | $415.99 | $414.20 | $1817.30 | 0.36% | $-2166.83 | -0.43% | PERDEDOR |
| 2025-06-20 | AL30 | Compra | 635.9701 | $789.30 | $789.30 | - | - | - | - | - | N/A |
| 2025-06-20 | GD30 | Compra | 618.9534 | $811.00 | $811.00 | - | - | - | - | - | N/A |
| 2025-07-09 | AL30 | Cobro Amortización | 50.8776 | - | - | $1260.10 | $23953.18 | - | $23127.61 | - | COBRADO |
| 2025-07-09 | AL30 | Cobro Interés | 585.0925 | - | - | $4.69 | $2742.06 | - | $2693.17 | - | COBRADO |
| 2025-07-09 | GD30 | Cobro Amortización | 49.5163 | - | - | $1260.10 | $22237.76 | - | $21442.77 | - | COBRADO |
| 2025-07-09 | GD30 | Cobro Interés | 569.4371 | - | - | $4.69 | $2668.69 | - | $2621.11 | - | COBRADO |
| 2025-08-17 | AL30 | Liquidación Final | 585.0925 | $789.30 | $813.90 | $796.00 | $3920.12 | 0.85% | $-10471.94 | -2.20% | PERDEDOR |
| 2025-08-17 | GD30 | Liquidación Final | 569.4371 | $811.00 | $836.27 | $820.50 | $5409.65 | 1.17% | $-8982.40 | -1.89% | PERDEDOR |

#### 4.7 Evolución del Portfolio

El portfolio comenzó con un capital de $1,000,000.00 ARS.

| Fecha | Efectivo (Cash) | Valor Tenencias | Valor Total (Nominal) | Retorno Nom. | Inflación Acum. | Valor Total (Real) | Retorno Real |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2025-06-05 | $0.00 | $1,000,000.00 | $1,000,000.00 | 0.00% | 0.00% | $1,000,000.00 | 0.00% |
| 2025-06-10 | $0.00 | $994,730.81 | $994,730.81 | -0.53% | 0.25% | $992,265.51 | -0.77% |
| 2025-06-15 | $0.00 | $1,009,707.09 | $1,009,707.09 | 0.97% | 0.53% | $1,004,378.72 | 0.44% |
| 2025-06-20 | $0.00 | $1,003,942.38 | $1,003,942.38 | 0.39% | 0.80% | $996,005.95 | -0.40% |
| 2025-06-25 | $0.00 | $1,047,974.88 | $1,047,974.88 | 4.80% | 1.06% | $1,036,943.44 | 3.69% |
| 2025-06-30 | $0.00 | $1,052,772.51 | $1,052,772.51 | 5.28% | 1.33% | $1,038,938.35 | 3.89% |
| 2025-08-17 | $1,070,181.50 | $0.00 | $1,070,181.50 | 7.02% | 3.94% | $1,029,633.70 | 2.96% |

#### 4.8 Composición Final del Portfolio

Al cierre del horizonte del test (17/08/2025), se ejecutó una liquidación final obligatoria. Por lo tanto, el portfolio finalizó 100% en efectivo (ARS), con un saldo líquido de $1,070,181.50 ARS.

#### 4.9 Detalle de Predicciones

| Fecha | Bono | Predicción | Precio Inicial | Precio Final | Cambio | Resultado |
| --- | --- | --- | --- | --- | --- | --- |
| 2025-06-05 | AL30 | UP | 800.80 | 762.00 | -38.80 | FALLADO |
| 2025-06-05 | GD30 | UP | 823.50 | 783.00 | -40.50 | FALLADO |
| 2025-06-05 | AL29 | UP | 871.40 | 802.60 | -68.80 | FALLADO |
| 2025-06-05 | GD29 | UP | 889.50 | 824.90 | -64.60 | FALLADO |
| 2025-06-05 | AL30 | DOWN | 800.80 | 762.00 | -38.80 | ACERTADO |
| 2025-06-05 | GD30 | DOWN | 823.50 | 783.00 | -40.50 | ACERTADO |
| 2025-06-05 | AL35 | DOWN | 805.00 | 824.00 | 19.00 | FALLADO |
| 2025-06-05 | GD35 | DOWN | 812.00 | 840.00 | 28.00 | FALLADO |
| 2025-06-05 | AL41 | DOWN | 744.90 | 756.80 | 11.90 | FALLADO |
| 2025-06-05 | GD41 | DOWN | 753.00 | 779.00 | 26.00 | FALLADO |
| 2025-06-05 | AE38 | DOWN | 840.60 | 861.30 | 20.70 | FALLADO |
| 2025-06-05 | GD38 | DOWN | 866.50 | 894.00 | 27.50 | FALLADO |
| 2025-06-05 | AL30D | DOWN | 801.62 | 763.67 | -37.95 | ACERTADO |
| 2025-06-05 | GD30D | DOWN | 820.00 | 785.81 | -34.19 | ACERTADO |
| 2025-06-05 | AL35D | DOWN | 809.14 | 828.67 | 19.53 | FALLADO |
| 2025-06-05 | GD35D | DOWN | 814.63 | 842.66 | 28.02 | FALLADO |
| 2025-06-10 | AL30 | UP | 817.50 | 770.30 | -47.20 | FALLADO |
| 2025-06-10 | GD30 | UP | 841.00 | 795.00 | -46.00 | FALLADO |
| 2025-06-10 | GD35 | UP | 828.30 | 849.00 | 20.70 | ACERTADO |
| 2025-06-10 | GD41 | UP | 765.80 | 785.00 | 19.20 | ACERTADO |
| 2025-06-10 | AE38 | UP | 858.80 | 873.40 | 14.60 | ACERTADO |
| 2025-06-10 | GD46 | DOWN | 788.50 | 789.90 | 1.40 | FALLADO |
| 2025-06-10 | AL41 | DOWN | 752.60 | 764.00 | 11.40 | FALLADO |
| 2025-06-10 | GD29D | DOWN | 903.15 | 834.50 | -68.64 | ACERTADO |
| 2025-06-10 | GD30D | DOWN | 841.41 | 794.89 | -46.52 | ACERTADO |
| 2025-06-10 | GD35D | DOWN | 826.16 | 850.24 | 24.09 | FALLADO |
| 2025-06-10 | GD38D | DOWN | 881.93 | 905.59 | 23.66 | FALLADO |
| 2025-06-10 | GD41D | DOWN | 767.40 | 787.02 | 19.62 | FALLADO |
| 2025-06-10 | GD46D | DOWN | 788.97 | 792.18 | 3.21 | FALLADO |
| 2025-06-10 | AL29D | DOWN | 887.30 | 819.28 | -68.02 | ACERTADO |
| 2025-06-10 | AL30D | DOWN | 819.12 | 772.83 | -46.29 | ACERTADO |
| 2025-06-10 | AL35D | DOWN | 819.96 | 839.15 | 19.19 | FALLADO |
| 2025-06-10 | AL41D | DOWN | 756.32 | 767.67 | 11.35 | FALLADO |
| 2025-06-10 | AE38D | DOWN | 858.10 | 875.27 | 17.18 | FALLADO |
| 2025-06-15 | AL29 | UP | 870.80 | 830.00 | -40.80 | FALLADO |
| 2025-06-15 | GD29 | UP | 890.00 | 858.40 | -31.60 | FALLADO |
| 2025-06-15 | AL30 | UP | 805.40 | 799.50 | -5.90 | FALLADO |
| 2025-06-15 | GD30 | UP | 825.50 | 822.50 | -3.00 | FALLADO |
| 2025-06-15 | AL35 | UP | 812.80 | 867.70 | 54.90 | ACERTADO |
| 2025-06-15 | GD35 | UP | 814.50 | 876.50 | 62.00 | ACERTADO |
| 2025-06-15 | GD38 | UP | 870.60 | 940.60 | 70.00 | ACERTADO |
| 2025-06-15 | GD41 | UP | 755.90 | 816.70 | 60.80 | ACERTADO |
| 2025-06-15 | GD46 | UP | 783.00 | 817.00 | 34.00 | ACERTADO |
| 2025-06-15 | GD46 | DOWN | 783.00 | 817.00 | 34.00 | FALLADO |
| 2025-06-15 | GD41 | DOWN | 755.90 | 816.70 | 60.80 | FALLADO |
| 2025-06-15 | AL41 | DOWN | 743.20 | 796.00 | 52.80 | FALLADO |
| 2025-06-15 | GD38 | DOWN | 870.60 | 940.60 | 70.00 | FALLADO |
| 2025-06-20 | AL30 | UP | 789.30 | 812.20 | 22.90 | ACERTADO |
| 2025-06-20 | GD30 | UP | 811.00 | 839.00 | 28.00 | ACERTADO |
| 2025-06-20 | AL29 | UP | 867.80 | 848.70 | -19.10 | FALLADO |
| 2025-06-20 | GD29 | UP | 885.00 | 879.50 | -5.50 | FALLADO |
| 2025-06-20 | AL35 | UP | 791.50 | 875.50 | 84.00 | ACERTADO |
| 2025-06-20 | GD35 | UP | 797.00 | 892.80 | 95.80 | ACERTADO |
| 2025-06-20 | TZV26 | DOWN | 1087.10 | 1258.00 | 170.90 | FALLADO |
| 2025-06-20 | TZX27 | DOWN | 2.43 | 2.39 | -0.04 | ACERTADO |
| 2025-06-20 | TX31 | DOWN | 9.69 | 9.14 | -0.54 | ACERTADO |
| 2025-06-25 | AL30 | UP | 823.50 | 804.00 | -19.50 | FALLADO |
| 2025-06-25 | GD30 | UP | 847.00 | 833.00 | -14.00 | FALLADO |
| 2025-06-25 | AL35 | UP | 826.70 | 875.20 | 48.50 | ACERTADO |
| 2025-06-25 | GD35 | UP | 835.80 | 888.50 | 52.70 | ACERTADO |
| 2025-06-25 | AL35 | DOWN | 826.70 | 875.20 | 48.50 | FALLADO |
| 2025-06-25 | GD35 | DOWN | 835.80 | 888.50 | 52.70 | FALLADO |
| 2025-06-25 | GD38 | DOWN | 884.00 | 946.60 | 62.60 | FALLADO |
| 2025-06-25 | GD41 | DOWN | 768.70 | 821.00 | 52.30 | FALLADO |
| 2025-06-25 | GD46 | DOWN | 790.00 | 811.30 | 21.30 | FALLADO |
| 2025-06-25 | TX31 | DOWN | 9.53 | 9.28 | -0.25 | ACERTADO |
| 2025-06-25 | TZX27 | DOWN | 2.41 | 2.38 | -0.03 | ACERTADO |
| 2025-06-30 | AL30 | UP | 829.00 | 796.00 | -33.00 | FALLADO |
| 2025-06-30 | GD30 | UP | 849.10 | 820.50 | -28.60 | FALLADO |
| 2025-06-30 | AL35 | UP | 831.00 | 860.10 | 29.10 | ACERTADO |
| 2025-06-30 | GD35 | UP | 839.00 | 881.90 | 42.90 | ACERTADO |
| 2025-06-30 | AL41 | UP | 763.40 | 794.20 | 30.80 | ACERTADO |
| 2025-06-30 | GD41 | UP | 777.00 | 816.20 | 39.20 | ACERTADO |
| 2025-06-30 | TZX27 | DOWN | 2.39 | 2.31 | -0.09 | ACERTADO |
| 2025-06-30 | TX31 | DOWN | 9.61 | 9.04 | -0.57 | ACERTADO |
| 2025-06-30 | DICP | DOWN | 371.50 | 355.75 | -15.75 | ACERTADO |
| 2025-06-30 | DIP0 | DOWN | 369.00 | 351.10 | -17.90 | ACERTADO |

### Test 1.4 (Analítico) — `gemma-4-31b-it`

**Modelo Utilizado**: `gemma-4-31b-it` (temperatura 0.00, máx. iteraciones 20)

#### 4.1 Parámetros de la Simulación

- **Rango de Fechas**: Desde 2025-06-05 hasta 2025-07-03 (con liquidación final el 2025-08-17)
- **Horizonte de Evaluación**: 45 días
- **Paso temporal**: 5 días
- **Restricción de Tickers**: Ninguna

#### 4.2 Resumen de Métricas de Predicción

| Métrica | Valor |
| --- | --- |
| **Predicciones Totales** | 59 |
| **Predicciones Correctas** | 29 |
| **Accuracy Global** | 49.15% |
| **Precisión Alzas (UP)** | 60.00% (21/35) |
| **Precisión Bajas (DOWN)** | 33.33% (8/24) |

#### 4.3 Análisis de Señales (Matriz de Confusión)

La matriz de confusión se estructura asumiendo la dirección **UP (Alza)** como la clase positiva y **DOWN (Baja)** como la clase negativa. 

La versión analytical (temperatura 0.0 y 20 iteraciones) obtuvo el mejor desempeño predictivo y de portafolio de la corrida. Logró una precisión del 60.00% en señales alcistas y un accuracy global del 49.15%. La rigurosidad analítica atenuó levemente el optimismo ciego, aunque el recall de bajas sigue siendo modesto (36.36%).

| | Predicho UP | Predicho DOWN |
| --- | --- | --- |
| **Real UP** | VP = 21 | FN = 16 |
| **Real DOWN** | FP = 14 | VN = 8 |

| Métrica | UP | DOWN |
| --- | --- | --- |
| **Precisión** | 60.00% | 33.33% |
| **Recall** | 56.76% | 36.36% |
| **F1-Score** | 58.33% | 34.78% |

#### 4.4 Métricas de Rendimiento del Portfolio

| Métrica | Valor Nominal | Valor Real (Ajustado por Inflación) |
| --- | --- | --- |
| **Total de Trades (Cerrados)** | 3 | 3 |
| **Trades Acertados (Ganadores)** | 2 | 2 |
| **Trades Fallados (Perdedores)** | 1 | 1 |
| **Ganancia Total** | +$109,879.48 ARS | +$70,870.28 ARS |
| **Pérdida Total** | -$0.00 ARS | -$398.95 ARS |
| **P&L Operaciones Completadas** | $5,980.14 ARS | $652.37 ARS |
| **P&L Liquidaciones Fin de Simulación** | $103,899.34 ARS | $69,818.96 ARS |
| **P&L Cobro Cupones y Amortizaciones** | $0.00 ARS | $0.00 ARS |
| **P&L Total (Neto)** | $109,879.48 ARS | $70,471.33 ARS |

---
#### Balance del portfolio final: $1,109,879.48 ARS
---

#### 4.5 Comparación con Benchmark

Para esta versión con ventana extendida y rebalanceos parciales a 45 días, no se computaron los benchmarks tradicionales en pesos/dólares por las diferencias en la periodicidad y liquidación respecto de la serie temporal original.

#### 4.6 Detalle de Trades

| Fecha | Bono | Acción | Cantidad | Pr. Compra (Nom) | Pr. Compra (Real) | Pr. Venta / Liq | P&L Nom ($) | P&L Nom (%) | P&L Real ($) | P&L Real (%) | Resultado |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 2025-06-05 | TZV26 | Compra | 917.4312 | $1090.00 | $1090.00 | - | - | - | - | - | N/A |
| 2025-06-10 | TZV26 | Venta Parcial | 458.7156 | $1090.00 | $1092.71 | $1095.00 | $2293.58 | 0.46% | $1051.32 | 0.21% | GANADOR |
| 2025-06-10 | AL30 | Compra | 614.4264 | $817.50 | $817.50 | - | - | - | - | - | N/A |
| 2025-06-25 | AL30 | Venta Total | 614.4264 | $817.50 | $824.15 | $823.50 | $3686.56 | 0.73% | $-398.95 | -0.08% | PERDEDOR |
| 2025-06-25 | TZV26 | Compra | 451.7680 | $1120.00 | $1120.00 | - | - | - | - | - | N/A |
| 2025-08-17 | TZV26 | Liquidación Final | 910.4836 | $1104.89 | $1142.32 | $1219.00 | $103899.34 | 10.33% | $69818.96 | 6.71% | GANADOR |

#### 4.7 Evolución del Portfolio

El portfolio comenzó con un capital de $1,000,000.00 ARS.

| Fecha | Efectivo (Cash) | Valor Tenencias | Valor Total (Nominal) | Retorno Nom. | Inflación Acum. | Valor Total (Real) | Retorno Real |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2025-06-05 | $0.00 | $1,000,000.00 | $1,000,000.00 | 0.00% | 0.00% | $1,000,000.00 | 0.00% |
| 2025-06-10 | $0.00 | $1,004,587.16 | $1,004,587.16 | 0.46% | 0.25% | $1,002,097.43 | 0.21% |
| 2025-06-15 | $0.00 | $998,987.46 | $998,987.46 | -0.10% | 0.53% | $993,715.66 | -0.63% |
| 2025-06-20 | $0.00 | $983,636.48 | $983,636.48 | -1.64% | 0.80% | $975,860.58 | -2.41% |
| 2025-06-25 | $0.00 | $1,019,741.60 | $1,019,741.60 | 1.97% | 1.06% | $1,009,007.35 | 0.90% |
| 2025-06-30 | $0.00 | $1,047,056.11 | $1,047,056.11 | 4.71% | 1.33% | $1,033,297.07 | 3.33% |
| 2025-08-17 | $1,109,879.48 | $0.00 | $1,109,879.48 | 10.99% | 3.94% | $1,067,827.58 | 6.78% |

#### 4.8 Composición Final del Portfolio

Al cierre del horizonte del test (17/08/2025), se ejecutó una liquidación final obligatoria. Por lo tanto, el portfolio finalizó 100% en efectivo (ARS), con un saldo líquido de $1,109,879.48 ARS.

#### 4.9 Detalle de Predicciones

| Fecha | Bono | Predicción | Precio Inicial | Precio Final | Cambio | Resultado |
| --- | --- | --- | --- | --- | --- | --- |
| 2025-06-05 | AL30 | UP | 800.80 | 762.00 | -38.80 | FALLADO |
| 2025-06-05 | GD30 | UP | 823.50 | 783.00 | -40.50 | FALLADO |
| 2025-06-05 | AL35 | UP | 805.00 | 824.00 | 19.00 | ACERTADO |
| 2025-06-05 | GD35 | UP | 812.00 | 840.00 | 28.00 | ACERTADO |
| 2025-06-05 | AL35 | DOWN | 805.00 | 824.00 | 19.00 | FALLADO |
| 2025-06-05 | GD35 | DOWN | 812.00 | 840.00 | 28.00 | FALLADO |
| 2025-06-05 | AL41 | DOWN | 744.90 | 756.80 | 11.90 | FALLADO |
| 2025-06-05 | GD41 | DOWN | 753.00 | 779.00 | 26.00 | FALLADO |
| 2025-06-05 | AL30 | DOWN | 800.80 | 762.00 | -38.80 | ACERTADO |
| 2025-06-05 | GD30 | DOWN | 823.50 | 783.00 | -40.50 | ACERTADO |
| 2025-06-10 | AL30 | UP | 817.50 | 770.30 | -47.20 | FALLADO |
| 2025-06-10 | GD30 | UP | 841.00 | 795.00 | -46.00 | FALLADO |
| 2025-06-10 | GD35 | UP | 828.30 | 849.00 | 20.70 | ACERTADO |
| 2025-06-10 | GD41 | UP | 765.80 | 785.00 | 19.20 | ACERTADO |
| 2025-06-10 | AE38 | UP | 858.80 | 873.40 | 14.60 | ACERTADO |
| 2025-06-15 | AL30 | UP | 805.40 | 799.50 | -5.90 | FALLADO |
| 2025-06-15 | GD30 | UP | 825.50 | 822.50 | -3.00 | FALLADO |
| 2025-06-15 | AL35 | UP | 812.80 | 867.70 | 54.90 | ACERTADO |
| 2025-06-15 | GD35 | UP | 814.50 | 876.50 | 62.00 | ACERTADO |
| 2025-06-15 | AL29 | UP | 870.80 | 830.00 | -40.80 | FALLADO |
| 2025-06-15 | GD29 | UP | 890.00 | 858.40 | -31.60 | FALLADO |
| 2025-06-15 | AL41 | UP | 743.20 | 796.00 | 52.80 | ACERTADO |
| 2025-06-15 | GD41 | UP | 755.90 | 816.70 | 60.80 | ACERTADO |
| 2025-06-20 | AL30 | UP | 789.30 | 812.20 | 22.90 | ACERTADO |
| 2025-06-20 | GD30 | UP | 811.00 | 839.00 | 28.00 | ACERTADO |
| 2025-06-20 | AL35 | UP | 791.50 | 875.50 | 84.00 | ACERTADO |
| 2025-06-20 | GD35 | UP | 797.00 | 892.80 | 95.80 | ACERTADO |
| 2025-06-20 | AL41 | UP | 724.90 | 805.50 | 80.60 | ACERTADO |
| 2025-06-20 | GD41 | UP | 733.60 | 824.30 | 90.70 | ACERTADO |
| 2025-06-20 | GD35 | DOWN | 797.00 | 892.80 | 95.80 | FALLADO |
| 2025-06-20 | GD38 | DOWN | 847.40 | 956.10 | 108.70 | FALLADO |
| 2025-06-20 | GD41 | DOWN | 733.60 | 824.30 | 90.70 | FALLADO |
| 2025-06-20 | GD46 | DOWN | 766.70 | 832.50 | 65.80 | FALLADO |
| 2025-06-20 | AL35 | DOWN | 791.50 | 875.50 | 84.00 | FALLADO |
| 2025-06-20 | AL41 | DOWN | 724.90 | 805.50 | 80.60 | FALLADO |
| 2025-06-20 | AE38 | DOWN | 827.50 | 912.60 | 85.10 | FALLADO |
| 2025-06-25 | AL30 | UP | 823.50 | 804.00 | -19.50 | FALLADO |
| 2025-06-25 | GD30 | UP | 847.00 | 833.00 | -14.00 | FALLADO |
| 2025-06-25 | AL29 | UP | 890.00 | 841.40 | -48.60 | FALLADO |
| 2025-06-25 | GD29 | UP | 919.50 | 873.70 | -45.80 | FALLADO |
| 2025-06-25 | AL35 | UP | 826.70 | 875.20 | 48.50 | ACERTADO |
| 2025-06-25 | GD35 | UP | 835.80 | 888.50 | 52.70 | ACERTADO |
| 2025-06-25 | TX31 | DOWN | 9.53 | 9.28 | -0.25 | ACERTADO |
| 2025-06-25 | TZX27 | DOWN | 2.41 | 2.38 | -0.03 | ACERTADO |
| 2025-06-25 | AL30 | DOWN | 823.50 | 804.00 | -19.50 | ACERTADO |
| 2025-06-25 | GD30 | DOWN | 847.00 | 833.00 | -14.00 | ACERTADO |
| 2025-06-25 | AL35 | DOWN | 826.70 | 875.20 | 48.50 | FALLADO |
| 2025-06-25 | GD35 | DOWN | 835.80 | 888.50 | 52.70 | FALLADO |
| 2025-06-30 | AL30 | UP | 829.00 | 796.00 | -33.00 | FALLADO |
| 2025-06-30 | GD30 | UP | 849.10 | 820.50 | -28.60 | FALLADO |
| 2025-06-30 | AL35 | UP | 831.00 | 860.10 | 29.10 | ACERTADO |
| 2025-06-30 | GD35 | UP | 839.00 | 881.90 | 42.90 | ACERTADO |
| 2025-06-30 | GD41 | UP | 777.00 | 816.20 | 39.20 | ACERTADO |
| 2025-06-30 | AL41 | UP | 763.40 | 794.20 | 30.80 | ACERTADO |
| 2025-06-30 | AL30 | DOWN | 829.00 | 796.00 | -33.00 | ACERTADO |
| 2025-06-30 | GD30 | DOWN | 849.10 | 820.50 | -28.60 | ACERTADO |
| 2025-06-30 | AL41 | DOWN | 763.40 | 794.20 | 30.80 | FALLADO |
| 2025-06-30 | GD41 | DOWN | 777.00 | 816.20 | 39.20 | FALLADO |
| 2025-06-30 | GD46 | DOWN | 800.80 | 811.70 | 10.90 | FALLADO |

---

## 5. Limitaciones y Consideraciones

Para una interpretación rigurosa de los resultados, se deben considerar los siguientes límites del entorno de simulación:

* **Look-ahead bias**: El agente no tiene acceso a información futura. El pipeline de backtesting carga un backup del grafo de conocimiento Neo4j correspondiente exclusivamente a la fecha simulada (`news_compact_cluster_YYYY-MM-DD.json`) y aplica filtros históricos en las queries de Supabase.
* **Costos de transacción y spreads**: No se modelaron comisiones de ALyCs (comúnmente entre 0.5% y 1.0% por transacción) ni spreads de compra/venta (bid-ask). Para el test de paso único, esto representaría un costo total estimado de ~1.0% a ~2.0% de rentabilidad nominal. Sin embargo, en las variantes de rebalanceo diario (como el Test 1.2, con 38 operaciones), los costos de transacción habrían erosionado por completo la ganancia del portafolio. Cabe aclarar que este rango de 0.5%-1.0% es una referencia conservadora/general: en la práctica, los ALyCs suelen ofrecer bonificaciones por volumen operado, e incluso planes de costo fijo ("flat") que reducen la comisión por compra-venta a 0%, cobrando en cambio un abono periódico fijo independiente del volumen transaccionado[^ref-flat]. Esto significa que el impacto real de los costos de transacción sobre la rentabilidad del agente puede ser sustancialmente menor al estimado aquí si BonanzAR opera bajo un esquema de este tipo, aunque la elección entre comisión variable y plan flat depende del volumen y frecuencia de rebalanceo proyectado.

[^ref-flat]: Ejemplo de plan de costo fijo ofrecido por un ALyC argentino: [Veta Capital - Planes FLAT, Términos y Condiciones](https://vetacap.com.ar/wp-content/uploads/2025/08/Planes-FLAT-%E2%80%93-Terminos-Condiciones-y-Beneficios-ok.pdf).
* **Slippage y Liquidez**: Se asume ejecución perfecta al precio cargado como último cierre diario en la base de datos. En el mercado local, operar montos significativos en bonos menos líquidos o fuera del mercado de concurrencia de ofertas generaría un impacto adverso en los precios.
* **Overfitting Temporal**: El test se limitó a un solo mes (junio-julio 2025) caracterizado por una fuerte tendencia alcista general en bonos soberanos debido a la consolidación del superávit fiscal. Es imprescindible evaluar el modelo en períodos de alta volatilidad o caídas sistemáticas para validar si el agente es capaz de rotar eficientemente hacia liquidez o bonos de cobertura.
* **Sesgo del LLM (UP Bias)**: Se observa que el LLM tiene una marcada tendencia a emitir señales alcistas, especialmente con temperaturas bajas (e.g., Test 1.3 Base y Test 1.4 Default/Analytical). Aunque un incremento de temperatura (e.g., Test 1.4 Agressive) modera este comportamiento balanceando el ratio de señales (34 UP vs 43 DOWN), esto degrada la precisión general. El agente tiende a etiquetar activos como DOWN ante cualquier mención de riesgo en las noticias sin ponderar adecuadamente su impacto frente a la tendencia macroeconómica principal.

---

## 6. Conclusiones y Próximos Pasos

### Conclusiones

* **Generación de Alpha**: El Agente Causal BonanzAR demostró capacidad de superar con creces a los benchmarks de plazo fijo y de mercado. En particular, en simulaciones de paso único (Test 1.3 Base) rindió +4.89% nominal (vs +2.63% de plazo fijo y +0.92% de Buy & Hold), y en simulaciones continuas con rebalanceo a 45 días (Test 1.4), la versión *Analytical* alcanzó un sobresaliente **10.99% nominal** (**6.78% real**). Esto confirma la hipótesis de que un razonamiento guiado por un grafo causal de noticias macroeconómicas puede tomar decisiones de asignación sectorial muy robustas, incluso en horizontes extendidos. **Cabe aclarar que el 10.99% nominal de la versión Analytical proviene de una única corrida sobre un solo período histórico (junio-julio 2025), y no puede descartarse que sea un valor atípico (outlier)** favorecido por la combinación específica de baja temperatura y la tendencia alcista general del mercado en ese mes; se requieren corridas adicionales sobre distintos períodos y configuraciones para confirmar la robustez de este resultado antes de proyectarlo como retorno esperado.
* **Grounding vs Alucinación**: La arquitectura de consulta causal a Neo4j fundamenta las justificaciones de la cartera en variables macro reales (disciplina fiscal, brecha y reservas), previniendo explicaciones alucinadas o ad-hoc.
* **Debilidad en Predicciones de Baja**: El modelo muestra un desbalance en su capacidad predictiva de caídas, lo cual es crítico si se busca protección de capital.

### Próximos Pasos

1. **Incorporar Métricas de Liquidez**: Integrar volumen operado diario de Supabase al prompt del agente para evitar recomendaciones en activos ilíquidos.
2. **Ponderación Causal y Scoring**: Ya existe un sistema de pesos en las aristas del grafo ("support"), que cuantifica cuántas fuentes independientes respaldan cada conexión causal y permite al agente resolver lógicamente causales contradictorios (UP y DOWN simultáneos en un mismo ticker). Próximo paso: enriquecer este score incorporando métricas adicionales (fuerza de la correlación histórica, estudios de correlatividad entre variables) más allá del solo conteo de fuentes.
3. **Optimizar el Prompt de Señales DOWN**: Mejorar las directrices de extracción bajista, instruyendo al LLM a discriminar entre riesgos de mercado secundarios y tendencias macroeconómicas primarias.
4. **Modelo de Fricciones del Mercado**: Incorporar comisiones transaccionales (0.5% por operación) y spreads estimados en el motor cuantitativo de backtesting para una simulación realista.
5. **Ampliación de Backtesting**: Correr simulaciones de mayor plazo (ej. 6 o 12 meses continuos) para evaluar la resiliencia del rebalanceo dinámico frente a cambios de régimen de mercado.
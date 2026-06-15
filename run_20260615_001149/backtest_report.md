# Informe de Backtesting del Agente Causal BonanzAR (Test 1.3)
**Modelo Utilizado**: `gemma-4-31b-it`

Este informe detalla los resultados de la simulación del agente BonanzAR y la administración de su portfolio.

## Parámetros de la Simulación
- **Rango de Fechas**: Desde 2025-06-03 hasta 2025-06-03
- **Horizonte de Evaluación**: 30 días
- **Paso temporal**: 1 días
- **Restricción de Tickers**: Ninguna

## Resumen de Métricas de Predicción
| Métrica | Valor |
| --- | --- |
| **Predicciones Totales** | 17 |
| **Predicciones Correctas** | 10 |
| **Accuracy Global** | 58.82% |
| **Precisión Alzas (UP)** | 100.00% (10/10) |
| **Precisión Bajas (DOWN)** | 0.00% (0/7) |

## Análisis de P&L de Trades (Realizados e Intermedios)
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

---
#### Balance del portfolio: $1,048,888.86 ARS
---

### Detalle de cada Trade
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

## Evolución del Portfolio (Test 1.3)
El portfolio comenzó con un capital de $1,000,000.00 ARS.

| Fecha | Efectivo (Cash) | Valor Tenencias | Valor Total (Nominal) | Retorno Nom. | Inflación Acum. | Valor Total (Real) | Retorno Real |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2025-06-03 | $0.00 | $1,000,000.00 | $1,000,000.00 | 0.00% | 0.00% | $1,000,000.00 | 0.00% |
| 2025-07-03 | $1,048,888.86 | $0.00 | $1,048,888.86 | 4.89% | 1.50% | $1,033,388.04 | 3.34% |

### Composición Final del Portfolio

## Detalle de Predicciones
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

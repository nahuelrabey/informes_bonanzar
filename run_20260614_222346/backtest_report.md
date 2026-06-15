# Informe de Backtesting del Agente Causal BonanzAR (Test 1.3)
**Modelo Utilizado**: `gemma-4-31b-it`

Este informe detalla los resultados de la simulación del agente BonanzAR y la administración de su portfolio.

## Parámetros de la Simulación
- **Rango de Fechas**: Desde 2025-06-03 hasta 2025-06-04
- **Horizonte de Evaluación**: 30 días
- **Paso temporal**: 1 días
- **Restricción de Tickers**: Ninguna

## Resumen de Métricas de Predicción
| Métrica | Valor |
| --- | --- |
| **Predicciones Totales** | 53 |
| **Predicciones Correctas** | 14 |
| **Accuracy Global** | 26.42% |
| **Precisión Alzas (UP)** | 62.50% (10/16) |
| **Precisión Bajas (DOWN)** | 10.81% (4/37) |

## Análisis de P&L de Trades (Realizados e Intermedios)
| Métrica | Valor Nominal | Valor Real (Ajustado por Inflación) |
| --- | --- | --- |
| **Total de Trades (Cerrados)** | 8 | 8 |
| **Trades Acertados (Ganadores)** | 6 | 6 |
| **Trades Fallados (Perdedores)** | 2 | 2 |
| **Ganancia Total** | +$620.51 ARS | +$467.51 ARS |
| **Pérdida Total** | -$1.45 ARS | -$3.44 ARS |
| **P&L Operaciones Completadas** | $0.55 ARS | $-1.93 ARS |
| **P&L Liquidaciones Fin de Simulación** | $618.51 ARS | $466.00 ARS |
| **P&L Total (Neto)** | $619.06 ARS | $464.07 ARS |

### Detalle de cada Trade
| Fecha | Bono | Acción | Cantidad | Pr. Compra (Nom) | Pr. Compra (Real) | Pr. Venta / Liq | P&L Nom ($) | P&L Nom (%) | P&L Real ($) | P&L Real (%) | Resultado |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 2025-06-03 | TZV26 | Compra | 0.0092 | $108800.00 | $108800.00 | - | - | - | - | - | N/A |
| 2025-06-03 | AL30 | Compra | 0.0247 | $81100.00 | $81100.00 | - | - | - | - | - | N/A |
| 2025-06-03 | GD30 | Compra | 0.0240 | $83190.00 | $83190.00 | - | - | - | - | - | N/A |
| 2025-06-03 | TX31 | Compra | 1.0547 | $948.10 | $948.10 | - | - | - | - | - | N/A |
| 2025-06-03 | DICP | Compra | 0.0485 | $41250.00 | $41250.00 | - | - | - | - | - | N/A |
| 2025-06-03 | DIP0 | Compra | 0.0488 | $41000.00 | $41000.00 | - | - | - | - | - | N/A |
| 2025-06-04 | TX31 | Venta Total | 1.0547 | $948.10 | $948.57 | $950.00 | $2.00 | 0.20% | $1.51 | 0.15% | 🟢 GANADOR |
| 2025-06-04 | DICP | Venta Total | 0.0485 | $41250.00 | $41270.48 | $41220.00 | $-1.45 | -0.07% | $-2.45 | -0.12% | 🔴 PERDEDOR |
| 2025-06-04 | DIP0 | Venta Total | 0.0488 | $41000.00 | $41020.35 | $41000.00 | $0.00 | 0.00% | $-0.99 | -0.05% | 🔴 PERDEDOR |
| 2025-06-04 | TZV26 | Compra | 0.0000 | $108700.00 | $108700.00 | - | - | - | - | - | N/A |
| 2025-06-04 | AL29 | Compra | 0.0229 | $87440.00 | $87440.00 | - | - | - | - | - | N/A |
| 2025-06-04 | AL30 | Compra | 0.0062 | $80900.00 | $80900.00 | - | - | - | - | - | N/A |
| 2025-06-04 | GD29 | Compra | 0.0224 | $89290.00 | $89290.00 | - | - | - | - | - | N/A |
| 2025-06-04 | GD30 | Compra | 0.0060 | $83100.00 | $83100.00 | - | - | - | - | - | N/A |
| 2025-07-04 | TZV26 | Liquidación Final | 0.0092 | $108799.98 | $110486.79 | $117900.00 | $83.65 | 8.36% | $68.15 | 6.71% | 🟢 GANADOR |
| 2025-07-04 | AL30 | Liquidación Final | 0.0309 | $81059.72 | $82308.25 | $85900.00 | $149.46 | 5.97% | $110.91 | 4.36% | 🟢 GANADOR |
| 2025-07-04 | GD30 | Liquidación Final | 0.0301 | $83171.98 | $84453.08 | $87900.00 | $142.13 | 5.68% | $103.62 | 4.08% | 🟢 GANADOR |
| 2025-07-04 | AL29 | Liquidación Final | 0.0229 | $87440.00 | $88751.60 | $92590.00 | $117.71 | 5.89% | $87.73 | 4.32% | 🟢 GANADOR |
| 2025-07-04 | GD29 | Liquidación Final | 0.0224 | $89290.00 | $90629.35 | $94900.00 | $125.56 | 6.28% | $95.59 | 4.71% | 🟢 GANADOR |

## Evolución del Portfolio (Test 1.3)
El portfolio comenzó con un capital de $10.000,00 ARS.

| Fecha | Efectivo (Cash) | Valor Tenencias | Valor Total (Nominal) | Retorno Nom. | Inflación Acum. | Valor Total (Real) | Retorno Real |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2025-06-03 | $0.00 | $10,000.00 | $10,000.00 | 0.00% | 0.00% | $10,000.00 | 0.00% |
| 2025-06-04 | $0.00 | $9,992.53 | $9,992.53 | -0.07% | 0.05% | $9,987.57 | -0.12% |
| 2025-07-04 | $10,619.07 | $0.00 | $10,619.07 | 6.19% | 1.55% | $10,456.95 | 4.57% |

### Composición Final del Portfolio

## Detalle de Predicciones
| Fecha | Bono | Predicción | Precio Inicial | Precio Final | Cambio | Resultado |
| --- | --- | --- | --- | --- | --- | --- |
| 2025-06-03 | AL30 | UP | 81100.00 | 85200.00 | 4100.00 | ✅ ACERTADO |
| 2025-06-03 | GD30 | UP | 83190.00 | 87200.00 | 4010.00 | ✅ ACERTADO |
| 2025-06-03 | TZV26 | UP | 108800.00 | 116450.00 | 7650.00 | ✅ ACERTADO |
| 2025-06-03 | TZX27 | UP | 239.05 | 242.10 | 3.05 | ✅ ACERTADO |
| 2025-06-03 | TX31 | UP | 948.10 | 944.30 | -3.80 | ❌ FALLADO |
| 2025-06-03 | DICP | UP | 41250.00 | 37325.00 | -3925.00 | ❌ FALLADO |
| 2025-06-03 | DIP0 | UP | 41000.00 | 37105.00 | -3895.00 | ❌ FALLADO |
| 2025-06-03 | PARP | UP | 22360.00 | 22150.00 | -210.00 | ❌ FALLADO |
| 2025-06-03 | PAP0 | UP | 22650.00 | 21970.00 | -680.00 | ❌ FALLADO |
| 2025-06-03 | CUAP | UP | 27980.00 | 26920.00 | -1060.00 | ❌ FALLADO |
| 2025-06-03 | AL29 | DOWN | 87910.00 | 91730.00 | 3820.00 | ❌ FALLADO |
| 2025-06-03 | AL30 | DOWN | 81100.00 | 85200.00 | 4100.00 | ❌ FALLADO |
| 2025-06-03 | AL35 | DOWN | 81850.00 | 85100.00 | 3250.00 | ❌ FALLADO |
| 2025-06-03 | AL41 | DOWN | 75450.00 | 78400.00 | 2950.00 | ❌ FALLADO |
| 2025-06-03 | AE38 | DOWN | 85230.00 | 88900.00 | 3670.00 | ❌ FALLADO |
| 2025-06-03 | GD29 | DOWN | 89870.00 | 94620.00 | 4750.00 | ❌ FALLADO |
| 2025-06-03 | GD30 | DOWN | 83190.00 | 87200.00 | 4010.00 | ❌ FALLADO |
| 2025-06-03 | GD35 | DOWN | 82580.00 | 85890.00 | 3310.00 | ❌ FALLADO |
| 2025-06-03 | GD38 | DOWN | 87750.00 | 91380.00 | 3630.00 | ❌ FALLADO |
| 2025-06-03 | GD41 | DOWN | 76440.00 | 79610.00 | 3170.00 | ❌ FALLADO |
| 2025-06-03 | GD46 | DOWN | 78990.00 | 82040.00 | 3050.00 | ❌ FALLADO |
| 2025-06-03 | AL29D | DOWN | 74.03 | 74.01 | -0.02 | ✅ ACERTADO |
| 2025-06-03 | AL30D | DOWN | 68.17 | 68.80 | 0.63 | ❌ FALLADO |
| 2025-06-03 | AE38D | DOWN | 71.78 | 71.80 | 0.02 | ❌ FALLADO |
| 2025-06-03 | AL35D | DOWN | 68.84 | 68.69 | -0.15 | ✅ ACERTADO |
| 2025-06-03 | AL41D | DOWN | 63.42 | 63.33 | -0.09 | ✅ ACERTADO |
| 2025-06-03 | GD29D | DOWN | 75.67 | 76.25 | 0.58 | ❌ FALLADO |
| 2025-06-03 | GD30D | DOWN | 69.80 | 70.26 | 0.46 | ❌ FALLADO |
| 2025-06-03 | GD38D | DOWN | 73.80 | 73.97 | 0.17 | ❌ FALLADO |
| 2025-06-03 | GD35D | DOWN | 69.50 | 69.49 | -0.01 | ✅ ACERTADO |
| 2025-06-03 | GD41D | DOWN | 64.33 | 64.41 | 0.08 | ❌ FALLADO |
| 2025-06-03 | GD46D | DOWN | 66.50 | 66.77 | 0.27 | ❌ FALLADO |
| 2025-06-03 | BA37D | DOWN | 83860.00 | 86780.00 | 2920.00 | ❌ FALLADO |
| 2025-06-03 | CO26 | DOWN | 23985.00 | 24095.00 | 110.00 | ❌ FALLADO |
| 2025-06-04 | AL30 | UP | 80900.00 | 85900.00 | 5000.00 | ✅ ACERTADO |
| 2025-06-04 | GD30 | UP | 83100.00 | 87900.00 | 4800.00 | ✅ ACERTADO |
| 2025-06-04 | AL29 | UP | 87440.00 | 92590.00 | 5150.00 | ✅ ACERTADO |
| 2025-06-04 | GD29 | UP | 89290.00 | 94900.00 | 5610.00 | ✅ ACERTADO |
| 2025-06-04 | TZV26 | UP | 108700.00 | 117900.00 | 9200.00 | ✅ ACERTADO |
| 2025-06-04 | TZX27 | UP | 239.60 | 242.50 | 2.90 | ✅ ACERTADO |
| 2025-06-04 | TZV26 | DOWN | 108700.00 | 117900.00 | 9200.00 | ❌ FALLADO |
| 2025-06-04 | TZX27 | DOWN | 239.60 | 242.50 | 2.90 | ❌ FALLADO |
| 2025-06-04 | TX31 | DOWN | 950.00 | 953.90 | 3.90 | ❌ FALLADO |
| 2025-06-04 | AL30 | DOWN | 80900.00 | 85900.00 | 5000.00 | ❌ FALLADO |
| 2025-06-04 | GD30 | DOWN | 83100.00 | 87900.00 | 4800.00 | ❌ FALLADO |
| 2025-06-04 | AL35 | DOWN | 81550.00 | 86000.00 | 4450.00 | ❌ FALLADO |
| 2025-06-04 | GD35 | DOWN | 82340.00 | 86810.00 | 4470.00 | ❌ FALLADO |
| 2025-06-04 | AL29 | DOWN | 87440.00 | 92590.00 | 5150.00 | ❌ FALLADO |
| 2025-06-04 | GD29 | DOWN | 89290.00 | 94900.00 | 5610.00 | ❌ FALLADO |
| 2025-06-04 | AL41 | DOWN | 75200.00 | 79890.00 | 4690.00 | ❌ FALLADO |
| 2025-06-04 | GD41 | DOWN | 76150.00 | 80200.00 | 4050.00 | ❌ FALLADO |
| 2025-06-04 | AE38 | DOWN | 85000.00 | 89900.00 | 4900.00 | ❌ FALLADO |
| 2025-06-04 | GD38 | DOWN | 87400.00 | 92300.00 | 4900.00 | ❌ FALLADO |

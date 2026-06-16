# Informe de Backtesting del Agente Causal BonanzAR
**Bucket ID**: `agressive`
**Modelo Utilizado**: `gemma-4-31b-it`
**Temperatura**: `0.50`
**Máx Iteraciones de Herramientas**: `10`

Este informe detalla los resultados de la simulación del agente BonanzAR y la administración de su portfolio.

## Parámetros de la Simulación
- **Rango de Fechas**: Desde 2025-06-05 hasta 2025-07-03
- **Horizonte de Evaluación**: 45 días
- **Paso temporal**: 5 días

## Resumen de Métricas de Predicción
| Métrica | Valor |
| --- | --- |
| **Predicciones Totales** | 77 |
| **Predicciones Correctas** | 34 |
| **Accuracy Global** | 44.16% |
| **Precisión Alzas (UP)** | 52.94% (18/34) |
| **Precisión Bajas (DOWN)** | 37.21% (16/43) |

## Análisis de P&L de Trades (Realizados e Intermedios)
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

### Detalle de cada Trade
| Fecha | Bono | Acción | Cantidad | Pr. Compra (Nom) | Pr. Compra (Real) | Pr. Venta / Liq | P&L Nom ($) | P&L Nom (%) | P&L Real ($) | P&L Real (%) | Resultado |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 2025-06-05 | DICP | Compra | 1214.3291 | $411.75 | $411.75 | - | - | - | - | - | N/A |
| 2025-06-05 | DIP0 | Compra | 1211.5338 | $412.70 | $412.70 | - | - | - | - | - | N/A |
| 2025-06-20 | DICP | Venta Total | 1214.3291 | $411.75 | $415.03 | $413.50 | $2125.08 | 0.43% | $-1859.05 | -0.37% | 🔴 PERDEDOR |
| 2025-06-20 | DIP0 | Venta Total | 1211.5338 | $412.70 | $415.99 | $414.20 | $1817.30 | 0.36% | $-2166.83 | -0.43% | 🔴 PERDEDOR |
| 2025-06-20 | AL30 | Compra | 635.9701 | $789.30 | $789.30 | - | - | - | - | - | N/A |
| 2025-06-20 | GD30 | Compra | 618.9534 | $811.00 | $811.00 | - | - | - | - | - | N/A |
| 2025-07-09 | AL30 | Cobro Amortización | 50.8776 | - | - | $1260.10 | $23953.18 | - | $23127.61 | - | 🟢 COBRADO |
| 2025-07-09 | AL30 | Cobro Interés | 585.0925 | - | - | $4.69 | $2742.06 | - | $2693.17 | - | 🟢 COBRADO |
| 2025-07-09 | GD30 | Cobro Amortización | 49.5163 | - | - | $1260.10 | $22237.76 | - | $21442.77 | - | 🟢 COBRADO |
| 2025-07-09 | GD30 | Cobro Interés | 569.4371 | - | - | $4.69 | $2668.69 | - | $2621.11 | - | 🟢 COBRADO |
| 2025-08-17 | AL30 | Liquidación Final | 585.0925 | $789.30 | $813.90 | $796.00 | $3920.12 | 0.85% | $-10471.94 | -2.20% | 🔴 PERDEDOR |
| 2025-08-17 | GD30 | Liquidación Final | 569.4371 | $811.00 | $836.27 | $820.50 | $5409.65 | 1.17% | $-8982.40 | -1.89% | 🔴 PERDEDOR |

## Evolución del Portfolio
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

### Composición Final del Portfolio
Efectivo final 100% (liquidado).

## Detalle de Predicciones
| Fecha | Bono | Predicción | Precio Inicial | Precio Final | Cambio | Resultado |
| --- | --- | --- | --- | --- | --- | --- |
| 2025-06-05 | AL30 | UP | 800.80 | 762.00 | -38.80 | ❌ FALLADO |
| 2025-06-05 | GD30 | UP | 823.50 | 783.00 | -40.50 | ❌ FALLADO |
| 2025-06-05 | AL29 | UP | 871.40 | 802.60 | -68.80 | ❌ FALLADO |
| 2025-06-05 | GD29 | UP | 889.50 | 824.90 | -64.60 | ❌ FALLADO |
| 2025-06-05 | AL30 | DOWN | 800.80 | 762.00 | -38.80 | ✅ ACERTADO |
| 2025-06-05 | GD30 | DOWN | 823.50 | 783.00 | -40.50 | ✅ ACERTADO |
| 2025-06-05 | AL35 | DOWN | 805.00 | 824.00 | 19.00 | ❌ FALLADO |
| 2025-06-05 | GD35 | DOWN | 812.00 | 840.00 | 28.00 | ❌ FALLADO |
| 2025-06-05 | AL41 | DOWN | 744.90 | 756.80 | 11.90 | ❌ FALLADO |
| 2025-06-05 | GD41 | DOWN | 753.00 | 779.00 | 26.00 | ❌ FALLADO |
| 2025-06-05 | AE38 | DOWN | 840.60 | 861.30 | 20.70 | ❌ FALLADO |
| 2025-06-05 | GD38 | DOWN | 866.50 | 894.00 | 27.50 | ❌ FALLADO |
| 2025-06-05 | AL30D | DOWN | 801.62 | 763.67 | -37.95 | ✅ ACERTADO |
| 2025-06-05 | GD30D | DOWN | 820.00 | 785.81 | -34.19 | ✅ ACERTADO |
| 2025-06-05 | AL35D | DOWN | 809.14 | 828.67 | 19.53 | ❌ FALLADO |
| 2025-06-05 | GD35D | DOWN | 814.63 | 842.66 | 28.02 | ❌ FALLADO |
| 2025-06-10 | AL30 | UP | 817.50 | 770.30 | -47.20 | ❌ FALLADO |
| 2025-06-10 | GD30 | UP | 841.00 | 795.00 | -46.00 | ❌ FALLADO |
| 2025-06-10 | GD35 | UP | 828.30 | 849.00 | 20.70 | ✅ ACERTADO |
| 2025-06-10 | GD41 | UP | 765.80 | 785.00 | 19.20 | ✅ ACERTADO |
| 2025-06-10 | AE38 | UP | 858.80 | 873.40 | 14.60 | ✅ ACERTADO |
| 2025-06-10 | GD46 | DOWN | 788.50 | 789.90 | 1.40 | ❌ FALLADO |
| 2025-06-10 | AL41 | DOWN | 752.60 | 764.00 | 11.40 | ❌ FALLADO |
| 2025-06-10 | GD29D | DOWN | 903.15 | 834.50 | -68.64 | ✅ ACERTADO |
| 2025-06-10 | GD30D | DOWN | 841.41 | 794.89 | -46.52 | ✅ ACERTADO |
| 2025-06-10 | GD35D | DOWN | 826.16 | 850.24 | 24.09 | ❌ FALLADO |
| 2025-06-10 | GD38D | DOWN | 881.93 | 905.59 | 23.66 | ❌ FALLADO |
| 2025-06-10 | GD41D | DOWN | 767.40 | 787.02 | 19.62 | ❌ FALLADO |
| 2025-06-10 | GD46D | DOWN | 788.97 | 792.18 | 3.21 | ❌ FALLADO |
| 2025-06-10 | AL29D | DOWN | 887.30 | 819.28 | -68.02 | ✅ ACERTADO |
| 2025-06-10 | AL30D | DOWN | 819.12 | 772.83 | -46.29 | ✅ ACERTADO |
| 2025-06-10 | AL35D | DOWN | 819.96 | 839.15 | 19.19 | ❌ FALLADO |
| 2025-06-10 | AL41D | DOWN | 756.32 | 767.67 | 11.35 | ❌ FALLADO |
| 2025-06-10 | AE38D | DOWN | 858.10 | 875.27 | 17.18 | ❌ FALLADO |
| 2025-06-15 | AL29 | UP | 870.80 | 830.00 | -40.80 | ❌ FALLADO |
| 2025-06-15 | GD29 | UP | 890.00 | 858.40 | -31.60 | ❌ FALLADO |
| 2025-06-15 | AL30 | UP | 805.40 | 799.50 | -5.90 | ❌ FALLADO |
| 2025-06-15 | GD30 | UP | 825.50 | 822.50 | -3.00 | ❌ FALLADO |
| 2025-06-15 | AL35 | UP | 812.80 | 867.70 | 54.90 | ✅ ACERTADO |
| 2025-06-15 | GD35 | UP | 814.50 | 876.50 | 62.00 | ✅ ACERTADO |
| 2025-06-15 | GD38 | UP | 870.60 | 940.60 | 70.00 | ✅ ACERTADO |
| 2025-06-15 | GD41 | UP | 755.90 | 816.70 | 60.80 | ✅ ACERTADO |
| 2025-06-15 | GD46 | UP | 783.00 | 817.00 | 34.00 | ✅ ACERTADO |
| 2025-06-15 | GD46 | DOWN | 783.00 | 817.00 | 34.00 | ❌ FALLADO |
| 2025-06-15 | GD41 | DOWN | 755.90 | 816.70 | 60.80 | ❌ FALLADO |
| 2025-06-15 | AL41 | DOWN | 743.20 | 796.00 | 52.80 | ❌ FALLADO |
| 2025-06-15 | GD38 | DOWN | 870.60 | 940.60 | 70.00 | ❌ FALLADO |
| 2025-06-20 | AL30 | UP | 789.30 | 812.20 | 22.90 | ✅ ACERTADO |
| 2025-06-20 | GD30 | UP | 811.00 | 839.00 | 28.00 | ✅ ACERTADO |
| 2025-06-20 | AL29 | UP | 867.80 | 848.70 | -19.10 | ❌ FALLADO |
| 2025-06-20 | GD29 | UP | 885.00 | 879.50 | -5.50 | ❌ FALLADO |
| 2025-06-20 | AL35 | UP | 791.50 | 875.50 | 84.00 | ✅ ACERTADO |
| 2025-06-20 | GD35 | UP | 797.00 | 892.80 | 95.80 | ✅ ACERTADO |
| 2025-06-20 | TZV26 | DOWN | 1087.10 | 1258.00 | 170.90 | ❌ FALLADO |
| 2025-06-20 | TZX27 | DOWN | 2.43 | 2.39 | -0.04 | ✅ ACERTADO |
| 2025-06-20 | TX31 | DOWN | 9.69 | 9.14 | -0.54 | ✅ ACERTADO |
| 2025-06-25 | AL30 | UP | 823.50 | 804.00 | -19.50 | ❌ FALLADO |
| 2025-06-25 | GD30 | UP | 847.00 | 833.00 | -14.00 | ❌ FALLADO |
| 2025-06-25 | AL35 | UP | 826.70 | 875.20 | 48.50 | ✅ ACERTADO |
| 2025-06-25 | GD35 | UP | 835.80 | 888.50 | 52.70 | ✅ ACERTADO |
| 2025-06-25 | AL35 | DOWN | 826.70 | 875.20 | 48.50 | ❌ FALLADO |
| 2025-06-25 | GD35 | DOWN | 835.80 | 888.50 | 52.70 | ❌ FALLADO |
| 2025-06-25 | GD38 | DOWN | 884.00 | 946.60 | 62.60 | ❌ FALLADO |
| 2025-06-25 | GD41 | DOWN | 768.70 | 821.00 | 52.30 | ❌ FALLADO |
| 2025-06-25 | GD46 | DOWN | 790.00 | 811.30 | 21.30 | ❌ FALLADO |
| 2025-06-25 | TX31 | DOWN | 9.53 | 9.28 | -0.25 | ✅ ACERTADO |
| 2025-06-25 | TZX27 | DOWN | 2.41 | 2.38 | -0.03 | ✅ ACERTADO |
| 2025-06-30 | AL30 | UP | 829.00 | 796.00 | -33.00 | ❌ FALLADO |
| 2025-06-30 | GD30 | UP | 849.10 | 820.50 | -28.60 | ❌ FALLADO |
| 2025-06-30 | AL35 | UP | 831.00 | 860.10 | 29.10 | ✅ ACERTADO |
| 2025-06-30 | GD35 | UP | 839.00 | 881.90 | 42.90 | ✅ ACERTADO |
| 2025-06-30 | AL41 | UP | 763.40 | 794.20 | 30.80 | ✅ ACERTADO |
| 2025-06-30 | GD41 | UP | 777.00 | 816.20 | 39.20 | ✅ ACERTADO |
| 2025-06-30 | TZX27 | DOWN | 2.39 | 2.31 | -0.09 | ✅ ACERTADO |
| 2025-06-30 | TX31 | DOWN | 9.61 | 9.04 | -0.57 | ✅ ACERTADO |
| 2025-06-30 | DICP | DOWN | 371.50 | 355.75 | -15.75 | ✅ ACERTADO |
| 2025-06-30 | DIP0 | DOWN | 369.00 | 351.10 | -17.90 | ✅ ACERTADO |

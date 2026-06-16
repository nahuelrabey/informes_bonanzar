# Informe de Backtesting del Agente Causal BonanzAR
**Bucket ID**: `default`
**Modelo Utilizado**: `gemma-4-31b-it`
**Temperatura**: `0.20`
**Máx Iteraciones de Herramientas**: `10`

Este informe detalla los resultados de la simulación del agente BonanzAR y la administración de su portfolio.

## Parámetros de la Simulación
- **Rango de Fechas**: Desde 2025-06-05 hasta 2025-07-03
- **Horizonte de Evaluación**: 45 días
- **Paso temporal**: 5 días

## Resumen de Métricas de Predicción
| Métrica | Valor |
| --- | --- |
| **Predicciones Totales** | 93 |
| **Predicciones Correctas** | 43 |
| **Accuracy Global** | 46.24% |
| **Precisión Alzas (UP)** | 51.56% (33/64) |
| **Precisión Bajas (DOWN)** | 34.48% (10/29) |

## Análisis de P&L de Trades (Realizados e Intermedios)
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

### Detalle de cada Trade
| Fecha | Bono | Acción | Cantidad | Pr. Compra (Nom) | Pr. Compra (Real) | Pr. Venta / Liq | P&L Nom ($) | P&L Nom (%) | P&L Real ($) | P&L Real (%) | Resultado |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 2025-06-05 | AL30 | Compra | 624.3756 | $800.80 | $800.80 | - | - | - | - | - | N/A |
| 2025-06-05 | GD30 | Compra | 607.1645 | $823.50 | $823.50 | - | - | - | - | - | N/A |
| 2025-06-30 | AL30 | Venta Total | 624.3756 | $800.80 | $811.46 | $829.00 | $17607.39 | 3.52% | $10949.56 | 2.16% | 🟢 GANADOR |
| 2025-06-30 | GD30 | Venta Total | 607.1645 | $823.50 | $834.47 | $849.10 | $15543.41 | 3.11% | $8885.58 | 1.75% | 🟢 GANADOR |
| 2025-06-30 | TZV26 | Compra | 898.3920 | $1150.00 | $1150.00 | - | - | - | - | - | N/A |
| 2025-08-17 | TZV26 | Liquidación Final | 898.3920 | $1150.00 | $1179.58 | $1219.00 | $61989.05 | 6.00% | $35413.70 | 3.34% | 🟢 GANADOR |

## Evolución del Portfolio
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

### Composición Final del Portfolio
Efectivo final 100% (liquidado).

## Detalle de Predicciones
| Fecha | Bono | Predicción | Precio Inicial | Precio Final | Cambio | Resultado |
| --- | --- | --- | --- | --- | --- | --- |
| 2025-06-05 | AL30 | UP | 800.80 | 762.00 | -38.80 | ❌ FALLADO |
| 2025-06-05 | GD30 | UP | 823.50 | 783.00 | -40.50 | ❌ FALLADO |
| 2025-06-05 | AL29 | UP | 871.40 | 802.60 | -68.80 | ❌ FALLADO |
| 2025-06-05 | GD29 | UP | 889.50 | 824.90 | -64.60 | ❌ FALLADO |
| 2025-06-05 | AL35 | UP | 805.00 | 824.00 | 19.00 | ✅ ACERTADO |
| 2025-06-05 | GD35 | UP | 812.00 | 840.00 | 28.00 | ✅ ACERTADO |
| 2025-06-05 | AL30D | UP | 801.62 | 763.67 | -37.95 | ❌ FALLADO |
| 2025-06-05 | GD30D | UP | 820.00 | 785.81 | -34.19 | ❌ FALLADO |
| 2025-06-10 | AL30 | UP | 817.50 | 770.30 | -47.20 | ❌ FALLADO |
| 2025-06-10 | GD30 | UP | 841.00 | 795.00 | -46.00 | ❌ FALLADO |
| 2025-06-10 | GD35 | UP | 828.30 | 849.00 | 20.70 | ✅ ACERTADO |
| 2025-06-10 | AL35 | UP | 821.90 | 836.10 | 14.20 | ✅ ACERTADO |
| 2025-06-10 | GD41 | UP | 765.80 | 785.00 | 19.20 | ✅ ACERTADO |
| 2025-06-10 | AL41 | UP | 752.60 | 764.00 | 11.40 | ✅ ACERTADO |
| 2025-06-10 | AE38 | UP | 858.80 | 873.40 | 14.60 | ✅ ACERTADO |
| 2025-06-10 | GD46 | DOWN | 788.50 | 789.90 | 1.40 | ❌ FALLADO |
| 2025-06-10 | GD46D | DOWN | 788.97 | 792.18 | 3.21 | ❌ FALLADO |
| 2025-06-10 | GD41 | DOWN | 765.80 | 785.00 | 19.20 | ❌ FALLADO |
| 2025-06-10 | GD41D | DOWN | 767.40 | 787.02 | 19.62 | ❌ FALLADO |
| 2025-06-10 | AL41 | DOWN | 752.60 | 764.00 | 11.40 | ❌ FALLADO |
| 2025-06-10 | AL41D | DOWN | 756.32 | 767.67 | 11.35 | ❌ FALLADO |
| 2025-06-15 | AE38 | UP | 846.30 | 898.60 | 52.30 | ✅ ACERTADO |
| 2025-06-15 | AL29 | UP | 870.80 | 830.00 | -40.80 | ❌ FALLADO |
| 2025-06-15 | AL30 | UP | 805.40 | 799.50 | -5.90 | ❌ FALLADO |
| 2025-06-15 | AL35 | UP | 812.80 | 867.70 | 54.90 | ✅ ACERTADO |
| 2025-06-15 | AL41 | UP | 743.20 | 796.00 | 52.80 | ✅ ACERTADO |
| 2025-06-15 | GD29 | UP | 890.00 | 858.40 | -31.60 | ❌ FALLADO |
| 2025-06-15 | GD30 | UP | 825.50 | 822.50 | -3.00 | ❌ FALLADO |
| 2025-06-15 | GD35 | UP | 814.50 | 876.50 | 62.00 | ✅ ACERTADO |
| 2025-06-15 | GD38 | UP | 870.60 | 940.60 | 70.00 | ✅ ACERTADO |
| 2025-06-15 | GD41 | UP | 755.90 | 816.70 | 60.80 | ✅ ACERTADO |
| 2025-06-15 | GD46 | UP | 783.00 | 817.00 | 34.00 | ✅ ACERTADO |
| 2025-06-15 | GD29D | UP | 893.84 | 859.28 | -34.56 | ❌ FALLADO |
| 2025-06-15 | GD30D | UP | 827.87 | 824.85 | -3.02 | ❌ FALLADO |
| 2025-06-15 | GD38D | UP | 872.01 | 937.92 | 65.91 | ✅ ACERTADO |
| 2025-06-15 | GD35D | UP | 815.94 | 879.40 | 63.46 | ✅ ACERTADO |
| 2025-06-15 | GD41D | UP | 756.30 | 816.25 | 59.95 | ✅ ACERTADO |
| 2025-06-15 | GD46D | UP | 784.69 | 827.10 | 42.41 | ✅ ACERTADO |
| 2025-06-15 | AL29D | UP | 874.16 | 839.15 | -35.01 | ❌ FALLADO |
| 2025-06-15 | AL30D | UP | 805.92 | 800.49 | -5.43 | ❌ FALLADO |
| 2025-06-15 | AE38D | UP | 847.08 | 906.94 | 59.86 | ✅ ACERTADO |
| 2025-06-15 | AL35D | UP | 811.17 | 870.53 | 59.36 | ✅ ACERTADO |
| 2025-06-15 | AL41D | UP | 744.49 | 798.77 | 54.28 | ✅ ACERTADO |
| 2025-06-15 | TZX27 | UP | 2.41 | 2.31 | -0.10 | ❌ FALLADO |
| 2025-06-15 | TX31 | UP | 9.53 | 9.17 | -0.36 | ❌ FALLADO |
| 2025-06-15 | DICP | UP | 417.05 | 362.50 | -54.55 | ❌ FALLADO |
| 2025-06-15 | DIP0 | UP | 415.40 | 355.60 | -59.80 | ❌ FALLADO |
| 2025-06-15 | PARP | UP | 224.00 | 214.40 | -9.60 | ❌ FALLADO |
| 2025-06-15 | PAP0 | UP | 223.55 | 210.60 | -12.95 | ❌ FALLADO |
| 2025-06-15 | CUAP | UP | 278.80 | 257.80 | -21.00 | ❌ FALLADO |
| 2025-06-20 | AL30 | UP | 789.30 | 812.20 | 22.90 | ✅ ACERTADO |
| 2025-06-20 | GD30 | UP | 811.00 | 839.00 | 28.00 | ✅ ACERTADO |
| 2025-06-20 | AL35 | UP | 791.50 | 875.50 | 84.00 | ✅ ACERTADO |
| 2025-06-20 | GD35 | UP | 797.00 | 892.80 | 95.80 | ✅ ACERTADO |
| 2025-06-20 | AL41 | UP | 724.90 | 805.50 | 80.60 | ✅ ACERTADO |
| 2025-06-20 | GD41 | UP | 733.60 | 824.30 | 90.70 | ✅ ACERTADO |
| 2025-06-20 | TZX27 | DOWN | 2.43 | 2.39 | -0.04 | ✅ ACERTADO |
| 2025-06-20 | TX31 | DOWN | 9.69 | 9.14 | -0.54 | ✅ ACERTADO |
| 2025-06-20 | DICP | DOWN | 413.50 | 367.80 | -45.70 | ✅ ACERTADO |
| 2025-06-20 | DIP0 | DOWN | 414.20 | 361.60 | -52.60 | ✅ ACERTADO |
| 2025-06-20 | PARP | DOWN | 225.00 | 217.00 | -8.00 | ✅ ACERTADO |
| 2025-06-20 | PAP0 | DOWN | 230.00 | 217.50 | -12.50 | ✅ ACERTADO |
| 2025-06-20 | CUAP | DOWN | 278.60 | 264.80 | -13.80 | ✅ ACERTADO |
| 2025-06-25 | AL30 | UP | 823.50 | 804.00 | -19.50 | ❌ FALLADO |
| 2025-06-25 | GD30 | UP | 847.00 | 833.00 | -14.00 | ❌ FALLADO |
| 2025-06-25 | AL35 | UP | 826.70 | 875.20 | 48.50 | ✅ ACERTADO |
| 2025-06-25 | GD35 | UP | 835.80 | 888.50 | 52.70 | ✅ ACERTADO |
| 2025-06-25 | AL29 | UP | 890.00 | 841.40 | -48.60 | ❌ FALLADO |
| 2025-06-25 | GD29 | UP | 919.50 | 873.70 | -45.80 | ❌ FALLADO |
| 2025-06-25 | AL35 | DOWN | 826.70 | 875.20 | 48.50 | ❌ FALLADO |
| 2025-06-25 | GD35 | DOWN | 835.80 | 888.50 | 52.70 | ❌ FALLADO |
| 2025-06-25 | AL41 | DOWN | 753.60 | 799.90 | 46.30 | ❌ FALLADO |
| 2025-06-25 | GD41 | DOWN | 768.70 | 821.00 | 52.30 | ❌ FALLADO |
| 2025-06-25 | GD46 | DOWN | 790.00 | 811.30 | 21.30 | ❌ FALLADO |
| 2025-06-25 | GD38 | DOWN | 884.00 | 946.60 | 62.60 | ❌ FALLADO |
| 2025-06-25 | AE38 | DOWN | 862.00 | 908.60 | 46.60 | ❌ FALLADO |
| 2025-06-30 | AL30 | UP | 829.00 | 796.00 | -33.00 | ❌ FALLADO |
| 2025-06-30 | GD30 | UP | 849.10 | 820.50 | -28.60 | ❌ FALLADO |
| 2025-06-30 | AL35 | UP | 831.00 | 860.10 | 29.10 | ✅ ACERTADO |
| 2025-06-30 | GD35 | UP | 839.00 | 881.90 | 42.90 | ✅ ACERTADO |
| 2025-06-30 | AL29 | UP | 898.00 | 827.60 | -70.40 | ❌ FALLADO |
| 2025-06-30 | GD29 | UP | 924.80 | 861.00 | -63.80 | ❌ FALLADO |
| 2025-06-30 | AL41 | UP | 763.40 | 794.20 | 30.80 | ✅ ACERTADO |
| 2025-06-30 | GD41 | UP | 777.00 | 816.20 | 39.20 | ✅ ACERTADO |
| 2025-06-30 | AL30 | DOWN | 829.00 | 796.00 | -33.00 | ✅ ACERTADO |
| 2025-06-30 | GD30 | DOWN | 849.10 | 820.50 | -28.60 | ✅ ACERTADO |
| 2025-06-30 | AL35 | DOWN | 831.00 | 860.10 | 29.10 | ❌ FALLADO |
| 2025-06-30 | GD35 | DOWN | 839.00 | 881.90 | 42.90 | ❌ FALLADO |
| 2025-06-30 | AL41 | DOWN | 763.40 | 794.20 | 30.80 | ❌ FALLADO |
| 2025-06-30 | GD41 | DOWN | 777.00 | 816.20 | 39.20 | ❌ FALLADO |
| 2025-06-30 | GD46 | DOWN | 800.80 | 811.70 | 10.90 | ❌ FALLADO |
| 2025-06-30 | GD38 | DOWN | 894.00 | 938.80 | 44.80 | ❌ FALLADO |
| 2025-06-30 | GD29 | DOWN | 924.80 | 861.00 | -63.80 | ✅ ACERTADO |

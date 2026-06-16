# Informe de Backtesting del Agente Causal BonanzAR
**Bucket ID**: `analytical`
**Modelo Utilizado**: `gemma-4-31b-it`
**Temperatura**: `0.00`
**Máx Iteraciones de Herramientas**: `20`

Este informe detalla los resultados de la simulación del agente BonanzAR y la administración de su portfolio.

## Parámetros de la Simulación
- **Rango de Fechas**: Desde 2025-06-05 hasta 2025-07-03
- **Horizonte de Evaluación**: 45 días
- **Paso temporal**: 5 días

## Resumen de Métricas de Predicción
| Métrica | Valor |
| --- | --- |
| **Predicciones Totales** | 59 |
| **Predicciones Correctas** | 29 |
| **Accuracy Global** | 49.15% |
| **Precisión Alzas (UP)** | 60.00% (21/35) |
| **Precisión Bajas (DOWN)** | 33.33% (8/24) |

## Análisis de P&L de Trades (Realizados e Intermedios)
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

### Detalle de cada Trade
| Fecha | Bono | Acción | Cantidad | Pr. Compra (Nom) | Pr. Compra (Real) | Pr. Venta / Liq | P&L Nom ($) | P&L Nom (%) | P&L Real ($) | P&L Real (%) | Resultado |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 2025-06-05 | TZV26 | Compra | 917.4312 | $1090.00 | $1090.00 | - | - | - | - | - | N/A |
| 2025-06-10 | TZV26 | Venta Parcial | 458.7156 | $1090.00 | $1092.71 | $1095.00 | $2293.58 | 0.46% | $1051.32 | 0.21% | 🟢 GANADOR |
| 2025-06-10 | AL30 | Compra | 614.4264 | $817.50 | $817.50 | - | - | - | - | - | N/A |
| 2025-06-25 | AL30 | Venta Total | 614.4264 | $817.50 | $824.15 | $823.50 | $3686.56 | 0.73% | $-398.95 | -0.08% | 🔴 PERDEDOR |
| 2025-06-25 | TZV26 | Compra | 451.7680 | $1120.00 | $1120.00 | - | - | - | - | - | N/A |
| 2025-08-17 | TZV26 | Liquidación Final | 910.4836 | $1104.89 | $1142.32 | $1219.00 | $103899.34 | 10.33% | $69818.96 | 6.71% | 🟢 GANADOR |

## Evolución del Portfolio
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

### Composición Final del Portfolio
Efectivo final 100% (liquidado).

## Detalle de Predicciones
| Fecha | Bono | Predicción | Precio Inicial | Precio Final | Cambio | Resultado |
| --- | --- | --- | --- | --- | --- | --- |
| 2025-06-05 | AL30 | UP | 800.80 | 762.00 | -38.80 | ❌ FALLADO |
| 2025-06-05 | GD30 | UP | 823.50 | 783.00 | -40.50 | ❌ FALLADO |
| 2025-06-05 | AL35 | UP | 805.00 | 824.00 | 19.00 | ✅ ACERTADO |
| 2025-06-05 | GD35 | UP | 812.00 | 840.00 | 28.00 | ✅ ACERTADO |
| 2025-06-05 | AL35 | DOWN | 805.00 | 824.00 | 19.00 | ❌ FALLADO |
| 2025-06-05 | GD35 | DOWN | 812.00 | 840.00 | 28.00 | ❌ FALLADO |
| 2025-06-05 | AL41 | DOWN | 744.90 | 756.80 | 11.90 | ❌ FALLADO |
| 2025-06-05 | GD41 | DOWN | 753.00 | 779.00 | 26.00 | ❌ FALLADO |
| 2025-06-05 | AL30 | DOWN | 800.80 | 762.00 | -38.80 | ✅ ACERTADO |
| 2025-06-05 | GD30 | DOWN | 823.50 | 783.00 | -40.50 | ✅ ACERTADO |
| 2025-06-10 | AL30 | UP | 817.50 | 770.30 | -47.20 | ❌ FALLADO |
| 2025-06-10 | GD30 | UP | 841.00 | 795.00 | -46.00 | ❌ FALLADO |
| 2025-06-10 | GD35 | UP | 828.30 | 849.00 | 20.70 | ✅ ACERTADO |
| 2025-06-10 | GD41 | UP | 765.80 | 785.00 | 19.20 | ✅ ACERTADO |
| 2025-06-10 | AE38 | UP | 858.80 | 873.40 | 14.60 | ✅ ACERTADO |
| 2025-06-15 | AL30 | UP | 805.40 | 799.50 | -5.90 | ❌ FALLADO |
| 2025-06-15 | GD30 | UP | 825.50 | 822.50 | -3.00 | ❌ FALLADO |
| 2025-06-15 | AL35 | UP | 812.80 | 867.70 | 54.90 | ✅ ACERTADO |
| 2025-06-15 | GD35 | UP | 814.50 | 876.50 | 62.00 | ✅ ACERTADO |
| 2025-06-15 | AL29 | UP | 870.80 | 830.00 | -40.80 | ❌ FALLADO |
| 2025-06-15 | GD29 | UP | 890.00 | 858.40 | -31.60 | ❌ FALLADO |
| 2025-06-15 | AL41 | UP | 743.20 | 796.00 | 52.80 | ✅ ACERTADO |
| 2025-06-15 | GD41 | UP | 755.90 | 816.70 | 60.80 | ✅ ACERTADO |
| 2025-06-20 | AL30 | UP | 789.30 | 812.20 | 22.90 | ✅ ACERTADO |
| 2025-06-20 | GD30 | UP | 811.00 | 839.00 | 28.00 | ✅ ACERTADO |
| 2025-06-20 | AL35 | UP | 791.50 | 875.50 | 84.00 | ✅ ACERTADO |
| 2025-06-20 | GD35 | UP | 797.00 | 892.80 | 95.80 | ✅ ACERTADO |
| 2025-06-20 | AL41 | UP | 724.90 | 805.50 | 80.60 | ✅ ACERTADO |
| 2025-06-20 | GD41 | UP | 733.60 | 824.30 | 90.70 | ✅ ACERTADO |
| 2025-06-20 | GD35 | DOWN | 797.00 | 892.80 | 95.80 | ❌ FALLADO |
| 2025-06-20 | GD38 | DOWN | 847.40 | 956.10 | 108.70 | ❌ FALLADO |
| 2025-06-20 | GD41 | DOWN | 733.60 | 824.30 | 90.70 | ❌ FALLADO |
| 2025-06-20 | GD46 | DOWN | 766.70 | 832.50 | 65.80 | ❌ FALLADO |
| 2025-06-20 | AL35 | DOWN | 791.50 | 875.50 | 84.00 | ❌ FALLADO |
| 2025-06-20 | AL41 | DOWN | 724.90 | 805.50 | 80.60 | ❌ FALLADO |
| 2025-06-20 | AE38 | DOWN | 827.50 | 912.60 | 85.10 | ❌ FALLADO |
| 2025-06-25 | AL30 | UP | 823.50 | 804.00 | -19.50 | ❌ FALLADO |
| 2025-06-25 | GD30 | UP | 847.00 | 833.00 | -14.00 | ❌ FALLADO |
| 2025-06-25 | AL29 | UP | 890.00 | 841.40 | -48.60 | ❌ FALLADO |
| 2025-06-25 | GD29 | UP | 919.50 | 873.70 | -45.80 | ❌ FALLADO |
| 2025-06-25 | AL35 | UP | 826.70 | 875.20 | 48.50 | ✅ ACERTADO |
| 2025-06-25 | GD35 | UP | 835.80 | 888.50 | 52.70 | ✅ ACERTADO |
| 2025-06-25 | TX31 | DOWN | 9.53 | 9.28 | -0.25 | ✅ ACERTADO |
| 2025-06-25 | TZX27 | DOWN | 2.41 | 2.38 | -0.03 | ✅ ACERTADO |
| 2025-06-25 | AL30 | DOWN | 823.50 | 804.00 | -19.50 | ✅ ACERTADO |
| 2025-06-25 | GD30 | DOWN | 847.00 | 833.00 | -14.00 | ✅ ACERTADO |
| 2025-06-25 | AL35 | DOWN | 826.70 | 875.20 | 48.50 | ❌ FALLADO |
| 2025-06-25 | GD35 | DOWN | 835.80 | 888.50 | 52.70 | ❌ FALLADO |
| 2025-06-30 | AL30 | UP | 829.00 | 796.00 | -33.00 | ❌ FALLADO |
| 2025-06-30 | GD30 | UP | 849.10 | 820.50 | -28.60 | ❌ FALLADO |
| 2025-06-30 | AL35 | UP | 831.00 | 860.10 | 29.10 | ✅ ACERTADO |
| 2025-06-30 | GD35 | UP | 839.00 | 881.90 | 42.90 | ✅ ACERTADO |
| 2025-06-30 | GD41 | UP | 777.00 | 816.20 | 39.20 | ✅ ACERTADO |
| 2025-06-30 | AL41 | UP | 763.40 | 794.20 | 30.80 | ✅ ACERTADO |
| 2025-06-30 | AL30 | DOWN | 829.00 | 796.00 | -33.00 | ✅ ACERTADO |
| 2025-06-30 | GD30 | DOWN | 849.10 | 820.50 | -28.60 | ✅ ACERTADO |
| 2025-06-30 | AL41 | DOWN | 763.40 | 794.20 | 30.80 | ❌ FALLADO |
| 2025-06-30 | GD41 | DOWN | 777.00 | 816.20 | 39.20 | ❌ FALLADO |
| 2025-06-30 | GD46 | DOWN | 800.80 | 811.70 | 10.90 | ❌ FALLADO |

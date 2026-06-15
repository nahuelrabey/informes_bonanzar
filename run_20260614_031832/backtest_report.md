# Informe de Backtesting del Agente Causal BonanzAR (Test 1.2) (Lo hizo Gemini con gemma-4-31b-it)

Este informe detalla los resultados de la simulación del agente BonanzAR y la administración de su portfolio.

## Parámetros de la Simulación
- **Rango de Fechas**: Desde 2025-06-03 hasta 2025-06-04
- **Horizonte de Evaluación**: 30 días
- **Paso temporal**: 1 días
- **Restricción de Tickers**: Ninguna

## Resumen de Métricas de Predicción
| Métrica | Valor |
| --- | --- |
| **Predicciones Totales** | 34 |
| **Predicciones Correctas** | 17 |
| **Accuracy Global** | 50.00% |
| **Precisión Alzas (UP)** | 100.00% (17/17) |
| **Precisión Bajas (DOWN)** | 0.00% (0/17) |

## Análisis de P&L de Trades (Realizados e Intermedios)
| Métrica | Valor |
| --- | --- |
| **Total de Trades** | 5 |
| **Trades Acertados (Ganadores)** | 5 |
| **Trades Fallados (Perdedores)** | 0 |
| **Ganancia Total** | +$512.34 USD |
| **Pérdida Total** | -$0.00 USD |
| **P&L Operaciones Completadas** | $0.02 USD |
| **P&L Liquidaciones Fin de Simulación** | $512.32 USD |
| **P&L Total (Neto)** | $512.34 USD |

### Detalle de cada Trade
| Fecha | Bono | Acción | Cantidad | Precio Compra | Precio Venta | P&L ($) | P&L (%) | Resultado |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 2025-06-04 | TZX27 | Venta Parcial | 0.0292 | $239.05 | $239.60 | $0.02 | 0.23% | 🟢 GANADOR |
| 2025-07-04 | TZV26 | Liquidación Final | 0.0368 | $108799.85 | $117900.00 | $335.06 | 8.36% | 🟢 GANADOR |
| 2025-07-04 | TZX27 | Liquidación Final | 16.7037 | $239.05 | $242.50 | $57.63 | 1.44% | 🟢 GANADOR |
| 2025-07-04 | AL30 | Liquidación Final | 0.0124 | $80900.00 | $85900.00 | $61.84 | 6.18% | 🟢 GANADOR |
| 2025-07-04 | GD30 | Liquidación Final | 0.0120 | $83100.00 | $87900.00 | $57.79 | 5.78% | 🟢 GANADOR |

## Evolución del Portfolio (Test 1.1)
El portfolio comenzó con un capital de $10.000,00 USD.

| Fecha | Efectivo (Cash) | Valor Tenencias | Valor Total | Retorno Acumulado |
| --- | --- | --- | --- | --- |
| 2025-06-03 | $2,000.00 | $8,000.00 | $10,000.00 | 0.00% |
| 2025-06-04 | $0.00 | $10,005.53 | $10,005.53 | 0.06% |
| 2025-07-04 | $10,512.33 | $0.00 | $10,512.33 | 5.12% |

### Composición Final del Portfolio

## Detalle de Predicciones
| Fecha | Bono | Predicción | Precio Inicial | Precio Final | Cambio | Resultado |
| --- | --- | --- | --- | --- | --- | --- |
| 2025-06-03 | AL30 | UP | 81100.00 | 85200.00 | 4100.00 | ✅ ACERTADO |
| 2025-06-03 | GD30 | UP | 83190.00 | 87200.00 | 4010.00 | ✅ ACERTADO |
| 2025-06-03 | AL35 | UP | 81850.00 | 85100.00 | 3250.00 | ✅ ACERTADO |
| 2025-06-03 | GD35 | UP | 82580.00 | 85890.00 | 3310.00 | ✅ ACERTADO |
| 2025-06-03 | AL41 | UP | 75450.00 | 78400.00 | 2950.00 | ✅ ACERTADO |
| 2025-06-03 | GD41 | UP | 76440.00 | 79610.00 | 3170.00 | ✅ ACERTADO |
| 2025-06-03 | AE38 | UP | 85230.00 | 88900.00 | 3670.00 | ✅ ACERTADO |
| 2025-06-03 | TZV26 | UP | 108800.00 | 116450.00 | 7650.00 | ✅ ACERTADO |
| 2025-06-03 | TZX27 | UP | 239.05 | 242.10 | 3.05 | ✅ ACERTADO |
| 2025-06-03 | AL30 | DOWN | 81100.00 | 85200.00 | 4100.00 | ❌ FALLADO |
| 2025-06-03 | GD30 | DOWN | 83190.00 | 87200.00 | 4010.00 | ❌ FALLADO |
| 2025-06-03 | AL35 | DOWN | 81850.00 | 85100.00 | 3250.00 | ❌ FALLADO |
| 2025-06-03 | GD35 | DOWN | 82580.00 | 85890.00 | 3310.00 | ❌ FALLADO |
| 2025-06-03 | AL41 | DOWN | 75450.00 | 78400.00 | 2950.00 | ❌ FALLADO |
| 2025-06-03 | GD41 | DOWN | 76440.00 | 79610.00 | 3170.00 | ❌ FALLADO |
| 2025-06-03 | AE38 | DOWN | 85230.00 | 88900.00 | 3670.00 | ❌ FALLADO |
| 2025-06-03 | GD38 | DOWN | 87750.00 | 91380.00 | 3630.00 | ❌ FALLADO |
| 2025-06-03 | AL29 | DOWN | 87910.00 | 91730.00 | 3820.00 | ❌ FALLADO |
| 2025-06-03 | GD29 | DOWN | 89870.00 | 94620.00 | 4750.00 | ❌ FALLADO |
| 2025-06-04 | AL30 | UP | 80900.00 | 85900.00 | 5000.00 | ✅ ACERTADO |
| 2025-06-04 | GD30 | UP | 83100.00 | 87900.00 | 4800.00 | ✅ ACERTADO |
| 2025-06-04 | AL35 | UP | 81550.00 | 86000.00 | 4450.00 | ✅ ACERTADO |
| 2025-06-04 | GD35 | UP | 82340.00 | 86810.00 | 4470.00 | ✅ ACERTADO |
| 2025-06-04 | AL41 | UP | 75200.00 | 79890.00 | 4690.00 | ✅ ACERTADO |
| 2025-06-04 | GD41 | UP | 76150.00 | 80200.00 | 4050.00 | ✅ ACERTADO |
| 2025-06-04 | AE38 | UP | 85000.00 | 89900.00 | 4900.00 | ✅ ACERTADO |
| 2025-06-04 | GD38 | UP | 87400.00 | 92300.00 | 4900.00 | ✅ ACERTADO |
| 2025-06-04 | AL41 | DOWN | 75200.00 | 79890.00 | 4690.00 | ❌ FALLADO |
| 2025-06-04 | GD41 | DOWN | 76150.00 | 80200.00 | 4050.00 | ❌ FALLADO |
| 2025-06-04 | GD46 | DOWN | 79720.00 | 83080.00 | 3360.00 | ❌ FALLADO |
| 2025-06-04 | AL35 | DOWN | 81550.00 | 86000.00 | 4450.00 | ❌ FALLADO |
| 2025-06-04 | GD35 | DOWN | 82340.00 | 86810.00 | 4470.00 | ❌ FALLADO |
| 2025-06-04 | AE38 | DOWN | 85000.00 | 89900.00 | 4900.00 | ❌ FALLADO |
| 2025-06-04 | GD38 | DOWN | 87400.00 | 92300.00 | 4900.00 | ❌ FALLADO |

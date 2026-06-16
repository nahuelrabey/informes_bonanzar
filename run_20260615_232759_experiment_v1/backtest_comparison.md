# Reporte Comparativo de Backtests

Este reporte compara los resultados de las simulaciones de backtests para los distintos horizontes y configuraciones de agentes (buckets) de la corrida.

## Detalles de Configuración de los Buckets

| ID de Bucket | Modelo  | Proveedor | Temperatura | Límite Iteraciones |
| ------------ | ------- | --------- | ----------- | ------------------ |
| default      | default | default   | 0.2         | 10                 |
| agressive    | default | default   | 0.5         | 10                 |
| analytical   | default | default   | 0.0         | 20                 |

### Horizonte: 45 Dias (en ARS)

Resultados de simulación con horizonte de 45 Dias:

| id                                                                     | Trades | Acertados | Fallados | Ganancia Total (Nominal) | Ganancia Total (Real) | Pérdida Total (Nominal) | Pérdida Total (Real) | P&L Operaciones Completadas (Nominal) | P&L Operaciones Completadas (Real) | P&L Liquidaciones (Nominal) | P&L Liquidaciones (Real) | P&L Total (Nominal) | P&L Total (Real) | Balance final (Nominal) | Balance final (Real) |
| ---------------------------------------------------------------------- | ------ | --------- | -------- | ------------------------ | --------------------- | ----------------------- | -------------------- | ------------------------------------- | ---------------------------------- | --------------------------- | ------------------------ | ------------------- | ---------------- | ----------------------- | -------------------- |
| [default](bucket_default/script_01_horizon45/backtest_report.md)       | 3      | 3         | 0        | +$95,139.85              | +$55,248.84           | +$0.00                  | +$0.00               | +$33,150.80                           | +$19,835.14                        | +$61,989.05                 | +$35,413.70              | +$95,139.85         | +$55,248.84      | $1,095,139.85           | $1,053,646.42        |
| [agressive](bucket_agressive/script_01_horizon45/backtest_report.md)   | 4      | 0         | 4        | +$13,272.15              | +$0.00                | +$0.00                  | -$23,480.22          | +$3,942.38                            | -$4,025.88                         | +$9,329.77                  | -$19,454.34              | +$64,873.84         | +$26,404.44      | $1,070,181.50           | $1,029,633.70        |
| [analytical](bucket_analytical/script_01_horizon45/backtest_report.md) | 3      | 2         | 1        | +$109,879.48             | +$70,870.28           | +$0.00                  | -$398.95             | +$5,980.14                            | +$652.37                           | +$103,899.34                | +$69,818.96              | +$109,879.48        | +$70,471.33      | $1,109,879.48           | $1,067,827.58        |

---

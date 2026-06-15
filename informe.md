## Metodología:

Hay un proceso de backtest, que cuenta con una serie de parámetros: start_date, end_date, horizon, step_days, tickers, use_claude_db

- start_date: fecha de inicio
- end_date: fecha de finalización
- Horizon: Cuando el agente espera que se cumpla su análisis. Por default vale 30 días
- step_days: Cada cuánto evalúa la estrategia de inversión. Por default vale 1 día
- tickers: los activos con los que se trabaja. Por default toma todos los disponibles
- use_clude_db: Flag para seleccionar la base de datos en la nube. Por default es “false”, usa una database local

### Caso de Estudio

LLM Model: gamma-4-31b-it

#### Prompt

La prueba comienza con un prompt, que es seleccionado en específico para cada. En este caso, queremos que a partir de un conjunto de bonos nos determine cuál sería la mejor inversión para obter retornos positivos en los próximos 30 (treinta) días. A fines de poder realizar un análisis automático, solicitamos al agente que devuela la respuesta en un formato JSON.

```text
De los siguientes bonos soberanos argentinos: TZV26, AE38, AL29, AL30, AL35, AL41, BA37D, CO26, GD29, GD30, GD35, GD38, GD41, GD46, GD29D, GD30D, GD38D, GD35D, GD41D, GD46D, AL29D, AL30D, AE38D, AL35D, AL41D, TZX27, TX31, DICP, DIP0, PARP, PAP0, CUAP
¿Cuáles subirán de precio en el corto plazo debido a factores macroeconómicos y políticos (e.g. inflación IPC, tipo de cambio MEP/CCL/Blue, superávit fiscal, reservas del BCRA, tasa de política monetaria)?
Responde estrictamente en formato JSON válido, rodeado por bloques de código ```json ... ```. El JSON debe tener exactamente la siguiente estructura (con 'predicted_bonds' primero para evitar problemas de truncamiento):
{
  "predicted_bonds": ["BONO1", "BONO2"],
  "textual_response": "Tu análisis y justificación detallada de las causas de alza..."
}
```

#### Respuesta

Notemos que en la respuesta el agente identifica los bonos para analizar, y además selecciona qué funciones debe ejecutar para obtener las señales necesarias. En este caso usa dos: `obtener_context_macro` y `query_concept_paths`. El agente primero observa los bonos con mayor liquidez para buscar "tendencias" dentro del grafo causal, a partir de las señales emitidas por el contexto macro, para después evaluar el resto de bonos.

El método `obtener_contexto_macro` devuelve los siguientes parametros
- date: fecha en la que es válida esta información (cambia a lo largo del tiempo),
- fiscal_primary_balance: balance fiscal primaria,
- fiscal_financial_balance: balance financiero (TODO: CHEQUEAR CON LUCAS QUE ONDA ESTO)
- monetary_policy_rate: ,
- badlar_rate: índice badlar (publicado BCRA),
- lecap_rate: (TODO: DE DONDE SALIO),,
- monthly_inflation: inflación del mes (INDEC),
- yoy_inflation: inflación de los últimos 12 meses (INDEC),
- cer_index: (TODO: DE DONDE SALIO),,
- usd_official: Dólar mayorista BCRA (TODO: DE DONDE SALIO),
- usd_mep: Dolar MEP (TODO: DE DONDE SALIÓ, CUÁL MEP?),
- usd_ccl: Dolar CCL (TODO: DE DONDE SALIÓ, CUÁL CCL?),
- usd_blue: Dolar blue (TODO: DE DONDE SALIÓ),
- country_risk: Riesgo país (TODO: DE DONDE SALIÓ, CUÁL MEP?),
- gross_reserves: Reservas brutas (BCRA),
- net_reserves Reservas netas (BCRA),
- created_at: cuándo se cargó esta información,
- updated_at: cuándo se actualió,

Por su parte, el método `query_concept_path` devuelve para cada `concepto` una lista de causas y efectos

```
The user wants to know which of a specific list of Argentine sovereign bonds will increase in price in the short term based on macroeconomic and political factors.
The response must be in a strict JSON format.

1.  **Identify the assets**: The user provided a long list of bonds (TZV26, AE38, AL29, AL30, AL35, AL41, BA37D, CO26, GD29, GD30, GD35, GD38, GD41, GD46, GD29D, GD30D, GD38D, GD35D, GD41D, GD46D, AL29D, AL30D, AE38D, AL35D, AL41D, TZX27, TX31, DICP, DIP0, PARP, PAP0, CUAP).
2.  **Get Macro Context**: I need to know the current state of inflation, exchange rates, fiscal balance, reserves, etc. Tool: `obtener_contexto_macro`.
3.  **Get Trading Signals**: I need to check the causal graph for signals on these assets. Since there are many, I should focus on the most liquid ones or check a few key ones to identify trends. However, the prompt asks "which of the following", implying I should evaluate the list. I'll start by getting the macro context and then checking signals for the most representative bonds (AL30, GD30, etc.) and perhaps a few others to see if there's a general trend.
4.  **Causal Analysis**: Use `query_concept_paths` for key macro variables (e.g., "Superávit fiscal", "Reservas BCRA") to see how they affect bonds in general.
5.  **Synthesis**: Combine macro data, causal paths, and specific asset signals to predict which bonds will rise in the short term (30 days).
6.  **Format**: Output as JSON.
```

El agente a partir de esto crea un plan de trabajo para avanzar en el estudio de causal.

Causal Logic:
Strong Fiscal Surplus $\rightarrow$ Lower Default Risk $\rightarrow$ Lower Country Risk $\rightarrow$ Higher Bond Prices.
Low Inflation $\rightarrow$ Lower pressure on the exchange rate $\rightarrow$ Stability in Hard Dollar bonds.

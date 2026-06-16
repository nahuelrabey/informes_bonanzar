# **BonanzAR**

## **Inteligencia Causal para Decisiones Financieras**

## **El problema**

Los mercados financieros generan una cantidad masiva de información no estructurada. Los analistas deben procesar cientos de fuentes para entender una pregunta simple:

**¿Cómo impacta un determinado evento económico en un activo financiero específico?**

Las herramientas tradicionales muestran datos históricos, pero no explican las causas detrás de los movimientos del mercado. Por otro lado, los modelos de lenguaje convencionales suelen generar respuestas poco trazables, con riesgo de alucinaciones y sin contexto local actualizado.

---

### **Nuestra solución**

BonanzAR es una plataforma de inteligencia causal para mercados financieros.

Combina un grafo de conocimiento causal, un motor cuantitativo de renta fija y un agente conversacional avanzado para transformar información dispersa en análisis explicables y accionables.

En lugar de limitarse a responder, BonanzAR explica el razonamiento detrás de cada conclusión.

---

Ejemplo:

**Aumento de encajes bancarios → menor liquidez → presión bajista sobre bonos soberanos**

Cada relación incorpora evidencia y un nivel de consenso calculado a partir de múltiples fuentes independientes.

---

## **Arquitectura**

### **1\. Financial Signal Graph (FSG)**

El FSG constituye el núcleo de conocimiento de BonanzAR.

Modela relaciones de causa y efecto entre:

* Variables macroeconómicas.  
* Políticas monetarias y fiscales.  
* Eventos de mercado.  
* Instrumentos financieros.

#### **Construcción automática del conocimiento**

El sistema procesa continuamente:

* Noticias financieras.  
* Reportes de research.  
* Comunicados oficiales.  
* Informes macroeconómicos.

Utilizando modelos de lenguaje y embeddings semánticos, identifica relaciones causales y las incorpora al grafo junto con su evidencia y fuentes.

Para evitar duplicaciones conceptuales y mantener coherencia semántica, BonanzAR utiliza clustering dinámico sobre embeddings vectoriales y mecanismos de consolidación asistidos por modelos de lenguaje.

Esto permite que conceptos equivalentes provenientes de distintas fuentes converjan en una representación común del conocimiento.

---

### **2\. Motor Cuantitativo**

BonanzAR incorpora un motor financiero especializado en deuda soberana y corporativa.

Entre sus capacidades se encuentran:

* Cálculo de TIR.  
* Duration de Macaulay.  
* Duration Modificada.  
* Convexidad.  
* Proyección dinámica de cashflows.  
* Simulación de escenarios.

El sistema contempla instrumentos complejos utilizados en el mercado argentino:

* CER.  
* Dollar Linked.  
* DUAL.  
* Tasa Fija.

Además, monitorea variables macroeconómicas relevantes para calibrar sus modelos en tiempo real.

### **3\. Agente Causal Conversacional**

BonanzAR cuenta con un chat que permite consultar de manera directa e intuitiva el conocimiento almacenado en el grafo.

Cuando recibe una pregunta:

1. Identifica los activos y eventos macroeconómicos relevantes.  
2. Consulta el grafo causal (FSG) en tiempo real.  
3. Recupera las cadenas de impacto directo e indirecto respaldadas por evidencia.  
4. Complementa el análisis cualitativo con datos del motor cuantitativo de mercado.  
5. Genera una explicación clara, trazable y fundamentada.

La respuesta del agente incluye:

* **Cadena causal de impacto**: Explicación paso a paso de cómo se propaga la señal.  
* **Evidencia y fuentes originales**: Enlaces e información de prensa que respaldan las relaciones causales.  
* **Métricas financieras de renta fija**: TIR, duration y flujos proyectados de los activos afectados.  
* **Simulación de escenarios alternativos**: Análisis de variabilidad ante cambios en los supuestos macro.  
* **Fundamentación cuantitativa**: Justificación matemática y económica de las conclusiones.

---

### **4\. Model Incubator (Validación y Optimización de Estrategias)**

Para validar empíricamente las recomendaciones del agente y mejorar de forma continua el proyecto, BonanzAR incorpora un entorno de incubación de modelos que simula y testea estrategias analíticas sobre datos históricos:

* **Evaluación de Escenarios Temporales**: Ejecuta instancias de prueba aisladas en el tiempo para evaluar de forma controlada el comportamiento de la estrategia.
* **Auditoría de Decisiones y Operaciones**: Analiza las operaciones de compra y venta propuestas por el agente y evalúa si las conclusiones y justificaciones que generó se alinearon con la evolución real del mercado para optimizar los prompts del RAG.
* **Optimización de Parámetros**: Si las simulaciones resultan exitosas en la incubadora, sus hiperparámetros (como la temperatura de generación del modelo y los plazos de evaluación) se consolidan para retroalimentar y refinar la configuración del agente en producción.

---

## **Diferenciales Competitivos**

### **Explicabilidad total**

No entrega respuestas opacas. Cada conclusión está acompañada por la cadena causal que la justifica y por las fuentes que la respaldan.

### **Inteligencia Financiera Basada en Evidencia**

Las hipótesis generadas por el sistema están respaldadas por información documentada y verificable.

### **Sin alucinaciones**

El agente no inventa relaciones. Solo razona sobre conocimiento previamente validado y almacenado en el grafo.

### **Integración de Narrativa y Matemática**

BonanzAR combina razonamiento causal y simulación financiera cuantitativa dentro de un mismo flujo analítico de toma de decisiones.

### **Adaptación al Mercado Argentino, escalable a otros mercados**

Diseñado para responder al entorno de mayor volatilidad macroeconómica, multiplicidad de tipos de cambio y distorsiones de tasas del mundo. Si el modelo domina la estructura argentina, la adaptación a otros mercados emergentes es sencilla.

### **Reducción de Tiempo Analítico**

Automatiza tareas que normalmente requieren horas de lectura, investigación cruzada y modelado financiero manual.

### **Validación Histórica de Estrategias (Incubadora de Modelos)**

Las recomendaciones lógicas del agente se contrastan sistemáticamente contra la realidad del mercado en períodos históricos, permitiendo evaluar el desempeño y optimizar la parametrización de las estrategias lógicas.

### **Evaluación Estratégica de Instrumentos de Renta Fija**

Analiza y proyecta el flujo de cupones e intereses contractuales de bonos dentro del análisis temporal, integrándolos en las conclusiones del agente para optimizar la toma de decisiones.

---

## **Modelo de Ingresos Estimados**

Si bien no existe en el mercado argentino un competidor con un sistema de grafo de conocimiento causal equivalente, hay plataformas de análisis de renta fija con propuestas de valor parcialmente comparables, que sirven como referencia de disposición a pagar del mercado.

### **Usuarios Finales (B2C / Retail)**

Mercap Abbaco, plataforma de análisis de bonos orientada a inversores retail y experimentados, publica los siguientes precios de suscripción mensual[^8]:

| Plan | Precio mensual |
|---|---|
| Esencial | $7.900 ARS |
| Avanzado | $24.900 ARS |
| Experto | $49.900 ARS |

Docta Capital, plataforma DPM dirigida a ALyCs y bancos, también ofrece una terminal de análisis de bonos para uso individual ("Docta Pro") a **ARS 44.900/mes** (con promoción de 90% off el primer mes)[^9] — un punto de referencia adicional, por encima del plan más caro de Mercap Abbaco, que confirma que el mercado tolera precios superiores a $40.000 ARS/mes por una terminal de bonos sin la capa causal que ofrece BonanzAR.

BonanzAR ofrece una capa adicional que ningún competidor retail tiene hoy: explicación causal trazable (no solo métricas, sino el *por qué* detrás de cada movimiento) y un agente conversacional que reduce el tiempo de research. Esto justifica posicionar los planes en una banda similar o superior a la de estos dos competidores, en lugar de competir por precio:

| Plan propuesto | Precio mensual estimado | Alcance |
|---|---|---|
| Básico | $9.900 – $12.900 ARS | Acceso al agente conversacional y consultas acotadas al grafo causal |
| Avanzado | $29.900 – $34.900 ARS | Grafo causal completo, simulación de escenarios, motor cuantitativo |
| Experto | $54.900 – $59.900 ARS | Uso prioritario, exportación de informes, mayor volumen de consultas |

### **Usuarios Institucionales (B2B) — Acceso vía API**

Docta Capital publica precios para su producto de acceso institucional vía API, en una página de documentación separada de su sitio principal[^10]:

| Plan Docta API | Precio mensual | Límites |
|---|---|---|
| Básico | Gratis | 10 requests/minuto, 10 requests/día |
| Intermedio | ARS 65.000 | 60 requests/minuto, 100 requests/día, soporte prioritario |
| Pro | ARS 150.000 | 120 requests/minuto, requests diarios ilimitados, soporte dedicado |

**Esto es directamente relevante para BonanzAR**: el diseño actual de la base de datos de bonos (81 instrumentos parametrizados bajo 9 categorías de ajuste, con motor de cálculo de TIR/duration/convexidad) ya contiene los datos necesarios para replicar un servicio de API equivalente al de Docta, sin desarrollo adicional sustancial más allá de exponer los endpoints. Esto abre una vía de ingresos B2B de bajo costo incremental:

| Plan propuesto (API BonanzAR) | Precio mensual estimado | Justificación |
|---|---|---|
| Básico | Gratis | Igual a Docta — adquisición de desarrolladores/fintechs pequeñas |
| Intermedio | ARS 65.000 – 80.000 | En línea con Docta Intermedio, con el agregado de endpoints del grafo causal |
| Pro | ARS 150.000 – 180.000 | En línea con Docta Pro, con acceso a relaciones causales y simulación de escenarios vía API |

Los precios de Docta y Mercap Abbaco relevados corresponden a planes de acceso individual/retail. **Falta investigar los acuerdos comerciales institucionales de estos servicios** (licencias de Terminal completa para varios asientos dentro de una ALyC o banco, contratos de mayor escala), dado que no publican esa información — es esperable que el ticket institucional sea sustancialmente más alto que el plan retail, y habitualmente se negocia de forma personalizada según volumen de usuarios, AUM gestionado o nivel de integración requerido.

### **Auditoría de Fiabilidad de Informes (Consultoras y Research)**

Una capacidad adicional del grafo de conocimiento causal es evaluar la **fiabilidad de un informe o reporte de research** de terceros: dado un documento de análisis (de un banco, una consultora o un research independiente), el sistema puede contrastar sus afirmaciones causales contra la evidencia ya verificada en el grafo, señalando relaciones que carecen de sustento, que contradicen evidencia previa, o que se basan en fuentes de baja calidad. Esto convierte al producto en una herramienta de control de calidad para quienes producen o consumen research de forma recurrente — particularmente consultoras económico-financieras, que necesitan sostener la credibilidad de sus informes ante clientes institucionales y para quienes un error de consistencia interno puede tener costo reputacional alto. Se trata de un caso de uso institucional adicional al acceso vía API descrito arriba, con un modelo de precios a definir (por informe auditado o por suscripción), que **aún no fue validado con clientes potenciales** y se incorpora aquí como una línea de exploración para fases posteriores del roadmap, no como un ingreso proyectado en el corto plazo.

---

### **Estado Actual y Roadmap de Desarrollo**

#### **Estado Actual (MVP Funcional End-to-End)**

La infraestructura técnica está validada y operativa de punta a punta:

* **Catálogo de Activos**: Catálogo parametrizado de **81 bonos soberanos** argentinos bajo 9 categorías de ajuste (FIJO, HD, CER, DL, DUAL, BADLAR, TAMAR, LECAP, BONCAP).
* **Base Relacional y Motor Cuantitativo**: Base de datos relacional y motor matemático para cálculo de TIR, duration (Macaulay y Modificada), convexidad y proyección de cashflows.
* **Pipeline del Grafo Causal**: Extractor de relaciones causa-efecto automatizado con modelos de lenguaje, clustering semántico dinámico para unificar conceptos y base de datos de grafos.
* **Model Incubator**: Entorno de pruebas funcional para evaluar estrategias en periodos temporales aislados e identificar los mejores parámetros para el agente.
* **Simulación de Renta Fija**: Lógica que estima intereses y cupones de bonos soberanos en la toma de decisiones del agente durante las simulaciones.
* **Interfaz de Usuario**: Aplicación web con chat conversacional interactivo, soporte para streaming de texto e inspección de las cadenas lógicas del grafo.

#### **Roadmap Estratégico**

* **Fase 1: Validación Histórica y Optimización de Estrategias (Completada/Fase de Ajuste)**
  * **Foco:** Implementación y validación empírica de estrategias de inversión a lo largo de eventos económicos clave para calibrar hiperparámetros (temperatura del agente y horizontes temporales) y optimizar el scoring del agente incorporando cupones.
  * **Entregable:** Infraestructura de la incubadora de modelos validada con reportes de comparación consolidados.
* **Fase 2: Automatización de Ingesta Autónoma y Curaduría Continua**
  * **Foco:** Extractor totalmente autónomo que analice feeds de noticias y reportes de research en tiempo real, detecte variables activas e identifique impactos cruzados cargándolos al grafo de manera incremental sin intervención humana.
  * **Entregable:** Pipeline de ingesta diaria autónoma y emisión de reportes matutinos automáticos.
* **Fase 3: Producto Comercial y APIs de Integración Institucional**
  * **Foco:** Conexión de feeds de cotizaciones de mercado en tiempo real y diseño de APIs institucionales para terminales de agentes de liquidación y compensación (ALyCs), gestoras de fondos de inversión y apertura de la plataforma a clientes institucionales de pago.
  * **Entregable:** Software as a Service (SaaS) financiero comercial con facturación recurrente.
* **Fase 4: Simulador de Escenarios y Análisis de Políticas**
  * **Foco:** Habilitar consultas hipotéticas de tipo "¿Qué pasaría si...?" en el agente causal, permitiendo que los analistas simulen el impacto encadenado de decisiones de política fiscal y monetaria sobre el portafolio de renta fija.
  * **Entregable:** Módulo avanzado de simulación de escenarios macroeconómicos y estrés de portafolios.

## **Costos de Desarrollo y Conectividad**

* **Acceso a Feeds e Información en Tiempo Real**: Esta necesidad de conectividad aplica exclusivamente a la obtención de precios de mercado, históricos o en tiempo real. El resto de las capacidades de BonanzAR —grafo de conocimiento causal, agente conversacional, motor cuantitativo sobre términos contractuales públicos de los bonos y model incubator— no dependen de este acceso y operan de forma autónoma. Para la obtención de precios, existen dos vías: (a) contratar directamente el servicio de Market Data de BYMA, con un costo de USD 1.000 mensuales para no-miembros[^4]; o (b) establecer una asociación comercial con un Agente de Liquidación y Compensación (ALyC) para utilizar sus credenciales y APIs autorizadas. La opción (b) solo es necesaria si el producto evoluciona hacia la ejecución de operaciones (compra/venta) dentro de la plataforma, función regulatoriamente reservada a un ALyC; para el consumo de datos de precios sin ejecución, la vía directa con BYMA resulta más simple y económica. Cabe destacar que el costo de USD 1.000 mensuales habilita el consumo de los datos, pero **mostrarlos a los usuarios finales de la plataforma (end users) requiere una negociación adicional con BYMA** para obtener la condición de Distribuidor autorizado, bajo la cual BYMA exige que esos usuarios finales se comprometan contractualmente a no redistribuir ni retransmitir la información. Este costo se integrará dentro del presupuesto de desarrollo comercial de la Fase 3.

---

## **Uso de Fondos**

La inversión solicitada de **USD [COMPLETAR MONTO]** se destina a financiar la ejecución de las Fases 2 y 3 del roadmap, distribuida en las siguientes categorías:

* **Equipo Fundador (Desarrollo Full-Time)**: Compensación de **ARS 1.500.000 mensuales por persona** para el equipo de 4 integrantes dedicado de forma exclusiva al desarrollo y operación de la plataforma durante el período de ejecución de la ronda. Se establece un monto uniforme para todo el equipo, dado que las tareas del proyecto —construcción del grafo de conocimiento causal, pipelines de procesamiento de lenguaje natural y embeddings semánticos, y el motor cuantitativo de renta fija— requieren competencias avanzadas en ciencia de datos, diseño de algoritmos y arquitectura de sistemas que exceden el desarrollo de software convencional. El monto se ubica por debajo de la referencia de mercado local para un perfil de Arquitecto de Software senior en Argentina[^1], y por debajo de la tarifa de exportación de un Programador Cuantitativo (mercado dolarizado de desarrollo fintech remoto)[^2], encontrándose en línea con la referencia de mercado de un Científico de Datos local[^3]. Esto es consistente con las prácticas estándar de etapas pre-seed/seed, dado que el retorno principal del equipo está representado por su participación accionaria y no por su remuneración.
* **Infraestructura y Conectividad (Fase 3)**: Acuerdo comercial con un ALyC para acceso a feeds de cotizaciones en tiempo real y APIs institucionales (detallado en la sección anterior).
* **Ingesta Autónoma y Curaduría (Fase 2)**: Desarrollo del extractor de ingesta continua y los pipelines de identificación de impactos cruzados.
* **Comercialización (Fase 3)**: Desarrollo de APIs de integración institucional para ALyCs y gestoras de fondos.
* **Infraestructura Cloud (LLM API + Base de Datos)**: Costo variable, proporcional al volumen de noticias e informes procesados por el extractor de relaciones causales y al uso del agente conversacional por parte de los usuarios. A la fecha, en fase de desarrollo (uso liviano, no de ingesta continua en régimen), el consumo de API de modelos de lenguaje fue de aproximadamente USD 2,8/día[^5], y la base de datos (Supabase) opera dentro del plan gratuito o del plan Pro de entrada (USD 25/mes)[^6]. Esta partida no se fija como un monto cerrado: se prevé una arquitectura híbrida de modelos de lenguaje, reservando modelos de mayor capacidad (Claude Sonnet/Opus) para la extracción de relaciones causales y la generación de respuestas del agente —tareas donde la precisión es el diferencial competitivo del producto (explicabilidad, ausencia de alucinaciones)— y derivando tareas de menor riesgo semántico (clasificación, filtrado inicial, resumen) a modelos de menor costo (ej. Gemini Flash-Lite o DeepSeek, hasta 10-30x más económicos por token)[^7], lo cual permite escalar el volumen de ingesta sin que el costo de LLM crezca linealmente con él.

Cada partida está directamente vinculada a un entregable medible del roadmap; no se contemplan gastos generales sin un milestone asociado.

[^1]: Referencia de mercado para Arquitecto de Software / Lead senior en Argentina (~ARS 2.100.000–4.000.000+ mensuales, junio 2026): [Talently - Salario Arquitecto de Software](https://talently.tech/herramientas/salario/developer/arquitecto-de-software).
[^2]: Tarifa de exportación para desarrolladores fintech senior argentinos en roles remotos dolarizados (USD 46.000–82.500 anuales, ~USD 4.000–6.900 mensuales): [Trio.dev - Fintech Developers in Argentina](https://trio.dev/fintech-developers-argentina/).
[^3]: Referencia de mercado local para Científico de Datos en Argentina (~USD 1.060 mensuales promedio, equivalente a ~ARS 1.537.000 al tipo de cambio oficial de junio 2026): [Coderhouse - Sueldo Data Scientist Argentina](https://www.coderhouse.com/ar/sueldos/sueldo-data-scientist-argentina-2025).
[^4]: Precios públicos de Market Data de BYMA para no-miembros (Snapshot/tiempo real USD 1.000/mes, Delay USD 500/mes, EOD USD 50/mes): [BYMA - APIs de Market Data](https://www.byma.com.ar/en/products/data-products/market-data/apis).
[^5]: Consumo real de API de Anthropic (Claude) registrado entre el 7 y el 15 de junio de 2026 en el entorno de desarrollo del proyecto: USD 25,14 acumulados en 9 días (~USD 2,8/día), correspondiente a uso exploratorio/testing, no a ingesta continua en régimen. Precios de referencia por modelo (por millón de tokens): Claude Haiku 4.5 USD 1,00/5,00, Claude Sonnet 4.6 USD 3,00/15,00, Claude Opus 4.8 USD 5,00/25,00 (input/output): [CloudZero - Claude API Pricing 2026](https://www.cloudzero.com/blog/claude-api-pricing/).
[^6]: Planes de Supabase vigentes a 2026: Free (USD 0/mes, 500MB DB), Pro (USD 25/mes base, 8GB DB), Team (USD 599/mes, con compliance SOC2/HIPAA): [UI Bakery - Supabase Pricing 2026](https://uibakery.io/blog/supabase-pricing).
[^7]: Comparación de precios de APIs de LLM alternativas (por millón de tokens, input): Gemini 2.5 Flash-Lite USD 0,10, DeepSeek V3.2 USD 0,28/0,42, Grok 4 Fast USD 0,20/0,50 — significativamente más económicos que Claude Sonnet/Opus para tareas de bajo riesgo semántico: [BenchLM.ai - LLM API Pricing Comparison 2026](https://benchlm.ai/llm-pricing).
[^8]: Precios públicos de suscripción mensual de Mercap Abbaco (plataforma de análisis de renta fija para inversores retail), junio 2026: [Mercap Abbaco - Precios](https://mercapabbaco.com/precios/).
[^9]: Precio público de "Docta Pro" (terminal individual de análisis de bonos): ARS 44.900/mes, con promoción de 90% off el primer mes (ARS 4.490), junio 2026: [Docta Capital](https://www.doctacapital.com.ar/).
[^10]: Precios públicos de Docta API (acceso institucional vía API a datos de bonos): Básico gratis, Intermedio ARS 65.000/mes, Pro ARS 150.000/mes, junio 2026: [Docta Capital - Documentación de API y Precios](https://docs.doctacapital.com.ar/).

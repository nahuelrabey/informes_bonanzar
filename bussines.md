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

BonanzAR cuenta con una interfaz conversacional en tiempo real (streaming de texto) que permite consultar de manera directa e intuitiva el conocimiento almacenado en el grafo.

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

Diseñado para responder al entorno de mayor volatilidad macroeconómica, multiplicidad de tipos de cambio y distorsiones de tasas del mundo. Si el modelo domina la estructura argentina, la adaptabilidad a otros mercados emergentes está asegurada.

### **Reducción de Tiempo Analítico**

Automatiza tareas que normalmente requieren horas de lectura, investigación cruzada y modelado financiero manual.

### **Validación Histórica de Estrategias (Incubadora de Modelos)**

Las recomendaciones lógicas del agente se contrastan sistemáticamente contra la realidad del mercado en períodos históricos, permitiendo evaluar el desempeño y optimizar la parametrización de las estrategias lógicas.

### **Evaluación Estratégica de Instrumentos de Renta Fija**

Analiza y proyecta el flujo de cupones e intereses contractuales de bonos dentro del análisis temporal, integrándolos en las conclusiones del agente para optimizar la toma de decisiones.

---

### **Estado Actual y Roadmap de Desarrollo**

#### **Estado Actual (MVP Funcional End-to-End)**

La infraestructura técnica está validada y operativa de punta a punta:

* **Catálogo de Activos**: Catálogo parametrizado de **81 bonos soberanos** argentinos bajo 6 categorías de ajuste (Tasa Fija, CER, Dollar Linked, DUAL, BADLAR).
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

* **Acceso a Feeds e Información en Tiempo Real**: Para el funcionamiento comercial en tiempo real y la obtención de precios oficiales de los mercados locales, se requiere establecer una asociación y acuerdo comercial con un Agente de Liquidación y Compensación (ALyC) con el fin de utilizar sus credenciales y APIs autorizadas, lo cual representa un costo operativo de conectividad que se integrará dentro del presupuesto de desarrollo comercial de la Fase 3.


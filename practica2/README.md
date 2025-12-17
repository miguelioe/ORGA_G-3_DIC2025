ESTRUCTURA QUE DEBEMOS TENER:
- [x] CARATULA
- [ ] INTRODUCCION
- [x] OBJETIVOS
- [x] MARCO TEORICO
- [ ] EXPLICACION DEL SISTEMA
- [ ] EXPLICACION DEL PROCESSING
- [x] LO DEL PRESUPUESTO
- [ ] RESULTADOS
- [ ] CONCLUSIONES
- [ ] APORTES INDIVIDUALES
- [x] REFERENCIAS BIBLIOGRÁFICAS

PARA EL VIDEO, ORDEN:
- [ ] Presentación del grupo y explicacion de la practica -> MARIO 
- [ ] Demostracion del simulador y progra componente a componente
- [x] se muestra el armado y prueba en fisico 
- [x] se repite con el resto
- [x] Explicacion del codigo y simulador final 
- [ ] se muestra el armado de todo en fisico
- [x] pruebas de los leds y luz
- [ ] muestra final usando processing

---

Universidad San Carlos de Guatemala

Facultad de Ingeniería

Ingeniería en Ciencias y Sistemas

Organización Computacional

Escuela de vacaciones diciembre 2025

Ing. Carlos Alberto Arias López

Aux. Dilan Conaher Suy Miranda

**Práctica 2:**
**Medidor de temperatura, humedad y nivel de luz**

Integrantes:

- Jose Brayan Arnoldo Murcia López - 3374570262004
- Abner Emanuel Garcia Sandoval - 2791049521905
- Mario Miguel López Sagastume - 3388185962011
- Alejandro José Salazar Ramirez - 3506308361904
- Julio René Morales Posadas - 2977547932008

Guatemala, 17 de diciembre del 2025

---

# Objetivos
## General
Desarrollar en los estudiantes el conocimiento y la capacidad para diseñar e implementar un sistema físico funcional de monitoreo ambiental, mediante el uso de sensores, herramientas de adquisición de datos y comunicación serial; permitiéndoles aplicar de manera práctica, conceptos fundamentales de sistemas embebidos, automatización y arquitectura de computadoras, fortaleciendo sus habilidades técnicas y su comprensión a los conocimientos necesarios para el funcionamiento de sistemas electrónicos reales.
## Específicos
1. Identificar y comprender el funcionamiento de los sensores ambientales y los componentes electróncios para la adquisición de datos en un sistema de monitores ambiental.
2. Diseñar e implementar un sistema embebido con la capacidad de adquirir, procesar y mostrar datos ambientales mediante comunicación serial, asegurando su correcto funcionamiento a nivel físico y también lógico.
3. Aplicar conceptos fundamentales para sistemas embebidos y automatización para promover en los estudiantes conocimientos y habilidades con respecto a la integración de hardware y software.

# Marco teórico

## 1. Sensores

- Un sensor es un dispositivo electrónico capaz de detectar una magnitud física del entorno, como temperatura, humedad o luz, y convertirla en una señal eléctrica que puede ser interpretada por un microcontrolador.
- En proyectos con Arduino, los sensores permiten obtener información del entorno en tiempo real para su análisis, visualización y control de otros dispositivos.

### 1.1 Sensor de temperatura y humedad DHT11

- El DHT11 es un sensor digital que mide temperatura y humedad relativa.
- Internamente utiliza un sensor capacitivo para la humedad y un termistor para la temperatura.
- La información se transmite mediante una señal digital por un solo pin de datos, lo que facilita su conexión.

- Características principales:
  - Rango de temperatura: 0 °C a 50 °C
  - Rango de humedad: 20 % a 90 %
  - Salida digital
  - Bajo consumo de energía
  - Uso común en proyectos educativos

### 1.2 Sensor de luz LDR

- La LDR (Light Dependent Resistor) es una resistencia dependiente de la luz cuya resistencia varía según la intensidad luminosa.
- A mayor cantidad de luz, menor resistencia; a menor luz, mayor resistencia.
- Este sensor entrega una señal analógica que puede ser leída por Arduino a través de una entrada analógica usando un divisor de voltaje.

- Aplicaciones comunes:
  - Medición de luz ambiental
  - Encendido automático de luces
  - Sistemas de monitoreo

### 1.3 Actuadores: LEDs y buzzer

- Los LEDs son dispositivos que emiten luz cuando circula corriente eléctrica a través de ellos.
- Se utilizan como indicadores visuales del estado del sistema.
- El buzzer es un actuador que genera sonido y se emplea como alerta cuando se cumple una condición específica, como una temperatura elevada o baja iluminación.

---

## 2. Comunicación serial

- La comunicación serial es un método de transmisión de datos en el que la información se envía bit a bit a través de un canal de comunicación.
- En Arduino, la comunicación serial se utiliza principalmente para intercambiar información entre la placa y una computadora.

### 2.1 Comunicación serial en Arduino

- Arduino utiliza el estándar UART (Universal Asynchronous Receiver-Transmitter).
- Permite enviar datos como lecturas de sensores hacia el monitor serial del Arduino IDE.

- Funciones principales:
  - Serial.begin(9600)
  - Serial.print()
  - Serial.println()

- La velocidad de transmisión más utilizada es 9600 baudios.

### 2.2 Importancia de la comunicación serial

- Permite visualizar datos en tiempo real.
- Facilita la depuración del programa.
- Ayuda a verificar el correcto funcionamiento de sensores y actuadores.
- Es fundamental en proyectos de monitoreo ambiental.

---

# Materiales utilizados y presupuesto
|Nombre|Precio(Q)|Cantidad|Total(Q)|
|:-:|:-:|:-:|:-:|
|Arduino Uno|150.00|1|150.00|
|Sensor de luz LDR|16.00|1|16.00|
|Sensor de humedad y temperatura DHT11|25.00|1|25.00|
|Buzzer|11.00|1|11.00|
|Resistencias de diversos valores|1.50|3|7.50|
|Cables de red recortados y adaptados|3.00|1|3.00|
|Leds diversos colores|1.00|3|3.00|
|Protoboard|70.00|1|70.00|
|**Total (Q)**|||285.50|

---

# Conclusiones.
1. Se alcanzó a identificar y comprender el funcionamiento de los sensores ambientales. En este caso utilizando el sensor de temperatura, humedad, calidad del aire y luminosidad; así como integración física de estos componentes con herramientas para la lectura de estos datos. Esta comprensión es fundamental para seleccionar los componentes adecuados y garantizar mediciones válidas en cualquier sistema de monitoreo.
2. A través del diseño e implementación de un sistema embebido, se consiguió adquirir, procesar y visualizar datos ambientales a través de comunicación serial y también de forma gráfica. Fue necesario una estricta verificación de forma física como también lógica para obtener un correcto funcionamiento del sistema.
3. Como finalidad de este proyecto, se aplicaron conceptos fundamentales de sistemas embebidos y automatización, integrando hardware(sensores y componentes), como verificación física(conexiones, alimentación, integridad de las señales) y razonamiento lógico(programación, protocolos, procesamiento de datos) de manera coherente y colaborativa. Esto permitió fortalecer en los estudiantes las habilidades prácticas y teóricas necesarias para desarrollar soluciones tecnológicas que respondan a situaciones reales, promoviendo una vision integral del diseño de sistemas automatizados.

# Referencias bibliográficas

- Arduino. (s.f.). *Arduino Reference*. https://www.arduino.cc/reference/en/
- Arduino. (s.f.). *Serial Communication*. https://www.arduino.cc/reference/en/language/functions/communication/serial/
- Adafruit Industries. (s.f.). *DHT11 Temperature & Humidity Sensor*. https://learn.adafruit.com/dht
- SparkFun Electronics. (s.f.). *Photocell (LDR) Hookup Guide*. https://learn.sparkfun.com/tutorials/photocell-hookup-guide
- Monk, S. (2016). *Programming Arduino: Getting Started with Sketches*. McGraw-Hill Education.

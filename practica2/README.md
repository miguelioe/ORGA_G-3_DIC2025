Universidad San Carlos de Guatemala

Facultad de Ingeniería

Ingeniería en Ciencias y Sistemas

Organización Computacional

Escuela de vacaciones diciembre 2025

Ing. Carlos Alberto Arias López

Aux. Dilan Conaher Suy Miranda

**Práctica 2:**
**Monitoreo Ambiental**

Integrantes:

- Jose Brayan Arnoldo Murcia López - 3374570262004
- Abner Emanuel Garcia Sandoval - 2791049521905
- Mario Miguel López Sagastume - 3388185962011
- Alejandro José Salazar Ramirez - 3506308361904
- Julio René Morales Posadas - 2977547932008

Guatemala, 17 de diciembre del 2025

---
# Introducción
Los sistemas de monitoreo ambiental juegan un papel fundamental en diversa áreas como la agricultura, la automatización industrial y la aplicacion del internet de las cosas (IoT). 

La presente práctica de laboratorio tiene como propósito el diseño e implementación de un sistema de monitoreo ambiental en tiempo real, integrando componentes de hardware y software mediante el uso de un microcontrolador arduino UNO. El sistema desarrollado es capaz de medir la temperatura y humedad ambiental utilizando un sensor digital DTH11, así como el nivel de luz mediante una fotoresistencia (LDR), procesando dichas lecturas y trasnmitiéndolas a una aplicacion de escritorio a través d ecomunicación serial.

Adicionalmente, el sistema incorpora actuadores físicos como LEDs y un buzzer, los cuales responden automáticamente según los rangos de temperatura establecidos, proporcionando retroalimentación visual y sonora de manera local.

Esta práctica fortalece los conocimientos en sistemas embebidos, adquisición de datos, comunicación serial, programación orientada a objetos y visualización gráfica interactiva, permitiendo aplicar de forma integral conceptos teóricos en una solución funcional y realista, acorde a los requerimientos actuales de los sistemas de monitoreo ambiental.


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
# Explicación del sistema

  El sistema consiste en los siguientes componentes y microcontroladores:

  - Sensor detector de temperatura y humedad DHT11
  - Fotorresistencia LDR lm393
  - Buzzer piezoeléctrico
  - Leds
  - Arduino UNO

  Usando el sensor DHT11 y la fotorresistencia LDR se deben tomar los datos del entorno, tales como temperatura, humedad y la cantidad de luz del entorno, para posteriormente enviar los datos recaudados a una placa de pruebas Arduino UNO, que debe recibir los datos y procesarlos.
  
  El procesamiento de los datos del sensor DHT11 se hace mediante el uso de la librería DHT.h, que permite directamente recaudar la información de temperatura en grados Celsius y el porcentaje de humedad en el entorno.

  Para la fotorresistencia LDR se obtiene el dato mediante un puerto analógico y recibe los valores de 0 a 1023, para luego usar un mapeo para convertir los valores de continuo a porcentaje, para mostrar el valor de la luz en porcentaje.

  Al obtener los datos se debe de reflejar el cambio de temperatura mediante el uso de distintos diodos leds de colores, usando un led de color verde para representar una temperatura menor a 25 grados Celsius, uno amarillo para representar una temperatura entre 25 a 30 grados Celsius, y uno rojo para representar una temperatura mayor a 30 grados Celsius, además, al momento de encender el led rojo se enciende a la vez un buzzer piezoeléctrico con una frecuencia de 1000hz.

  Los datos obtenidos mediante los sensores a su vez son enviados mediante el puerto Serial a la computadora, estos son obtenidos como CSV y utilizados para hacer un entorno de usuario gráfico usando la herramienta gratuita Processing.

  En Processing se debe mostrar tres gráficas de barras para mostrar los cambios en temperatura, humedad y luz; además de indicadores de gauge para mostrar la cantidad de estos tres valores. Finalmente el programa debe mostrar alertas al momento de que la temperatura alcanza los 30 grados Celsius o más.

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

# Resultados
Durante el desarrollo y ejecución de la práctica de laboratorio se obtuvo un sistema de monitoreo ambiental completamente funcional, cumpliendo con los requerimientos establecidos en el enunciado. El sistema permitió la captura, transmisión y visualización en tiempo real de las variables ambientales: temperatura, humedad y nivel de luz.

El sensor DHT11 proporcionó lecturas estables de temperatura y humedad ambiental dentro de su rango de operación. Las mediciones obtenidas fueron correctamente procesadas por el microcontrolador Arduino y transmitidas a través de comunicación serial a una velocidad de 9600 baudios, utilizando un formato de datos tipo CSV. Se comprobó que la validación de datos funcionó correctamente.

Por otro lado, la fotorresistencia LDR permitió medir el nivel de iluminación ambiental mediante el conversor analógico-digital del Arduino, obteniendo valores entre 100 y 804 debido a la calibracion física del componente mismo, los cuales fueron normalizados a un porcentaje de 0 a 100. Estas lecturas reflejaron de forma consistente los cambios de luz en el entorno durante las pruebas realizadas.

En cuanto a los actuadores, los LEDs respondieron correctamente según los rangos de temperatura establecidos: el LED verde se activó para temperaturas menores o igual 25 °C, el LED amarillo para temperaturas mayores a 25 °C o menores de 30 °C, y el LED rojo para temperaturas superiores o iguales a 30 °C. Asimismo, el buzzer se activó de manera automática cuando la temperatura superó el umbral crítico, emitiendo una señal sonora que permitió identificar de forma inmediata la condición de alerta.

Así también, la aplicación desarrollada en Processing mostró un funcionamiento fluido y estable. El dashboard permitió la visualización en tiempo real de las variables ambientales mediante gráficas dinámicas, indicadores tipo gauge y un panel de alertas visuales que se activó correctamente al detectarse temperaturas mayores a 30 °C.

Los resultados obtenidos evidencian que el sistema cumple con los objetivos planteados, integrando de forma eficiente hardware y software para el monitoreo ambiental en tiempo real, demostrando la correcta aplicación de los conceptos de sistemas embebidos, comunicación serial y visualización gráfica interactiva.

## Circuito Emulado
![Circuito_Emulado](/practica2/img/CircuitoEmulado.jpeg)

## Circuito Fisico
![Circuito_Fisico](/practica2/img/CircuitoFisico.jpeg)

![Circuito_de_lado](/practica2/img/CircuitoLado.jpeg)

![Circuito_por_atras](/practica2/img/circuitoAtras.png)

---

# Conclusiones
1. Se logró diseñar e implementar un sistema físico funcional de monitoreo ambiental mediante el uso de sensores de temperatura, humedad y nivel de luz. La integración de la parte teórica y práctica permitió aplicar correctamente conceptos de sistemas embebidos, automatización y arquitectura de computadoras. Asimismo, el proyecto fortaleció las habilidades técnicas de los estudiantes y su comprensión del funcionamiento de sistemas electrónicos reales.

2. Se alcanzó a identificar y comprender el funcionamiento de los sensores ambientales. En este caso utilizando el sensor de temperatura, humedad, calidad del aire y luminosidad; así como integración física de estos componentes con herramientas para la lectura de estos datos. Esta comprensión es fundamental para seleccionar los componentes adecuados y garantizar mediciones válidas en cualquier sistema de monitoreo.

3. A través del diseño e implementación de un sistema embebido, se consiguió adquirir, procesar y visualizar datos ambientales a través de comunicación serial y también de forma gráfica. Fue necesario una estricta verificación de forma física como también lógica para obtener un correcto funcionamiento del sistema.

4. Como finalidad de este proyecto, se aplicaron conceptos fundamentales de sistemas embebidos y automatización, integrando hardware(sensores y componentes), como verificación física(conexiones, alimentación, integridad de las señales) y razonamiento lógico(programación, protocolos, procesamiento de datos) de manera coherente y colaborativa. Esto permitió fortalecer en los estudiantes las habilidades prácticas y teóricas necesarias para desarrollar soluciones tecnológicas que respondan a situaciones reales, promoviendo una vision integral del diseño de sistemas automatizados.

---

## Aportes individuales

- **José Murcia:**  
  Se encargó del uso de la fotorresistencia LDR, desarrollando código de prueba para verificar su funcionamiento tanto en simulación como en la práctica. Además, fue responsable de la obtención del Arduino utilizado en el proyecto.

- **Abner García:**  
  Fue responsable de las pruebas del buzzer, realizando investigación previa sobre el componente y ejecutando pruebas en el montaje físico. También aportó trabajo teórico relevante para el desarrollo del sistema.

- **Mario López:**  
  Se encargó de la integración y reformulación de los códigos mediante programación orientada a objetos, permitiendo el correcto funcionamiento del proyecto. Tuvo un rol clave en la investigación y adquisición de componentes, así como en el desarrollo teórico y la organización del repositorio en Git.

- **Alejandro Salazar:**  
  Fue responsable del sensor DHT11, preparando el código y la simulación correspondiente. Además, se encargó de la adquisición y recepción de los componentes, realizó aportes teóricos y lideró la mayor parte de la grabación del video del proyecto.

- **Julio Morales:**  
  Se encargó del funcionamiento de los LEDs y desarrolló casi en su totalidad el sistema en Processing, siendo una pieza clave en el aspecto teórico del proyecto junto con Mario López.

---

# Referencias bibliográficas

- Arduino. (s.f.). *Arduino Reference*. https://www.arduino.cc/reference/en/
- Arduino. (s.f.). *Serial Communication*. https://www.arduino.cc/reference/en/language/functions/communication/serial/
- Adafruit Industries. (s.f.). *DHT11 Temperature & Humidity Sensor*. https://learn.adafruit.com/dht
- SparkFun Electronics. (s.f.). *Photocell (LDR) Hookup Guide*. https://learn.sparkfun.com/tutorials/photocell-hookup-guide
- Monk, S. (2016). *Programming Arduino: Getting Started with Sketches*. McGraw-Hill Education.

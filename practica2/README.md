ESTRUCTURA QUE DEBEMOS TENER:
- CARATULA (PENDIENTE)
- INTRODUCCION (PENDIENTE)
- OBJETIVOS (PENDIENTE)
- MARCO TEORICO (LISTO)
- EXPLICACION DEL SISTEMA (PENDIENTE)
- EXPLICACION DEL PROCESSING (PENDIENTE)
- LO DEL PRESUPUESTO (PENDIENTE)
- RESULTADOS (PENDIENTE)
- CONCLUSIONES (PENDIENTE)
- APORTES INDIVIDUALES (PENDIENTE)
- REFERENCIAS BIBLIO (LISTO)

PARA EL VIDEO, ORDEN:
Presentación del grupo (por mario) y explicacion de la practica (pendiente) -> Demostracion del simulador y progra componente a componente (pendientes) -> se muestra el armado y prueba en fisico (listo) -> se repite con el resto -> Explicacion del codigo y simulador final (por mario, ya lo hizo) -> se muestra el armado de todo en fisico (pendiente) -> pruebas de los leds y luz (listo) -> muestra final usando processing (pendiente)

# Marco teórico

## 1. Sensores

- Un sensor es un dispositivo electrónico capaz de detectar una magnitud física del entorno, como temperatura, humedad o luz, y convertirla en una señal eléctrica que puede ser interpretada por un microcontrolador.
- En proyectos con Arduino, los sensores permiten obtener información del entorno en tiempo real para su análisis, visualización y control de otros dispositivos.

## 1.1 Sensor de temperatura y humedad DHT11

- El DHT11 es un sensor digital que mide temperatura y humedad relativa.
- Internamente utiliza un sensor capacitivo para la humedad y un termistor para la temperatura.
- La información se transmite mediante una señal digital por un solo pin de datos, lo que facilita su conexión.

- Características principales:
  - Rango de temperatura: 0 °C a 50 °C
  - Rango de humedad: 20 % a 90 %
  - Salida digital
  - Bajo consumo de energía
  - Uso común en proyectos educativos

## 1.2 Sensor de luz LDR

- La LDR (Light Dependent Resistor) es una resistencia dependiente de la luz cuya resistencia varía según la intensidad luminosa.
- A mayor cantidad de luz, menor resistencia; a menor luz, mayor resistencia.
- Este sensor entrega una señal analógica que puede ser leída por Arduino a través de una entrada analógica usando un divisor de voltaje.

- Aplicaciones comunes:
  - Medición de luz ambiental
  - Encendido automático de luces
  - Sistemas de monitoreo

## 1.3 Actuadores: LEDs y buzzer

- Los LEDs son dispositivos que emiten luz cuando circula corriente eléctrica a través de ellos.
- Se utilizan como indicadores visuales del estado del sistema.
- El buzzer es un actuador que genera sonido y se emplea como alerta cuando se cumple una condición específica, como una temperatura elevada o baja iluminación.

---

## 2. Comunicación serial

- La comunicación serial es un método de transmisión de datos en el que la información se envía bit a bit a través de un canal de comunicación.
- En Arduino, la comunicación serial se utiliza principalmente para intercambiar información entre la placa y una computadora.

## 2.1 Comunicación serial en Arduino

- Arduino utiliza el estándar UART (Universal Asynchronous Receiver-Transmitter).
- Permite enviar datos como lecturas de sensores hacia el monitor serial del Arduino IDE.

- Funciones principales:
  - Serial.begin(9600)
  - Serial.print()
  - Serial.println()

- La velocidad de transmisión más utilizada es 9600 baudios.

## 2.2 Importancia de la comunicación serial

- Permite visualizar datos en tiempo real.
- Facilita la depuración del programa.
- Ayuda a verificar el correcto funcionamiento de sensores y actuadores.
- Es fundamental en proyectos de monitoreo ambiental.

---

# Referencias bibliográficas

- Arduino. (s.f.). *Arduino Reference*. https://www.arduino.cc/reference/en/
- Arduino. (s.f.). *Serial Communication*. https://www.arduino.cc/reference/en/language/functions/communication/serial/
- Adafruit Industries. (s.f.). *DHT11 Temperature & Humidity Sensor*. https://learn.adafruit.com/dht
- SparkFun Electronics. (s.f.). *Photocell (LDR) Hookup Guide*. https://learn.sparkfun.com/tutorials/photocell-hookup-guide
- Monk, S. (2016). *Programming Arduino: Getting Started with Sketches*. McGraw-Hill Education.
//Inlcuimos librerias
#include <DHT.h>
#include "Led.h"
#include "Ldr.h"
#include "Buzzer.h"

// Definimos constantes
#define DHTPIN 2
#define DHTTYPE DHT11
#define BUZZER 11
#define LDR A0
#define LED_VERDE 8
#define LED_AMARILLO 9
#define LED_ROJO 10

//Creamos instancias
DHT dht(DHTPIN, DHTTYPE);

Led led_verde(LED_VERDE);
Led led_rojo(LED_ROJO);
Led led_amarillo(LED_AMARILLO);

Ldr ldr(LDR);
Buzzer buzzer(BUZZER);

// Creamos variables
float valor_luz = 0;
float valor_temperatura = 0;
float valor_humedad = 0;

// Setup
void setup() {
  Serial.begin(9600);

  dht.begin();
  led_verde.init();
  led_rojo.init();
  led_amarillo.init();
  buzzer.init();
}

// Apaga leds

void apagarLeds() {
  led_verde.off();
  led_amarillo.off();
  led_rojo.off();
}

// Envía datos a processing
void enviarDatos(float luz, float humedad, float temperatura) {
  Serial.print(temperatura);
  Serial.print(",");
  Serial.print(humedad);
  Serial.print(",");
  Serial.println(luz);
}

void cambioTemperatura() {
  apagarLeds();
  buzzer.off();

  if (valor_temperatura < 25) {
    led_verde.on();
  }
  else if (valor_temperatura > 30) {
    led_rojo.on();
    buzzer.on();
  }
  else {
    led_amarillo.on();
  }
}

// Loop
void loop() {

  valor_luz = ldr.read();
  valor_temperatura = dht.readTemperature();
  valor_humedad = dht.readHumidity();

  // Si hay error, NO enviamos nada
  if (isnan(valor_humedad) || isnan(valor_temperatura)) {
    return;
  }

  enviarDatos(valor_luz, valor_humedad, valor_temperatura);
  cambioTemperatura();

  delay(3000);
}


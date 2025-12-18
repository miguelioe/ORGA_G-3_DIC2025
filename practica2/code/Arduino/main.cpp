//Incluimos librerias
#include <DHT.h>
#include "Led.h"
#include "Ldr.h"
#include "Buzzer.h"

//Definimos constantes
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

//creamos varibles
float valor_luz;
float valor_temperatura;
float valor_humedad;

/**
 * Inicializa todo
 */
void setup(){
  dht.begin();
  led_verde.init();
  led_rojo.init();
  led_amarillo.init();
  buzzer.init();
  Serial.begin(9600);
}
/**
 * Apaga cada uno de los leds
 */
void apagarLeds(){
  led_verde.off();
  led_amarillo.off();
  led_rojo.off();
}
/**
 * Envia los datos por medio del monitor serial
 */
void guardarDatos(float luz, float humedad, float temperatura){
  Serial.print(temperatura);
  Serial.print(",");
  Serial.print(humedad);
  Serial.print(",");
  Serial.println(luz);
  
}

/**
 * Enciende y apaga los leds y el buzzer dependiendo de la temperatura
 */
void cambioTemperatura(){
  apagarLeds();
  if(valor_temperatura < 25){
    led_verde.on();
  }
  else if(valor_temperatura > 30){
    led_rojo.on();
    buzzer.on();
  }
  else{
    led_amarillo.on();
  }
}
/**
 * Método principal, lee datos, los guarda y hace los cambios de los leds
 */
void loop(){

  valor_luz = ldr.read();
  valor_temperatura = dht.readTemperature();
  valor_humedad = dht.readHumidity();

  if(isnan(valor_humedad) || isnan(valor_temperatura)){
    Serial.println("Error al momento de leer el componente");
    return;
  }

  guardarDatos(valor_luz, valor_humedad, valor_temperatura);
  cambioTemperatura();

  delay(3000);

}


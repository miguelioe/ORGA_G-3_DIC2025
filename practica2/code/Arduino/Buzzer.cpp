#include "Buzzer.h"
//Crea instrancia de buzzer y le añade un pin 
Buzzer::Buzzer(byte pin) {
  this->pin = pin;
}
//Inicializa buzzer
void Buzzer::init() {
  pinMode(pin, OUTPUT);
  digitalWrite(pin, LOW);
}
//Enciende buzzer
void Buzzer::on() {
  digitalWrite(pin, HIGH);
  tone(pin,1000,200);
}
//Apaga buzzer
void Buzzer::off() {
  digitalWrite(pin, LOW);
}

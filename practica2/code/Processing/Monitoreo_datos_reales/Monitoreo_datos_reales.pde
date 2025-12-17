import processing.serial.*;

// SERIAL
Serial puerto;

// Variables actuales
float temperatura = 0;
float humedad     = 0;
float luz         = 0;

// Historico
int CANTIDAD_BARRAS = 20;
float[] barrasTemp = new float[CANTIDAD_BARRAS];
float[] barrasHum  = new float[CANTIDAD_BARRAS];
float[] barrasLuz  = new float[CANTIDAD_BARRAS];

// Colores
color fondoColor      = color(18, 18, 22);
color tarjetaColor    = color(30, 30, 38);
color grillaColor     = color(70);
color textoColor      = color(200);

color tempColor       = color(255, 95, 95);
color humColor        = color(90, 170, 255);
color luzColor        = color(255, 210, 120);

// ==========================================
// SETUP
// ==========================================
void setup() {
  fullScreen();
  smooth(8);
  frameRate(60);

  // Historico
  for (int i = 0; i < CANTIDAD_BARRAS; i++) {
    barrasTemp[i] = 0;
    barrasHum[i]  = 0;
    barrasLuz[i]  = 0;
  }

  // Serial
  puerto = new Serial(this, "COM5", 9600);
  puerto.bufferUntil('\n');
}

// ==========================================
// DRAW
// ==========================================
void draw() {
  background(fondoColor);

  dibujarEncabezado();
  dibujarGraficas();
  dibujarGauges();
  dibujarAlerta();
}

// ==========================================
// Evento Serial
// ==========================================
void serialEvent(Serial p) {

  String linea = trim(p.readStringUntil('\n'));
  if (linea == null) return;

  String[] valores = split(linea, ',');
  if (valores.length != 3) return;

  try {
    temperatura = float(valores[0]);
    humedad     = float(valores[1]);
    luz         = float(valores[2]);

    desplazar(barrasTemp, temperatura);
    desplazar(barrasHum, humedad);
    desplazar(barrasLuz, luz);

  } catch (Exception e) {
    println("Error leyendo datos");
  }
}

// ==========================================
// Historico
// ==========================================
void desplazar(float[] arreglo, float valor) {
  for (int i = 0; i < arreglo.length - 1; i++) {
    arreglo[i] = arreglo[i + 1];
  }
  arreglo[arreglo.length - 1] = valor;
}

// ==========================================
// Encabezado
// ==========================================
void dibujarEncabezado() {
  fill(tarjetaColor);
  noStroke();
  rect(0, 0, width, 80);

  fill(textoColor);
  textSize(30);
  textAlign(LEFT, CENTER);
  text("Monitoreo Ambiental", 25, 40);
}

// ==========================================
// Graficas
// ==========================================
void dibujarGraficas() {
  int x = 30;
  int y = 120;
  int w = 540;
  int h = 200;

  dibujarGrafica("Temperatura (°C)", barrasTemp, 0, 50, x, y, w, h, tempColor);
  dibujarGrafica("Humedad (%)", barrasHum, 0, 100, x, y + 240, w, h, humColor);
  dibujarGrafica("Nivel de Luz (%)", barrasLuz, 0, 100, x, y + 480, w, h, luzColor);
}

void dibujarGrafica(String titulo, float[] datos,
                    float min, float max,
                    int x, int y, int w, int h, color c) {

  fill(tarjetaColor);
  noStroke();
  rect(x, y, w, h, 18);

  fill(textoColor);
  textSize(16);
  textAlign(LEFT, TOP);
  text(titulo, x + 15, y + 12);

  float px = x + 55;
  float py = y + 45;
  float pw = w - 80;
  float ph = h - 70;

  stroke(grillaColor);
  fill(160);
  textSize(11);
  textAlign(RIGHT, CENTER);

  for (int i = 0; i <= 5; i++) {
    float v = lerp(min, max, i / 5.0);
    float yy = map(v, min, max, py + ph, py);
    line(px, yy, px + pw, yy);
    text(int(v), px - 8, yy);
  }

  float anchoBarra = pw / datos.length;

  for (int i = 0; i < datos.length; i++) {
    float alto = map(datos[i], min, max, 0, ph);
    alto = constrain(alto, 0, ph);

    fill(c);
    rect(px + i * anchoBarra, py + ph - alto, anchoBarra - 4, alto, 6);
  }

  fill(c);
  textAlign(RIGHT, BOTTOM);
  text(nf(datos[datos.length - 1], 1, 1),
       x + w - 15, y + h - 10);
}

// ==========================================
// Gauges
// ==========================================
void dibujarGauges() {
  dibujarGauge("Temperatura", temperatura, 50, width - 320, 240, tempColor, "°C");
  dibujarGauge("Humedad", humedad, 100, width - 320, 470, humColor, "%");
  dibujarGauge("Luz", luz, 100, width - 320, 700, luzColor, "%");
}

void dibujarGauge(String etiqueta, float valor, float max,
                  int cx, int cy, color c, String unidad) {

  float r = 90;

  fill(tarjetaColor);
  noStroke();
  ellipse(cx, cy, r * 2 + 30, r * 2 + 30);

  stroke(70);
  strokeWeight(16);
  noFill();
  arc(cx, cy, r * 2, r * 2, PI, TWO_PI);

  float angulo = map(valor, 0, max, PI, TWO_PI);

  stroke(c);
  arc(cx, cy, r * 2, r * 2, PI, angulo);

  stroke(255);
  strokeWeight(4);
  line(cx, cy,
       cx + cos(angulo) * r * 0.7,
       cy + sin(angulo) * r * 0.7);

  fill(255);
  noStroke();
  ellipse(cx, cy, 10, 10);

  fill(textoColor);
  textAlign(CENTER);
  textSize(22);
  text(nf(valor, 1, 1) + " " + unidad, cx, cy + 30);

  fill(160);
  textSize(14);
  text(etiqueta, cx, cy + r + 28);
}

// ==========================================
// Alerta
// ==========================================
void dibujarAlerta() {
  if (temperatura > 30) {

    int x = 620;
    int y = height / 2 - 60;
    int w = 380;
    int h = 60;

    if ((millis() / 300) % 2 == 0) {
      fill(255, 80, 80);
      noStroke();
      rect(x, y, w, h, 28);

      fill(255);
      textAlign(CENTER, CENTER);
      textSize(18);
      text("ALERTA: TEMPERATURA ALTA",
           x + w / 2,
           y + h / 2);
    }
  }
}


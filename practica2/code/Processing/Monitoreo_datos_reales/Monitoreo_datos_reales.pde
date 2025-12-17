import processing.serial.*;

// DASHBOARD AMBIENTAL – DATOS DESDE ARDUINO

// SERIAL
Serial puerto;

//Variables
float temp = 0;
float hum  = 0;
float luz  = 0;


// Históricos

int BAR_COUNT = 20;
float[] tempBars = new float[BAR_COUNT];
float[] humBars  = new float[BAR_COUNT];
float[] luzBars  = new float[BAR_COUNT];

// Colores
color bgColor    = color(18, 18, 22);
color cardColor  = color(30, 30, 38);
color gridColor  = color(70);
color textColor  = color(200);

color tempColor  = color(255, 95, 95);
color humColor   = color(90, 170, 255);
color lightColor = color(255, 210, 120);

// SETUP
void setup() {
  fullScreen();
  smooth(8);
  frameRate(60);

  // Inicializar históricos en 0
  for (int i = 0; i < BAR_COUNT; i++) {
    tempBars[i] = 0;
    humBars[i]  = 0;
    luzBars[i]  = 0;
  }

  // ---- SERIAL ----
  println(Serial.list());            // Ver puertos disponibles
  puerto = new Serial(this, Serial.list()[0], 9600);
  puerto.bufferUntil('\n');
}

// ==========================================
// DRAW
// ==========================================
void draw() {
  background(bgColor);

  drawHeader();
  drawBarCharts();
  drawGauges();
  drawAlert();
}

// Evento Serial (Recibiendo datos del arduino)
void serialEvent(Serial p) {

  String linea = trim(p.readStringUntil('\n'));
  if (linea == null) return;

  String[] valores = split(linea, ',');
  if (valores.length != 3) return;

  try {
    temp = float(valores[0]);
    hum  = float(valores[1]);
    luz  = float(valores[2]);

    shift(tempBars, temp);
    shift(humBars, hum);
    shift(luzBars, luz);

  } catch (Exception e) {
    println("Error leyendo datos seriales");
  }
}

// DESPLAZAR HISTÓRICO

void shift(float[] arr, float val) {
  for (int i = 0; i < arr.length - 1; i++) {
    arr[i] = arr[i + 1];
  }
  arr[arr.length - 1] = val;
}

// Encabezado
void drawHeader() {
  fill(cardColor);
  noStroke();
  rect(0, 0, width, 80);

  fill(textColor);
  textSize(30);
  textAlign(LEFT, CENTER);
  text("Monitoreo Ambiental", 25, 40);
}
// GRÁFICAS DE BARRAS

void drawBarCharts() {
  int x = 30;
  int y = 120;
  int w = 540;
  int h = 200;

  drawBarChart("Temperatura (°C)", tempBars, 0, 50, x, y, w, h, tempColor);
  drawBarChart("Humedad (%)", humBars, 0, 100, x, y + 240, w, h, humColor);
  drawBarChart("Nivel de Luz (%)", luzBars, 0, 100, x, y + 480, w, h, lightColor);
}

void drawBarChart(String title, float[] data,
                  float minVal, float maxVal,
                  int x, int y, int w, int h, color c) {

  fill(cardColor);
  noStroke();
  rect(x, y, w, h, 18);

  fill(textColor);
  textSize(16);
  textAlign(LEFT, TOP);
  text(title, x + 15, y + 12);

  float px = x + 55;
  float py = y + 45;
  float pw = w - 80;
  float ph = h - 70;

  stroke(gridColor);
  fill(160);
  textSize(11);
  textAlign(RIGHT, CENTER);

  for (int i = 0; i <= 5; i++) {
    float v = lerp(minVal, maxVal, i / 5.0);
    float yy = map(v, minVal, maxVal, py + ph, py);
    line(px, yy, px + pw, yy);
    text(int(v), px - 8, yy);
  }

  float barW = pw / data.length;

  for (int i = 0; i < data.length; i++) {
    float bh = map(data[i], minVal, maxVal, 0, ph);
    bh = constrain(bh, 0, ph);

    fill(c);
    rect(px + i * barW, py + ph - bh, barW - 4, bh, 6);
  }

  fill(c);
  textAlign(RIGHT, BOTTOM);
  text(nf(data[data.length - 1], 1, 1),
       x + w - 15, y + h - 10);
}

// ==========================================
// GAUGES
// ==========================================
void drawGauges() {
  drawGauge("Temperatura", temp, 50, width - 320, 240, tempColor, "°C");
  drawGauge("Humedad", hum, 100, width - 320, 470, humColor, "%");
  drawGauge("Luz", luz, 100, width - 320, 700, lightColor, "%");
}

void drawGauge(String label, float val, float maxVal,
               int cx, int cy, color c, String unit) {

  float r = 90;

  fill(cardColor);
  noStroke();
  ellipse(cx, cy, r * 2 + 30, r * 2 + 30);

  stroke(70);
  strokeWeight(16);
  noFill();
  arc(cx, cy, r * 2, r * 2, PI, TWO_PI);

  float angle = map(val, 0, maxVal, PI, TWO_PI);

  stroke(c);
  arc(cx, cy, r * 2, r * 2, PI, angle);

  stroke(255);
  strokeWeight(4);
  line(cx, cy,
       cx + cos(angle) * r * 0.7,
       cy + sin(angle) * r * 0.7);

  fill(255);
  noStroke();
  ellipse(cx, cy, 10, 10);

  fill(textColor);
  textAlign(CENTER);
  textSize(22);
  text(nf(val, 1, 1) + " " + unit, cx, cy + 30);

  fill(160);
  textSize(14);
  text(label, cx, cy + r + 28);
}

// ALERTA

void drawAlert() {
  if (temp > 30) {

    int alertX = 620;
    int alertY = height / 2 - 60;
    int alertW = 380;
    int alertH = 60;

    if ((millis() / 300) % 2 == 0) {
      fill(255, 80, 80);
      noStroke();
      rect(alertX, alertY, alertW, alertH, 28);

      fill(255);
      textAlign(CENTER, CENTER);
      textSize(18);
      text("ALERTA: TEMPERATURA ALTA",
           alertX + alertW / 2,
           alertY + alertH / 2);
    }
  }
}

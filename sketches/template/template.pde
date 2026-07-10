/**
 * template — Processing (Java) sketch starter
 *
 * Run: open this folder in the Processing IDE (File → Open), then ▶
 * Canvas + mouse/keyboard controls + simple particle field.
 * Pair: p5js/template
 */

ArrayList<Particle> particles;
boolean paused = false;
boolean showHex = true;

void setup() {
  size(900, 600);
  pixelDensity(displayDensity());
  smooth(4);
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 80; i++) {
    particles.add(new Particle(random(width), random(height)));
  }
}

void draw() {
  background(12, 14, 22);

  if (!paused) {
    for (Particle p : particles) {
      p.update();
    }
  }

  // soft connections
  stroke(90, 140, 200, 40);
  strokeWeight(1);
  for (int i = 0; i < particles.size(); i++) {
    Particle a = particles.get(i);
    for (int j = i + 1; j < particles.size(); j++) {
      Particle b = particles.get(j);
      float d = dist(a.x, a.y, b.x, b.y);
      if (d < 90) {
        line(a.x, a.y, b.x, b.y);
      }
    }
  }

  noStroke();
  for (Particle p : particles) {
    p.display();
  }

  if (showHex) {
    drawHexHint(mouseX, mouseY, 28);
  }

  // HUD
  fill(200, 210, 230, 180);
  textSize(12);
  text("space pause  ·  h hex  ·  r reset  ·  click spawn", 12, height - 14);
}

void mousePressed() {
  particles.add(new Particle(mouseX, mouseY));
}

void keyPressed() {
  if (key == ' ') paused = !paused;
  if (key == 'h' || key == 'H') showHex = !showHex;
  if (key == 'r' || key == 'R') {
    particles.clear();
    for (int i = 0; i < 80; i++) {
      particles.add(new Particle(random(width), random(height)));
    }
  }
}

void drawHexHint(float cx, float cy, float r) {
  noFill();
  stroke(120, 200, 180, 90);
  strokeWeight(1.5);
  beginShape();
  for (int i = 0; i < 6; i++) {
    float a = TWO_PI * i / 6.0 - HALF_PI;
    vertex(cx + cos(a) * r, cy + sin(a) * r);
  }
  endShape(CLOSE);
}

class Particle {
  float x, y;
  float vx, vy;
  float r;
  color c;

  Particle(float x, float y) {
    this.x = x;
    this.y = y;
    vx = random(-0.6, 0.6);
    vy = random(-0.6, 0.6);
    r = random(2, 5);
    c = color(140 + random(80), 180 + random(50), 220 + random(35), 200);
  }

  void update() {
    // gentle pull toward mouse
    float dx = mouseX - x;
    float dy = mouseY - y;
    float d = max(40, dist(mouseX, mouseY, x, y));
    vx += dx / d * 0.02;
    vy += dy / d * 0.02;
    vx *= 0.98;
    vy *= 0.98;
    x += vx;
    y += vy;

    // soft wrap
    if (x < -10) x = width + 10;
    if (x > width + 10) x = -10;
    if (y < -10) y = height + 10;
    if (y > height + 10) y = -10;
  }

  void display() {
    fill(c);
    ellipse(x, y, r * 2, r * 2);
  }
}

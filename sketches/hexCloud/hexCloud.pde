/**
 * hexCloud — generative hex lattice + drifting points
 *
 * Vibe: soft cloud of hex cells, points breathe along the lattice,
 * mouse warps the field. Inspired by old generative points / hex cloud work.
 * Pair: p5js/hexCloud
 *
 * Controls:
 *   space  — pause
 *   h      — toggle hex wireframe
 *   p      — toggle points
 *   r      — reseed
 *   [ ]    — fewer / more hex rings
 *   mouse  — gravity / warp center
 *
 * Naming: Processing needs Java identifiers (no hyphens). Use hexCloud not hex-cloud.
 */

int rings = 7;
float hexSize = 22;
boolean paused = false;
boolean showHex = true;
boolean showPoints = true;
float t = 0;

ArrayList<PVector> cells;
ArrayList<DriftPoint> points;

void setup() {
  size(1000, 700);
  pixelDensity(displayDensity());
  smooth(8);
  colorMode(HSB, 360, 100, 100, 100);
  rebuild();
}

void rebuild() {
  cells = axialDisk(rings);
  points = new ArrayList<DriftPoint>();
  for (int i = 0; i < cells.size(); i++) {
    if (random(1) < 0.55) {
      points.add(new DriftPoint(cells.get(i).copy(), random(TWO_PI)));
    }
  }
}

void draw() {
  background(230, 18, 8);

  // vignette-ish wash
  noStroke();
  for (int i = 6; i >= 0; i--) {
    fill(230, 12, 10 + i * 1.2, 18);
    ellipse(width * 0.5, height * 0.5, width * 0.25 * i, height * 0.25 * i);
  }

  pushMatrix();
  translate(width * 0.5, height * 0.52);

  float breath = 1.0 + 0.035 * sin(t * 0.7);
  float mx = mouseX - width * 0.5;
  float my = mouseY - height * 0.52;

  if (showHex) {
    for (PVector c : cells) {
      PVector p = axialToPixel(c.x, c.y, hexSize * breath);
      float d = dist(p.x, p.y, mx, my);
      float warp = map(constrain(d, 0, 220), 0, 220, 1.15, 0.92);
      float a = map(constrain(d, 0, 280), 0, 280, 55, 12);
      float hue = (200 + c.x * 8 + c.y * 5 + t * 12) % 360;

      stroke(hue, 35, 85, a);
      strokeWeight(1.1);
      noFill();
      drawHex(p.x * warp, p.y * warp, hexSize * breath * 0.92);
    }
  }

  if (showPoints && !paused) {
    for (DriftPoint dp : points) {
      dp.update(t, mx, my, breath);
    }
  }

  if (showPoints) {
    // trails / links between nearby points
    strokeWeight(1);
    for (int i = 0; i < points.size(); i++) {
      DriftPoint a = points.get(i);
      for (int j = i + 1; j < points.size(); j++) {
        DriftPoint b = points.get(j);
        float d = dist(a.px, a.py, b.px, b.py);
        if (d < hexSize * 2.4) {
          float alpha = map(d, 0, hexSize * 2.4, 40, 0);
          stroke(190, 30, 90, alpha);
          line(a.px, a.py, b.px, b.py);
        }
      }
    }

    noStroke();
    for (DriftPoint dp : points) {
      dp.display();
    }
  }

  popMatrix();

  if (!paused) t += 0.016;

  // HUD
  fill(200, 10, 90, 70);
  textSize(12);
  textAlign(LEFT, BOTTOM);
  text("hexCloud  ·  space pause  h hex  p points  r reseed  [ ] rings (" + rings + ")", 14, height - 12);
}

void keyPressed() {
  if (key == ' ') paused = !paused;
  if (key == 'h' || key == 'H') showHex = !showHex;
  if (key == 'p' || key == 'P') showPoints = !showPoints;
  if (key == 'r' || key == 'R') {
    t = 0;
    rebuild();
  }
  if (key == '[') {
    rings = max(2, rings - 1);
    rebuild();
  }
  if (key == ']') {
    rings = min(14, rings + 1);
    rebuild();
  }
}

// --- hex math (axial coords) ---

ArrayList<PVector> axialDisk(int n) {
  ArrayList<PVector> out = new ArrayList<PVector>();
  for (int q = -n; q <= n; q++) {
    int r1 = max(-n, -q - n);
    int r2 = min(n, -q + n);
    for (int r = r1; r <= r2; r++) {
      out.add(new PVector(q, r));
    }
  }
  return out;
}

PVector axialToPixel(float q, float r, float size) {
  float x = size * (sqrt(3) * q + sqrt(3) / 2.0 * r);
  float y = size * (3.0 / 2.0 * r);
  return new PVector(x, y);
}

void drawHex(float cx, float cy, float size) {
  beginShape();
  for (int i = 0; i < 6; i++) {
    float a = TWO_PI * i / 6.0 + PI / 6.0; // pointy-top-ish flat edges
    vertex(cx + cos(a) * size, cy + sin(a) * size);
  }
  endShape(CLOSE);
}

class DriftPoint {
  PVector cell; // axial home
  float phase;
  float px, py;
  float hue;

  DriftPoint(PVector cell, float phase) {
    this.cell = cell;
    this.phase = phase;
    this.hue = (190 + cell.x * 10 + cell.y * 7 + random(30)) % 360;
  }

  void update(float time, float mx, float my, float breath) {
    PVector home = axialToPixel(cell.x, cell.y, hexSize * breath);
    float wobble = 4.5 * sin(time * 1.3 + phase) + 2.0 * cos(time * 0.9 + phase * 1.7);
    float ang = phase + time * 0.4;
    float ox = cos(ang) * wobble;
    float oy = sin(ang * 1.1) * wobble;

    px = home.x + ox;
    py = home.y + oy;

    // mouse warp
    float d = dist(px, py, mx, my);
    float influence = exp(-d * d / (2 * 140 * 140));
    px += (mx - px) * influence * 0.18;
    py += (my - py) * influence * 0.18;
  }

  void display() {
    float pulse = 2.2 + 1.4 * sin(t * 2.0 + phase);
    fill(hue, 45, 95, 85);
    ellipse(px, py, pulse * 2, pulse * 2);
    fill(hue, 20, 100, 35);
    ellipse(px, py, pulse * 4.5, pulse * 4.5);
  }
}

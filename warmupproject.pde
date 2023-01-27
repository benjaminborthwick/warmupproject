void setup() {
  size(600, 600);
  fill(0);
}
float k;
float s;
void draw() {
  background(255);
  s = -(mouseX - 300);
  k = 6 / (6 - (float) mouseY/100);
  rect(200, 200, 200, 200);
  satelliteRects(300, 300, 200 / k, 1);
}

void satelliteRects(float centerX, float centerY, float size, int layer) {
  if (layer > 5) return;
  float t = (size * k + size) / 2;
  fill(128 * (layer % 2 == 1 ? 0 : 1) + (60 * (centerX + s - size/2)/10 + (centerY + t - size/2)/10) * 128/3600);
  rect(centerX + s - size/2, centerY + t - size/2, size, size);
  fill(128 * (layer % 2 == 1 ? 0 : 1) + (60 * (centerX - s - size/2)/10 + (centerY - t - size/2)/10) * 128/3600);
  rect(centerX - s - size/2, centerY - t - size/2, size, size);
  fill(128 * (layer % 2 == 1 ? 0 : 1) + (60 * (centerX + t - size/2)/10 + (centerY - s - size/2)/10) * 128/3600);
  rect(centerX + t - size/2, centerY - s - size/2, size, size);
  fill(128 * (layer % 2 == 1 ? 0 : 1) + (60 * (centerX - t - size/2)/10 + (centerY + s - size/2)/10) * 128/3600);
  rect(centerX - t - size/2, centerY + s - size/2, size, size);
  satelliteRects(centerX + s, centerY + t, size / k, layer + 1);
  satelliteRects(centerX - t, centerY + s, size / k, layer + 1);
  satelliteRects(centerX - s, centerY - t, size / k, layer + 1);
  satelliteRects(centerX + t, centerY - s, size / k, layer + 1);
}

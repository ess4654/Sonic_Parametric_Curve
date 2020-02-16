import ddf.minim.*;

Minim minim;
AudioPlayer player;

float DefaultScale = 0.40;
float FR = 28;
float SampleRate = 10;

boolean running = true;
boolean DEBUGGING = false;
boolean SoundOn = true;

float t = 0;
float scale = DefaultScale;
color transparent = color(0, 0, 0, 0);
color blue = color(33, 73, 201);
color green = color(52, 147, 69);
color black = color(51, 51, 51);
color tan = color(219, 175, 114);
color red = color(178, 1, 10);
color gold = color(211, 184, 41);
color white = color(255, 255, 255);
ArrayList<PVector> points = new ArrayList<PVector>();
ArrayList<Integer> lineColor = new ArrayList<Integer>();
ArrayList<Integer> strokes = new ArrayList<Integer>();

void setup()
{
  fullScreen(P2D);
  //size(800, 800, P2D);
  background(0);
  noFill();
  smooth();
  frameRate(FR);
  
  minim = new Minim(this);
  player = minim.loadFile("Sonic Theme.mp3");
  if(SoundOn)
    player.loop();
}

void keyPressed() {
  if(key == ' ')
    running = !running;
  if(key == 'r')
    reset();
}

void reset()
{
  frameCount = -1;
  t = 0;
  lineColor.clear();
  strokes.clear();
  points.clear();
  minim.stop();
  minim = new Minim(this);
  if(SoundOn)
    player.loop();
  scale = DefaultScale;
}

float updateT(float T)
{
  T += 0.008;
  
  if(T >= 317.380) { //END
    strokes.add(1);
    lineColor.add(white);
    return 104 * PI;
  }
  if(T >= 314.166 && T < 317.380) { //RIGHT EAR
    strokes.add(3);
    lineColor.add(blue);
    return T;
  }
  if(T >= 304.772 && T < 314.166) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 314.166;
  }
  if(T >= 301.598 && T < 304.772) { //LEFT EAR
    strokes.add(4);
    lineColor.add(blue);
    return T;
  }
  if(T >= 292.084 && T < 301.598) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 301.598;
  }
  if(T >= 289.0308 && T < 292.084) { //RIGHT HAND
    strokes.add(3);
    lineColor.add(white);
    return T;
  }
  if(T >= 279.668 && T < 289.030) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 289.030;
  }
  if(T >= 276.470 && T < 279.668) { //HEAD
    strokes.add(3);
    lineColor.add(tan);
    
    if(T >= 278.38 && T < 278.7)
      T = 278.7;
    
    return T;
  }
  if(T >= 267.188 && T < 276.470) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 276.470;
  }
  if(T >= 263.902 && T < 267.188) { //???
    strokes.add(2);
    lineColor.add(blue);
    return T;
  }
  if(T >= 254.468 && T < 263.902) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 263.902;
  }
  if(T >= 251.342 && T < 254.468) { //BODY
    strokes.add(3);
    lineColor.add(blue);
    return T;
  }
  if(T >= 241.892 && T < 251.342) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 251.342;
  }
  if(T >= 238.766 && T < 241.892) { //LEG
    strokes.add(3);
    lineColor.add(blue);
    return T;
  }
  if(T >= 229.412 && T < 238.766) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 238.766;
  }
  if(T >= 226.206 && T < 229.412) { //RIGHT GLOVE
    strokes.add(2);
    lineColor.add(white);
    return T;
  }
  if(T >= 216.884 && T < 226.206) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 226.206;
  }
  if(T >= 213.789 && T < 216.884) { //LEGS
    strokes.add(3);
    lineColor.add(blue);
    return T;
  }
  if(T >= 204.316 && T < 213.789) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 213.789;
  }
  if(T >= 201.070 && T < 204.316) { //LEFT GLOVE
    strokes.add(3);
    lineColor.add(white);
    return T;
  }
  if(T >= 191.748 && T < 201.070) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 201.070;
  }
  if(T >= 188.718 && T < 191.748) { //FACE LINE
    strokes.add(3);
    lineColor.add(tan);    
    return T;
  }
  if(T >= 182.268 && T < 188.718) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 188.718;
  }
  if(T >= 176.012 && T < 182.268) { //RIGHT EYE
    strokes.add(2);
    lineColor.add(green);
    return T + 0.012;
  }
  if(T >= 169.711 && T < 176.012) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 176.012;
  }
  if(T >= 163.371 && T < 169.711) { //LEFT EYE
    strokes.add(2);
    lineColor.add(green);
    return T;
  }
  if(T >= 157.031 && T < 163.371) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 163.371;
  }
  if(T >= 150.803 && T < 157.031) { //LEFT EAR
    strokes.add(3);
    lineColor.add(tan);
    return T;
  }
  if(T >= 144.455 && T < 150.803) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 150.803;
  }
  if(T >= 138.235 && T < 144.455) { //LEFT EYE
    strokes.add(3);
    lineColor.add(white);
    return T + 0.008;
  }
  if(T >= 132.055 && T < 138.235) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 138.235;
  }
  if(T >= 125.665 && T < 132.055) { //NOSE
    strokes.add(3);
    lineColor.add(black);
    return T;
  }
  if(T >= 119.182 && T < 125.665) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 125.665;
  }
  if(T >= 113.156 && T < 119.182) { //MOUTH
    strokes.add(2);
    lineColor.add(tan);
    return T;
  }
  if(T >= 106.809 && T < 113.156) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 113.156;
  }
  if(T >= 100.543 && T < 106.809) { //LEFT HAND 
    strokes.add(3);
    lineColor.add(white);
    return T;
  }
  if(T >= 94.229 && T < 100.543) { //SKIP 
    strokes.add(3);
    lineColor.add(white);
    return 100.543;
  }
  if(T >= 87.971 && T < 94.229) { //CHEST
    strokes.add(3);
    lineColor.add(tan);
    return T;
  }
  if(T >= 81.686 && T < 87.971) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 87.971;
  }
  if(T >= 75.404 && T < 81.686) { //LEFT ARM
    strokes.add(3);
    lineColor.add(tan);
    return T;
  }
  if(T >= 69.105 && T < 75.404) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 75.404;
  }
  if(T >= 62.832 && T < 69.105) { //RIGHT ARM
    strokes.add(3);
    lineColor.add(tan);
    return T;
  }
  if(T >= 56.261 && T < 62.832) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 62.832;
  }
  if(T >= 50.266 && T < 56.261) { //RIGHT SHOE
    strokes.add(3);
    
    if(T < 52.689)
      lineColor.add(white);
    else
      lineColor.add(red);
      
    if(T > 54.379 && T < 54.656)
      T = 54.656;
      
    return T;
  }
  if(T >= 43.979 && T < 50.266) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 50.266;
  }
  if(T >= 37.700 && T < 43.979) { //LEFT SHOE
    strokes.add(3);
    
    if(T < 39.143)
      lineColor.add(white);
    else if(T < 41.019)
      lineColor.add(red);
    else if(T < 41.203)
      lineColor.add(white);
    else if(T < 42.032)
      lineColor.add(gold);
    else if(T < 43.603)
      lineColor.add(red);
    else
      lineColor.add(white);
      
    return T;
  }
  if(T >= 31.413 && T < 37.700) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 37.700;
  }
  if(T >= 25.142 && T < 31.413) { //RIGHT SOCK
    strokes.add(2);
    lineColor.add(white);
    
    if(T > 27.94 && T < 28.33)
      T = 28.33;
    
    return T;
  }
  if(T >= 18.839 && T < 25.142) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 25.142;
  }
  if(T >= 12.568 && T < 18.839) { //LEFT SOCK
    strokes.add(2);
    lineColor.add(white);
    
    if(T > 15.47 && T < 15.93)
      T = 15.93;
    
    return T;
  }
  if(T >= 6.319 && T < 12.568) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 12.568;
  }
  else { //HAIR
    strokes.add(4);
    lineColor.add(blue);
    
    if(T >= 1.48 && T < 1.78)
      T = 1.78;
    if(T >= 4.27 && T < 4.35)
      T = 4.35;
    
  }
  
  return T;
}

void draw()
{ 
  //if(frameCount < (FR/2)) return;
  if(t <= 104 * PI && running)
  {
    for(int z = 0; z<SampleRate; z++) {
      t = updateT(t);
      points.add(new PVector(x(t), -y(t)));
      if(DEBUGGING)
        print(t + "\n");
    }
  } else {
    if(!DEBUGGING)
      scale += 0.00053333;
  }
  
  translate(width/2, height/2 - 30);
  background(0);
  
  beginShape();
  for(int i = 0; i < points.size(); i++)
  {
    if(points.get(i).x == 0 && points.get(i).y == 0) continue;
    strokeWeight(strokes.get(i));
    stroke(lineColor.get(i));
    point(points.get(i).x * scale, points.get(i).y * scale);
  }
  endShape();
}

float sgn(float x)
{
  if(x == 0) return 0;
  else if(x > 0) return 1;
  else return -1;
}

float theta(float x)
{
  if(x == 0) return 0.5;
  else if(x > 0) return 1;
  else return 0;
}

float SIN(float x)
{
  return sin(x);
}

float x(float t)
{
  return ((-16.0/5*sin(11.0/7 - 4*t) - 76.0/25*sin(11.0/7 - 2*t) + 295.0/4*sin(t + 11.0/7) + 63.0/8*sin(3*t + 11.0/7) + 13.0/5*sin(5*t + 11.0/7) + 13.0/9*sin(6*t + 33.0/7) + 1.0/4*sin(7*t + 14.0/9) + 22.0/23*sin(8*t + 33.0/7) + 7.0/9*sin(9*t + 11.0/7) + 1.0/9*sin(10*t + 5.0/3) + 1093.0/9)*theta(103*PI -t)*theta(t - 99*PI) + (517.0/9*sin(t + 11.0/7) + 865.0/18*sin(2*t + 11.0/7) + 20.0/3*sin(3*t + 11.0/7) + 11.0/9*sin(4*t + 8.0/5) + 23.0/8*sin(5*t + 8.0/5) + 32.0/5*sin(6*t + 8.0/5) + 2.0/3*sin(7*t + 8.0/5) + 1.0/21*sin(8*t + 9.0/2) - 1952.0/9)*theta(99*PI -t)*theta(t - 95*PI) + (-139.0/8*sin(11.0/7 - 6*t) - 367.0/6*sin(11.0/7 -t) + 76.0/9*sin(2*t + 33.0/7) + 427.0/10*sin(3*t + 11.0/7) + 83.0/8*sin(4*t + 8.0/5) + 65.0/11*sin(5*t + 8.0/5) + 139.0/9*sin(7*t + 11.0/7) + 14.0/5*sin(8*t + 33.0/7) + 24.0/7*sin(9*t + 8.0/5) + 1.0/6*sin(10*t + 4) + 1914.0/7)*theta(95*PI -t)*theta(t - 91*PI) + (-37.0/4*sin(11.0/7 - 4*t) - 11.0/4*sin(16.0/11 - 3*t) - 182.0/3*sin(11.0/7 - 2*t) - 466.0/3*sin(11.0/7 -t) + 7.0/5*sin(5*t + 14.0/3) + 26.0/7*sin(6*t + 33.0/7) + 684.0/5)*theta(91*PI -t)*theta(t - 87*PI) + (-67.0/9*sin(14.0/9 - 11*t) - 8.0/7*sin(14.0/9 - 10*t) - 31.0/4*sin(11.0/7 - 9*t) - 32.0/7*sin(11.0/7 - 3*t) - 72.0/7*sin(11.0/7 - 2*t) + 462.0/5*sin(t + 11.0/7) + 131.0/12*sin(4*t + 11.0/7) + 109.0/7*sin(5*t + 8.0/5) + 16.0/3*sin(6*t + 8.0/5) + 6.0/7*sin(7*t + 8.0/5) + 22.0/3*sin(8*t + 8.0/5) + 7.0/4*sin(12*t + 11.0/7) + 5.0/6*sin(13*t + 12.0/7) + 21.0/8*sin(14*t + 8.0/5) - 326.0/7)*theta(87*PI -t)*theta(t - 83*PI) + (501.0/8*sin(t + 33.0/7) + 122.0/3*sin(2*t + 33.0/7) + 155.0/6*sin(3*t + 11.0/7) + 49.0/4*sin(4*t + 11.0/7) + 31.0/4*sin(5*t + 11.0/7) + 17.0/5*sin(6*t + 11.0/7) + 14.0/5)*theta(83*PI -t)*theta(t - 79*PI) + (-100.0/11*sin(11.0/7 - 3*t) - 3.0/7*sin(3.0/2 - 2*t) - 104.0/5*sin(11.0/7 -t) + 3.0/5*sin(4*t + 14.0/9) + 367.0/2)*theta(79*PI -t)*theta(t - 75*PI) + (-52.0/5*sin(11.0/7 - 4*t) - 652.0/21*sin(11.0/7 - 2*t) - 1.0/6*sin(3.0/5 -t) + 13*sin(3*t + 11.0/7) + 29.0/4*sin(5*t + 8.0/5) + 37.0/4*sin(6*t + 8.0/5) + 87.0/10*sin(7*t + 8.0/5) + 4.0/9*sin(8*t + 5.0/3) + 9.0/7*sin(9*t + 8.0/5) + 1.0/12*sin(10*t + 8.0/3) + 3103.0/11)*theta(75*PI -t)*theta(t - 71*PI) + (-13.0/5*sin(14.0/9 - 6*t) - 251.0/7*sin(11.0/7 - 2*t) + 373.0/7*sin(t + 11.0/7) + 224.0/15*sin(3*t + 11.0/7) + 35.0/6*sin(4*t + 8.0/5) + 27.0/4*sin(5*t + 11.0/7) + 32.0/7*sin(7*t + 11.0/7) + 60.0/11*sin(8*t + 8.0/5) + 7.0/2*sin(9*t + 11.0/7) + 17.0/7*sin(10*t + 11.0/7) + 398.0/5)*theta(71*PI -t)*theta(t - 67*PI) + (-13.0/6*sin(11.0/7 - 8*t) - 4.0/3*sin(11.0/7 - 6*t) - 452.0/9*sin(11.0/7 -t) + 37.0/5*sin(2*t + 11.0/7) + 193.0/7*sin(3*t + 11.0/7) + 44.0/5*sin(4*t + 11.0/7) + 53.0/6*sin(5*t + 11.0/7) + 2.0/5*sin(7*t + 11.0/7) + 11.0/8*sin(9*t + 11.0/7) + 2.0/5*sin(10*t + 14.0/9) - 164.0/3)*theta(67*PI -t)*theta(t - 63*PI) + (-13.0/10*sin(7.0/5 - 2*t) + 572.0/5*sin(t + 11.0/7) + 67.0/5*sin(3*t + 11.0/7) + 10.0/9*sin(4*t + 3.0/2) + 14.0/3*sin(5*t + 11.0/7) + 661.0/8)*theta(63*PI -t)*theta(t - 59*PI) + (-3.0/7*sin(1.0/13 - 8*t) - 3.0/7*sin(1.0/7 - 6*t) - 17.0/7*sin(1.0/9 - 2*t) + 45.0/11*sin(t + 12.0/5) + 13.0/10*sin(3*t + 13.0/4) + 13.0/14*sin(4*t + 1.0/5) + 4.0/7*sin(5*t + 17.0/5) + 5.0/11*sin(7*t + 3) + 2.0/5*sin(9*t + 19.0/6) + 1.0/3*sin(10*t + 1.0/10) + 1743.0/8)*theta(59*PI -t)*theta(t - 55*PI) + (-1.0/3*sin(5.0/6 - 10*t) + 32.0/7*sin(t + 7.0/6) + 20.0/9*sin(2*t + 19.0/6) + 8.0/3*sin(3*t + 12.0/7) + 17.0/6*sin(4*t + 6.0/5) + 7.0/5*sin(5*t + 16.0/11) + 1.0/14*sin(6*t + 33.0/16) + 1.0/11*sin(7*t + 33.0/7) + 1.0/7*sin(8*t + 17.0/7) + 1.0/8*sin(9*t + 6.0/7) + 1.0/6)*theta(55*PI -t)*theta(t - 51*PI) + (222.0/5*sin(t + 22.0/5) + 170.0/13*sin(2*t + 12.0/7) + 11.0/6*sin(3*t + 25.0/6) + 8.0/3*sin(4*t + 7.0/6) + 16.0/7*sin(5*t + 30.0/7) +sin(6*t + 5.0/3) - 2573.0/13)*theta(51*PI -t)*theta(t - 47*PI) + (-17.0/18*sin(1.0/10 - 4*t) + 101.0/5*sin(t + 2.0/5) + 27.0/11*sin(2*t + 12.0/11) + 23.0/11*sin(3*t + 4.0/3) + 4.0/5*sin(5*t + 16.0/7) + 2.0/3*sin(6*t + 1.0/5) + 3.0/8*sin(7*t + 5.0/2) - 1)*theta(47*PI -t)*theta(t - 43*PI) + (-39.0/5*sin(3.0/2 - 5*t) - 69.0/10*sin(4.0/5 -t) + 43.0/8*sin(2*t + 21.0/22) + 253.0/18*sin(3*t + 9.0/2) + 25*sin(4*t + 19.0/6) + 7.0/3*sin(6*t + 2.0/7) + 3.0/2*sin(7*t + 32.0/9) + 2.0/3*sin(8*t + 22.0/5) + 5.0/11*sin(9*t + 30.0/7) + 5.0/3*sin(10*t + 5.0/2) + 12.0/7*sin(11*t + 7.0/9) + 9.0/10*sin(12*t + 12.0/11) + 1704.0/7)*theta(43*PI -t)*theta(t - 39*PI) + (83.0/2*sin(t + 14.0/3) + 163.0/27*sin(2*t + 9.0/7) + 17.0/4*sin(3*t + 33.0/7) + 11.0/8*sin(4*t + 21.0/11) + 18.0/19*sin(5*t + 24.0/7) + 13.0/6*sin(6*t + 11.0/10) - 83.0/8)*theta(39*PI -t)*theta(t - 35*PI) + (-1.0/3*sin(7.0/5 - 10*t) - 3.0/4*sin(11.0/7 - 9*t) - 16*sin(7.0/5 - 4*t) + 733.0/7*sin(t + 11.0/4) + 36*sin(2*t + 17.0/6) + 11.0/10*sin(3*t + 56.0/19) + 53.0/4*sin(5*t + 20.0/9) + 37.0/10*sin(6*t + 5.0/7) + 3.0/4*sin(7*t + 13.0/5) + 34.0/11*sin(8*t + 1.0/22) - 502.0/7)*theta(35*PI -t)*theta(t - 31*PI) + (-43.0/6*sin(4.0/3 - 2*t) + 335.0/4*sin(t + 11.0/12) + 69.0/10*sin(3*t + 13.0/6) + 7.0/5*sin(4*t + 31.0/9) + 3196.0/23)*theta(31*PI -t)*theta(t - 27*PI) + (-7.0/9*sin(1.0/11 - 9*t) - 8.0/5*sin(3.0/7 - 7*t) - 16.0/3*sin(10.0/7 - 5*t) + 459.0/7*sin(t + 13.0/3) + 207.0/4*sin(2*t + 15.0/7) + 209.0/13*sin(3*t + 23.0/6) + 235.0/39*sin(4*t + 25.0/8) + 9.0/5*sin(6*t + 15.0/14) + 17.0/6*sin(8*t + 8.0/5) + 3.0/4*sin(10*t + 2) - 901.0/7)*theta(27*PI -t)*theta(t - 23*PI) + (-12.0/13*sin(10.0/7 - 7*t) - 76.0/7*sin(4.0/3 - 2*t) + 447.0/7*sin(t + 11.0/5) + 28.0/5*sin(3*t + 27.0/7) + 24.0/7*sin(4*t + 5.0/2) + 14.0/13*sin(5*t + 10.0/3) + 19.0/6*sin(6*t + 26.0/9) + 33.0/17*sin(8*t + 17.0/6) + 8.0/7*sin(9*t + 1.0/41) + 10.0/7*sin(10*t + 3) + 1039.0/4)*theta(23*PI -t)*theta(t - 19*PI) + (-8.0/9*sin(6.0/5 - 17*t) - 3.0/5*sin(2.0/7 - 16*t) - 1.0/2*sin(3.0/4 - 11*t) - 81.0/7*sin(3.0/5 - 6*t) - 143.0/3*sin(2.0/5 - 3*t) + 1031.0/7*sin(t + 15.0/8) + 689.0/9*sin(2*t + 38.0/11) + 153.0/5*sin(4*t + 47.0/10) + 47.0/6*sin(5*t + 1.0/4) + 133.0/12*sin(7*t + 22.0/5) + 25.0/4*sin(8*t + 40.0/9) + 57.0/7*sin(9*t + 71.0/18) + 12.0/7*sin(10*t + 13.0/5) + 77.0/19*sin(12*t + 19.0/5) + 7.0/2*sin(13*t + 19.0/8) + 18.0/17*sin(14*t + 14.0/3) + 2.0/7*sin(15*t + 18.0/19) +sin(18*t + 18.0/7) + 1073.0/5)*theta(19*PI -t)*theta(t - 15*PI) + (-23.0/15*sin(6.0/5 - 16*t) - 9.0/7*sin(10.0/7 - 15*t) - 21.0/8*sin(6.0/5 - 12*t) - 8.0/3*sin(1.0/8 - 11*t) - 996.0/7*sin(1.0/5 -t) + 387.0/7*sin(2*t + 11.0/4) + 183.0/5*sin(3*t + 9.0/4) + 302.0/5*sin(4*t + 18.0/5) + 49.0/3*sin(5*t + 22.0/9) + 46.0/3*sin(6*t + 8.0/5) + 69.0/8*sin(7*t + 50.0/11) + 17.0/4*sin(8*t + 7.0/6) + 42.0/5*sin(9*t + 19.0/7) + 22.0/3*sin(10*t + 1.0/15) + 25.0/7*sin(13*t + 3.0/4) + 1.0/4*sin(14*t + 1.0/5) - 3235.0/14)*theta(15*PI -t)*theta(t - 11*PI) + (-8.0/5*sin(4.0/3 - 9*t) - 136.0/13*sin(11.0/8 - 5*t) + 741.0/8*sin(t + 15.0/16) + 62.0/3*sin(2*t + 13.0/7) + 51.0/4*sin(3*t + 18.0/5) + 7*sin(4*t + 2.0/3) + 25.0/3*sin(6*t + 13.0/4) + 53.0/10*sin(7*t + 13.0/3) + 23.0/7*sin(8*t + 20.0/9) + 16.0/7*sin(10*t + 33.0/8) + 937.0/7)*theta(11*PI -t)*theta(t - 7*PI) + (13.0/8*sin(9*t) + 859.0/10*sin(t + 1.0/2) + 271.0/6*sin(2*t + 4.0/5) + 175.0/9*sin(3*t + 41.0/10) + 661.0/44*sin(4*t + 27.0/14) + 209.0/26*sin(5*t + 41.0/9) + 47.0/9*sin(6*t + 11.0/7) + 20.0/7*sin(7*t + 3.0/2) + 16.0/7*sin(8*t + 15.0/7) + 47.0/24*sin(10*t + 4.0/5) - 1281.0/13)*theta(7*PI -t)*theta(t - 3*PI) + (-5.0/6*sin(1.0/10 - 22*t) - 12.0/5*sin(4.0/7 - 17*t) - 53.0/7*sin(3.0/4 - 14*t) - 295.0/9*sin(5.0/4 - 6*t) - 173.0/7*sin(1.0/3 - 5*t) - 5967.0/16*sin(13.0/12 -t) + 611.0/5*sin(2*t + 4.0/5) + 494.0/9*sin(3*t + 18.0/5) + 73.0/3*sin(4*t + 17.0/7) + 61.0/12*sin(7*t + 1.0/3) + 77.0/9*sin(8*t + 3.0/4) + 311.0/24*sin(9*t + 15.0/16) + 58.0/7*sin(10*t + 1.0/6) + 75.0/7*sin(11*t + 57.0/14) + 23.0/3*sin(12*t + 22.0/7) + 46.0/9*sin(13*t + 1.0/7) + 76.0/15*sin(15*t + 47.0/12) + 15.0/2*sin(16*t + 5.0/4) + 3.0/5*sin(18*t + 33.0/7) + 9.0/4*sin(19*t + 3) + 50.0/17*sin(20*t + 15.0/16) + 2.0/3*sin(21*t + 9.0/2) + 1.0/2*sin(23*t + 11.0/6) - 1643.0/8)*theta(3*PI -t)*theta(t +PI))*theta(sqrt(sgn(sin(t/2))));
}

float y(float t)
{
  return ((-1103.0/24*sin(11.0/7 -t) + 28.0/3*sin(2*t + 11.0/7) + 17.0/3*sin(3*t + 11.0/7) + 40.0/7*sin(4*t + 11.0/7) + 46.0/9*sin(5*t + 11.0/7) + 17.0/5*sin(6*t + 11.0/7) + 5.0/6*sin(7*t + 11.0/7) + 2.0/3*sin(8*t + 11.0/7) + 1.0/14*sin(9*t + 8.0/5) + 2.0/5*sin(10*t + 11.0/7) + 4012.0/7)*theta(103*PI -t)*theta(t - 99*PI) + (-173.0/29*sin(11.0/7 - 6*t) - 383.0/6*sin(11.0/7 - 2*t) + 965.0/21*sin(t + 11.0/7) + 114.0/23*sin(3*t + 11.0/7) + 2*sin(4*t + 11.0/7) + 121.0/30*sin(5*t + 11.0/7) + 1.0/2*sin(7*t + 14.0/9) + 1.0/6*sin(8*t + 14.0/3) + 5823.0/10)*theta(99*PI -t)*theta(t - 95*PI) + (-23.0/6*sin(11.0/7 - 10*t) - 8.0/9*sin(11.0/7 - 9*t) + 122.0/5*sin(t + 33.0/7) + 643.0/5*sin(2*t + 11.0/7) + 167.0/5*sin(3*t + 8.0/5) + 56.0/11*sin(4*t + 8.0/5) + 69.0/8*sin(5*t + 33.0/7) + 29.0/15*sin(6*t + 14.0/9) + 13.0/4*sin(7*t + 8.0/5) + 41.0/10*sin(8*t + 8.0/5) - 942.0/7)*theta(95*PI -t)*theta(t - 91*PI) + (1300.0/9*sin(t + 33.0/7) + 347.0/5*sin(2*t + 11.0/7) + 6.0/7*sin(3*t + 14.0/3) + 79.0/6*sin(4*t + 8.0/5) + 14.0/13*sin(5*t + 14.0/3) + 246.0/35*sin(6*t + 11.0/7) + 2463.0/11)*theta(91*PI -t)*theta(t - 87*PI) + (-2.0/3*sin(11.0/7 - 13*t) - 29.0/28*sin(3.0/2 - 12*t) - 131.0/5*sin(11.0/7 - 7*t) - 31.0/7*sin(14.0/9 - 4*t) - 61.0/4*sin(11.0/7 - 2*t) - 295.0/8*sin(11.0/7 -t) + 33.0/7*sin(3*t + 33.0/7) + 3.0/7*sin(5*t + 9.0/5) + 42.0/5*sin(6*t + 8.0/5) + 15.0/7*sin(8*t + 8.0/5) + 23.0/6*sin(9*t + 8.0/5) + 68.0/23*sin(10*t + 11.0/7) + 20.0/7*sin(11*t + 8.0/5) + 17.0/7*sin(14*t + 8.0/5) - 515.0/8)*theta(87*PI -t)*theta(t - 83*PI) + (-14.0/3*sin(11.0/7 - 5*t) - 236.0/9*sin(11.0/7 - 3*t) + 489.0/2*sin(t + 33.0/7) + 104.0/7*sin(2*t + 8.0/5) + 23.0/6*sin(4*t + 11.0/7) + 58.0/7*sin(6*t + 11.0/7) - 483.0/2)*theta(83*PI -t)*theta(t - 79*PI) + (-183.0/10*sin(11.0/7 - 3*t) - 1067.0/6*sin(11.0/7 -t) + 1.0/2*sin(2*t + 4.0/3) + 3.0/8*sin(4*t + 10.0/7) - 2710.0/9)*theta(79*PI -t)*theta(t - 75*PI) + (-9.0/17*sin(10.0/7 - 10*t) - 1299.0/13*sin(11.0/7 -t) + 16*sin(2*t + 11.0/7) + 73.0/8*sin(3*t + 8.0/5) + 31.0/6*sin(4*t + 11.0/7) + 15.0/4*sin(5*t + 8.0/5) + 9.0/5*sin(6*t + 13.0/8) + 12.0/11*sin(7*t + 8.0/5) + 15.0/8*sin(8*t + 8.0/5) + 4.0/9*sin(9*t + 8.0/5) - 535.0/3)*theta(75*PI -t)*theta(t - 71*PI) + (-8.0/3*sin(11.0/7 - 10*t) - 39.0/4*sin(11.0/7 - 6*t) - 3*sin(11.0/7 - 5*t) - 388.0/3*sin(11.0/7 - 2*t) - 274.0/7*sin(11.0/7 -t) + 97.0/10*sin(3*t + 11.0/7) + 130.0/43*sin(4*t + 13.0/8) + 37.0/6*sin(7*t + 8.0/5) + 22.0/23*sin(8*t + 13.0/8) + 1.0/4*sin(9*t + 5.0/4) - 4531.0/13)*theta(71*PI -t)*theta(t - 67*PI) + (-6.0/7*sin(11.0/7 - 10*t) - 4.0/7*sin(11.0/7 - 4*t) - 51.0/4*sin(11.0/7 - 3*t) - 541.0/6*sin(11.0/7 -t) + 39.0/2*sin(2*t + 11.0/7) + 34.0/11*sin(5*t + 33.0/7) + 10.0/7*sin(6*t + 11.0/7) + 1.0/6*sin(7*t + 12.0/7) + 1.0/4*sin(8*t + 11.0/7) + 9.0/7*sin(9*t + 33.0/7) - 461.0/2)*theta(67*PI -t)*theta(t - 63*PI) + (-5.0/7*sin(14.0/9 - 4*t) - 41.0/7*sin(11.0/7 - 3*t) + 77.0/4*sin(t + 11.0/7) + 209.0/13*sin(2*t + 11.0/7) + 5.0/8*sin(5*t + 14.0/3) + 923.0/4)*theta(63*PI -t)*theta(t - 59*PI) + (182.0/9*sin(t + 10.0/3) + 43.0/5*sin(2*t + 2.0/7) + 24.0/5*sin(3*t + 24.0/7) + 16.0/5*sin(4*t + 1.0/5) + 21.0/8*sin(5*t + 16.0/5) + 7.0/3*sin(6*t + 1.0/28) + 41.0/20*sin(7*t + 16.0/5) + 9.0/5*sin(8*t + 1.0/13) + 14.0/9*sin(9*t + 16.0/5) + 11.0/8*sin(10*t + 1.0/16) + 1201.0/4)*theta(59*PI -t)*theta(t - 55*PI) + (-29.0/5*sin(4.0/7 - 2*t) + 8.0/7*sin(t + 31.0/8) + 83.0/9*sin(3*t + 23.0/6) + 241.0/13*sin(4*t + 11.0/4) + 97.0/16*sin(5*t + 14.0/3) +sin(6*t + 10.0/7) + 15.0/16*sin(7*t + 23.0/5) + 1.0/5*sin(8*t + 1.0/4) + 5.0/7*sin(9*t + 29.0/10) + 4.0/3*sin(10*t + 13.0/9) + 2683.0/9)*theta(55*PI -t)*theta(t - 51*PI) + (-9.0/8*sin(7.0/6 - 6*t) - 53.0/4*sin(1.0/7 - 2*t) - 149.0/3*sin(1.0/3 -t) + 9.0/4*sin(3*t + 13.0/5) + 31.0/8*sin(4*t + 5.0/2) + 12.0/7*sin(5*t + 21.0/8) + 3239.0/6)*theta(51*PI -t)*theta(t - 47*PI) + (-sin(3.0/4 - 6*t) - 4.0/3*sin(4.0/3 - 4*t) - 21.0/8*sin(1 - 3*t) - 91.0/2*sin(4.0/3 -t) + 9.0/7*sin(2*t + 14.0/3) + 1.0/8*sin(5*t + 53.0/13) + 5.0/9*sin(7*t + 38.0/13) + 1483.0/5)*theta(47*PI -t)*theta(t - 43*PI) + (-7.0/6*sin(1.0/5 - 11*t) - 6.0/5*sin(1.0/4 - 8*t) - 43.0/7*sin(2.0/9 - 2*t) + 19.0/3*sin(t + 23.0/7) + 199.0/18*sin(3*t + 11.0/3) + 209.0/14*sin(4*t + 7.0/3) + 38.0/7*sin(5*t + 57.0/14) + 5.0/3*sin(6*t + 1.0/2) + 4.0/9*sin(7*t + 4) + 5.0/11*sin(9*t + 13.0/4) + 4.0/5*sin(10*t + 12.0/5) + 2.0/5*sin(12*t + 3.0/8) + 1843.0/7)*theta(43*PI -t)*theta(t - 39*PI) + (-5.0/11*sin(9.0/7 - 4*t) + 133.0/8*sin(t + 18.0/7) + 45.0/7*sin(2*t + 37.0/12) + 59.0/20*sin(3*t + 17.0/4) + 10.0/9*sin(5*t + 1.0/3) + 12.0/5*sin(6*t + 1.0/3) + 170)*theta(39*PI -t)*theta(t - 35*PI) + (-37.0/8*sin(3.0/8 - 8*t) - 40.0/13*sin(10.0/11 - 6*t) - 236.0/11*sin(14.0/9 - 3*t) + 1357.0/12*sin(t + 30.0/7) + 167.0/7*sin(2*t + 30.0/7) + 117.0/8*sin(4*t + 5.0/3) + 16.0/5*sin(5*t + 22.0/5) + 183.0/23*sin(7*t + 7.0/3) + 23.0/7*sin(9*t + 2.0/7) + 8.0/3*sin(10*t + 10.0/3) - 1519.0/8)*theta(35*PI -t)*theta(t - 31*PI) + (-116.0/23*sin(2.0/5 - 2*t) - 731.0/6*sin(7.0/8 -t) + 29.0/5*sin(3*t + 1.0/9) + 14.0/5*sin(4*t + 9.0/8) + 65.0/7)*theta(31*PI -t)*theta(t - 27*PI) + (-35.0/9*sin(3.0/5 - 5*t) - 20.0/7*sin(5.0/6 - 3*t) - 69.0/5*sin(11.0/8 - 2*t) - 382.0/3*sin(5.0/4 -t) + 8.0/7*sin(4*t + 11.0/3) + 6.0/5*sin(6*t + 1.0/3) + 26.0/7*sin(7*t + 5.0/8) + 6.0/5*sin(8*t + 9.0/7) + 9.0/5*sin(9*t + 3.0/2) + 4.0/5*sin(10*t + 19.0/7) - 94.0/3)*theta(27*PI -t)*theta(t - 23*PI) + (-8.0/5*sin(3.0/2 - 6*t) - 113.0/14*sin(4.0/3 - 3*t) - 188.0/15*sin(11.0/9 - 2*t) + 657.0/10*sin(t + 33.0/7) + 3.0/2*sin(4*t + 27.0/8) + 31.0/15*sin(5*t + 2.0/5) + 2.0/3*sin(7*t + 11.0/5) + 9.0/8*sin(8*t + 3.0/5) + 1.0/11*sin(9*t + 16.0/5) + 3.0/4*sin(10*t + 11.0/8) + 681.0/10)*theta(23*PI -t)*theta(t - 19*PI) + (-7.0/4*sin(5.0/6 - 13*t) - 12.0/7*sin(3.0/2 - 11*t) - 2*sin(1 - 9*t) - 37.0/5*sin(5.0/7 - 4*t) - 243.0/4*sin(1.0/4 -t) + 647.0/6*sin(2*t + 12.0/7) + 198.0/7*sin(3*t + 4.0/5) + 137.0/8*sin(5*t + 19.0/5) + 99.0/14*sin(6*t + 4.0/3) + 6.0/5*sin(7*t + 2.0/9) + 81.0/8*sin(8*t + 10.0/11) + 11.0/4*sin(10*t + 4.0/3) + 17.0/8*sin(12*t + 2.0/7) + 3.0/7*sin(14*t + 3.0/8) + 4.0/5*sin(15*t + 39.0/11) + 9.0/10*sin(16*t + 13.0/5) + 1.0/3*sin(17*t + 31.0/7) + 9.0/7*sin(18*t + 3.0/5) - 5164.0/7)*theta(19*PI -t)*theta(t - 15*PI) + (-sin(10.0/7 - 16*t) - 4.0/3*sin(6.0/7 - 12*t) - 4.0/5*sin(5.0/7 - 11*t) - 19.0/4*sin(3.0/4 - 7*t) - 439.0/6*sin(5.0/4 -t) + 623.0/6*sin(2*t + 2.0/3) + 249.0/5*sin(3*t + 2.0/7) + 203.0/8*sin(4*t + 31.0/8) + 17.0/6*sin(5*t + 14.0/3) + 45.0/7*sin(6*t + 8.0/5) + 43.0/4*sin(8*t + 3.0/2) + 113.0/14*sin(9*t + 25.0/7) + 38.0/7*sin(10*t + 13.0/9) + 13.0/9*sin(13*t + 1) + 9.0/8*sin(14*t + 17.0/4) + 3.0/7*sin(15*t + 13.0/3) - 3589.0/5)*theta(15*PI -t)*theta(t - 11*PI) + (-542.0/7*sin(5.0/8 -t) + 431.0/10*sin(2*t + 5.0/11) + 165.0/8*sin(3*t + 9.0/2) + 37.0/8*sin(4*t + 16.0/7) + 23.0/8*sin(5*t + 5.0/3) + 32.0/9*sin(6*t + 7.0/13) + 1.0/2*sin(7*t + 1.0/15) + 2.0/7*sin(8*t + 7.0/6) + 9.0/4*sin(9*t + 11.0/7) + 7.0/5*sin(10*t + 15.0/7) - 2087.0/4)*theta(11*PI -t)*theta(t - 7*PI) + (-9.0/4*sin(4.0/5 - 8*t) - 29.0/10*sin(1.0/3 - 7*t) - 4.0/5*sin(1.0/6 - 6*t) - 109.0/9*sin(10.0/7 - 3*t) - 1828.0/21*sin(6.0/5 -t) + 83.0/2*sin(2*t + 1.0/45) + 87.0/10*sin(4*t + 25.0/7) + 13.0/4*sin(5*t + 14.0/9) + 23.0/6*sin(9*t + 26.0/7) + 7.0/6*sin(10*t + 11.0/7) - 3047.0/6)*theta(7*PI -t)*theta(t - 3*PI) + (-23.0/7*sin(17.0/11 - 18*t) - 31.0/5*sin(3.0/5 - 15*t) - 39.0/7*sin(8.0/7 - 13*t) - 46.0/9*sin(3.0/5 - 11*t) - 87.0/5*sin(2.0/7 - 9*t) - 121.0/7*sin(3.0/4 - 8*t) - 179.0/5*sin(5.0/7 - 7*t) - 2184.0/37*sin(1.0/4 - 6*t) - 51.0/4*sin(1.0/2 - 4*t) - 372.0/7*sin(4.0/3 - 2*t) + 1457.0/4*sin(t + 29.0/7) + 181.0/4*sin(3*t + 16.0/7) + 38.0/3*sin(5*t + 23.0/7) + 173.0/10*sin(10*t + 17.0/5) + 80.0/7*sin(12*t + 19.0/5) + 6.0/5*sin(14*t + 1.0/4) + 8.0/5*sin(16*t + 11.0/9) + 12.0/7*sin(17*t + 7.0/4) + 24.0/7*sin(19*t + 17.0/7) + 9.0/7*sin(20*t + 23.0/7) + 15.0/4*sin(21*t + 18.0/19) + 19.0/18*sin(22*t + 32.0/13) + 5.0/2*sin(23*t + 5.0/4) + 266)*theta(3*PI -t)*theta(t +PI))*theta(sqrt(sgn(sin(t/2))));
}

PFont fuente;

// fondos 
PImage fondo0;
PImage fondo1;
PImage fondo2;
PImage fondo3;
PImage fondo4;
PImage fondo5;
PImage fondo6;

PImage start1, start2;

PImage run1, run2, idleImg, ringImg;

PImage[] moveAnim = new PImage[4];

PImage egg1, egg2;

PImage emeraldImg;
PImage levelsImg;
PImage finalImg;

int estado = 0;

float alphaTexto = 0;

int tiempoPantalla = 0;

// pantalla 1
float sonicX = -200;
boolean idle = false;
float ringY = -100;

// pantalla 2
float moveX = 0;

// pantalla 3
float eggX = 0;
boolean eggRight = true;

// pantalla 4,5,6
float escalaImg = 0.1;

// boton inicio
int botonX = 300;
int botonY = 500;
int botonW = 200;
int botonH = 60;

void setup() {

  size(800, 600);

  fuente = createFont("SegaArcadeFont-Regular.ttf", 24);

  textFont(fuente);

  // fondos
  fondo0 = loadImage("pantalla1fondo.jpg");
  fondo1 = loadImage("fondo.jpg");
  fondo2 = loadImage("fondo.jpg");
  fondo3 = loadImage("fondo.jpg");
  fondo4 = loadImage("fondo.jpg");
  fondo5 = loadImage("fondo.jpg");
  fondo6 = loadImage("fondo.jpg");

  start1 = loadImage("sonic1.png");
  start2 = loadImage("sonic2.png");

  run1 = loadImage("pantalla2(3).png");
  run2 = loadImage("pantalla2(4).png");

  idleImg = loadImage("pantalla2(2).png");

  ringImg = loadImage("Ring_icon_SUdaymissions.png");

  for (int i = 0; i < 4; i++) {
    moveAnim[i] = loadImage("move" + (i+1) + ".png");
  }

  egg1 = loadImage("pantalla4 (1).png");
  egg2 = loadImage("pantalla4 (2).png");

  emeraldImg = loadImage("pantalla5.png");

  levelsImg = loadImage("Mania_Trio_Stock_Art.png");

  finalImg = loadImage("pantalla6.png");
}

void draw() {

  background(0);

  // fondos
  if (estado == 0) image(fondo0, 0, 0, width, height);
  if (estado == 1) image(fondo1, 0, 0, width, height);
  if (estado == 2) image(fondo2, 0, 0, width, height);
  if (estado == 3) image(fondo3, 0, 0, width, height);
  if (estado == 4) image(fondo4, 0, 0, width, height);
  if (estado == 5) image(fondo5, 0, 0, width, height);
  if (estado == 6) image(fondo6, 0, 0, width, height);

  // pantallas
  if (estado == 0) pantalla0();
  if (estado == 1) pantalla1();
  if (estado == 2) pantalla2();
  if (estado == 3) pantalla3();
  if (estado == 4) pantalla4();
  if (estado == 5) pantalla5();
  if (estado == 6) pantalla6();
}

void pantalla0() {

  if (frameCount % 30 < 15) {

    image(start1, width/2 - 140, 170, 280, 200);

  } else {

    image(start2, width/2 - 140, 170, 280, 200);
  }

  // boton
  fill(0);

  rect(botonX, botonY, botonW, botonH);

  noStroke();
  fill(255);

  textAlign(CENTER, CENTER);

  text("START", botonX + botonW/2, botonY + botonH/2);
}

void pantalla1() {

  fadeTexto();

  noStroke();
  fill(255, alphaTexto);

  textAlign(CENTER, CENTER);

  text("Todos los videojuegos de la serie presentan a un joven erizo azul con una increíble velocidad llamado Sonic the Hedgehog, quien es el protagonista y héroe principal.\n\nLos anillos son uno de los elementos más icónicos de Sonic. Sirven como protección frente al daño, incentivan la exploración de niveles y recompensan la velocidad y la habilidad del jugador.",
    width/2 - 300, 40, 600, 400);

  // movimiento sonic
  if (!idle) {

    sonicX += 5;

    if (frameCount % 20 < 10) {

      image(run1, sonicX, 420, 120, 120);

    } else {

      image(run2, sonicX, 420, 120, 120);
    }

    if (sonicX > width - 180) {

      idle = true;
    }

  } else {

    image(idleImg, sonicX, 420, 120, 120);

    // anillo bajando
    if (ringY < 350) {

      ringY += 3;
    }

    image(ringImg, sonicX + 35, ringY, 50, 50);
  }

  cambioAutomatico();
}

void pantalla2() {

  fadeTexto();

  noStroke();
  fill(255, alphaTexto);

  textAlign(CENTER, CENTER);

  text("El objetivo principal de Sonic the Hedgehog es avanzar por distintos niveles derrotando enemigos y evitando obstáculos para detener los planes del Dr. Robotnik y liberar a los animales capturados.",
    width/2 - 300, 40, 600, 300);

  moveX += 6;

  if (moveX > width) {

    moveX = -100;
  }

  image(moveAnim[(frameCount/8)%4], moveX, 380, 120, 120);

  cambioAutomatico();
}

void pantalla3() {

  fadeTexto();

  noStroke();
  fill(255, alphaTexto);

  textAlign(CENTER, CENTER);

  text("El principal antagonista es Doctor Eggman, también conocido como Dr. Robotnik, un científico que busca conquistar el mundo y crear el Eggman Empire.",
    width/2 - 300, 40, 600, 300);

  if (eggRight) {

    eggX += 4;

    image(egg1, eggX, 380, 140, 140);

    if (eggX > width - 140) {

      eggRight = false;
    }

  } else {

    eggX -= 4;

    image(egg2, eggX, 380, 140, 140);

    if (eggX < 0) {

      eggRight = true;
    }
  }

  cambioAutomatico();
}

void pantalla4() {

  fadeTexto();

  noStroke();
  fill(255, alphaTexto);

  textAlign(CENTER, CENTER);

  text("Las Esmeraldas Caos tienen propiedades místicas con habilidades de un gran poder.",
    width/2 - 300, 40, 600, 300);

  crecerImagen();

  imageMode(CENTER);

  image(emeraldImg, width/2, 380,
    250 * escalaImg,
    250 * escalaImg);

  imageMode(CORNER);

  cambioAutomatico();
}

void pantalla5() {

  fadeTexto();

  noStroke();
  fill(255, alphaTexto);

  textAlign(CENTER, CENTER);

  text("El videojuego en total tiene 8 niveles:\n\nZona de Green Hill\nZona de mármol\nZona de jardín primaveral\nZona del laberinto\nZona de Luz Estelar\nZona de desecho cerebral\nZona final\nEscenario especial",
    width/2 - 300, 30, 600, 400);

  crecerImagen();

  imageMode(CENTER);

  image(levelsImg, width/2, 450,
    300 * escalaImg,
    200 * escalaImg);

  imageMode(CORNER);

  cambioAutomatico();
}

void pantalla6() {

  noStroke();
  fill(255);

  textAlign(CENTER, CENTER);

  text("Lo que comenzó como un videojuego de plataformas terminó convirtiéndose en una de las sagas más emblemáticas de Sega.",
    width/2 - 300, 40, 600, 300);

  crecerImagen();

  imageMode(CENTER);

  image(finalImg, width/2, 380,
    300 * escalaImg,
    300 * escalaImg);

  imageMode(CORNER);

  int restartX = 540;

  fill(0);

  rect(restartX, botonY, botonW, botonH);

  fill(255);

  text("RESTART", restartX + botonW/2, botonY + botonH/2);
}

void fadeTexto() {

  if (alphaTexto < 255) {

    alphaTexto += 2;
  }
}

void cambioAutomatico() {

  if (millis() - tiempoPantalla > 10000) {

    estado++;

    alphaTexto = 0;

    tiempoPantalla = millis();

    escalaImg = 0.1;
  }
}

void crecerImagen() {

  if (escalaImg < 1) {

    escalaImg += 0.01;
  }
}

void mousePressed() {

  // pantalla inicio
  if (estado == 0) {

    if (mouseX > botonX &&
      mouseX < botonX + botonW &&
      mouseY > botonY &&
      mouseY < botonY + botonH) {

      estado = 1;

      tiempoPantalla = millis();
    }
  }

  // reinicio
  if (estado == 6) {

    int restartX = 540;

    if (mouseX > restartX &&
      mouseX < restartX + botonW &&
      mouseY > botonY &&
      mouseY < botonY + botonH) {

      reiniciar();
    }
  }
}

void reiniciar() {

  estado = 0;

  alphaTexto = 0;

  sonicX = -200;

  idle = false;

  ringY = -100;

  moveX = 0;

  eggX = 0;

  eggRight = true;

  escalaImg = 0.1;
}

void keyPressed() {

  // pasar pantallas con tecla (testeo)
  if (key == 'n') {

    estado++;

    if (estado > 6) {

      estado = 0;
    }

    tiempoPantalla = millis();

    alphaTexto = 0;
  }
}

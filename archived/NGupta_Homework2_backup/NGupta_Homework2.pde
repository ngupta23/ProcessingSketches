void setup() {
  size(600,800); // original
  //size(300, 400); // scaled aspect ratio
  //size(150, 800); //magic mirror (thin)
  //size(800, 800); //magic mirror (fat)
  
  background(255);
  noStroke();
  
  // Mountain Rightmost
  fill(118,131,163);
  beginShape();
  curveVertex(0.67 * width , 0.1025 * height);
  curveVertex(0.67 * width , 0.1025 * height);
  curveVertex(0.8167 * width , 0.0 * height);
  curveVertex(0.905 * width , 0.0538 * height);
  curveVertex(0.995 * width , 0.0012 * height);
  curveVertex(0.9983 * width , 0.1688 * height);
  curveVertex(0.67 * width , 0.1025 * height);
  curveVertex(0.67 * width , 0.1025 * height);
  endShape();
  
  // Mountain middle
  fill(105,119,146);
  beginShape();
  curveVertex(0.6667 * width , 0.0025 * height);
  curveVertex(0.6667 * width , 0.0025 * height);
  curveVertex(0.8083 * width , 0.1013 * height);
  curveVertex(0.9967 * width , 0.1388 * height);
  curveVertex(0.9983 * width , 0.3113 * height);
  curveVertex(0.0017 * width , 0.3 * height);
  curveVertex(0.0017 * width , 0.0 * height);
  curveVertex(0.0017 * width , 0.0 * height);
  endShape();
  
  // Mudslide
  fill(120,127,137);
  beginShape();
  curveVertex(0.7483 * width , 0.1962 * height);
  curveVertex(0.7483 * width , 0.1962 * height);
  curveVertex(0.9933 * width , 0.28 * height);
  curveVertex(0.995 * width , 0.4638 * height);
  curveVertex(0.4283 * width , 0.4625 * height);
  curveVertex(0.6683 * width , 0.2625 * height);
  curveVertex(0.745 * width , 0.1975 * height);
  curveVertex(0.745 * width , 0.1975 * height);
  endShape();
  
  // back trees
  fill(69,100,95);
  beginShape();
  curveVertex(0.995 * width , 0.4012 * height);
  curveVertex(0.995 * width , 0.4012 * height);
  curveVertex(0.6017 * width , 0.4112 * height);
  curveVertex(0.7817 * width , 0.3262 * height);
  curveVertex(0.9233 * width , 0.3175 * height);
  curveVertex(0.9967 * width , 0.34 * height);
  curveVertex(0.9967 * width , 0.3988 * height);
  curveVertex(0.9967 * width , 0.3988 * height);
  endShape();
  
  // ice
  fill(255);
  beginShape();
  curveVertex(0.4867 * width , 0.00 * height);
  curveVertex(0.4867 * width , 0.00 * height);
  curveVertex(0.625 * width , 0.1938 * height);
  curveVertex(0.6067 * width , 0.2188 * height);
  curveVertex(0.5617 * width , 0.2262 * height);
  curveVertex(0.5167 * width , 0.1175 * height);
  curveVertex(0.465 * width , 0.00 * height);
  curveVertex(0.465 * width , 0.00 * height);
  endShape();
  
  // Mountain second from left
  //fill(95,84,78);
  fill(95,89,91);
  beginShape();
  curveVertex(0.18 * width , 0.2 * height);
  curveVertex(0.18 * width , 0.2 * height);
  curveVertex(0.49 * width , 0.4538 * height);
  curveVertex(0.0 * width , 0.4688 * height);
  curveVertex(0.0 * width , 0.00 * height);
  curveVertex(0.0 * width , 0.00 * height);
  endShape();

  // Muddy mountain left most
  fill(143,132,130);
  beginShape();
  curveVertex(0.4033 * width , 0.445 * height);
  curveVertex(0.4033 * width , 0.445 * height);
  curveVertex(0.0033 * width , 0.2675 * height);
  curveVertex(0.0017 * width , 0.47 * height);
  curveVertex(0.3983 * width , 0.4438 * height);
  curveVertex(0.3983 * width , 0.4438 * height);
  endShape();
  
  // water background top
  fill(149,185,201);
  beginShape();
  curveVertex(0.0 * width , 0.4175 * height);
  curveVertex(0.0 * width , 0.4175 * height);
  curveVertex(0.5383 * width , 0.4 * height);
  curveVertex(1 * width , 0.4012 * height);
  curveVertex(1 * width , 1 * height);
  curveVertex(0.0 * width , 1 * height);
  curveVertex(0.0 * width , 1 * height);
  endShape();
  
  // water background bottom
  fill(107,158,180);
  beginShape();
  curveVertex(0.4967 * width , 0.4262 * height);
  curveVertex(0.4967 * width , 0.4262 * height);
  curveVertex(0.9933 * width , 0.435 * height);
  curveVertex(0.9933 * width , 0.9862 * height);
  curveVertex(0.0117 * width , 0.9888 * height);
  curveVertex(0.0017 * width , 0.45 * height);
  curveVertex(0.0017 * width , 0.45 * height);
  endShape();
  
  // front trees
  fill(13,15,14);
  beginShape();
  curveVertex(1 * width , 0.355 * height);
  curveVertex(1 * width , 0.355 * height);
  curveVertex(0.8767 * width , 0.4325 * height);
  curveVertex(1 * width , 0.4725 * height);
  curveVertex(1 * width , 0.4725 * height);
  endShape();
  
  // rock top
  fill(223,215,212);
  beginShape();
  curveVertex(0.0 * width , 0.7125 * height);
  curveVertex(0.0 * width , 0.7125 * height);
  curveVertex(0.1683 * width , 0.7012 * height);
  curveVertex(0.605 * width , 0.7338 * height);
  curveVertex(0.6033 * width , 0.7738 * height);
  curveVertex(0.1333 * width , 0.7312 * height);
  curveVertex(0.0017 * width , 0.74 * height);
  curveVertex(0.0017 * width , 0.74 * height);
  endShape();
  
  // rock middle
  fill(60,46,45);
  beginShape();
  curveVertex(0.00 * width , 0.7325 * height);
  curveVertex(0.00 * width , 0.7325 * height);
  curveVertex(0.0833 * width , 0.7238 * height);
  curveVertex(0.4633 * width , 0.765 * height);
  curveVertex(0.3433 * width , 0.9425 * height);
  curveVertex(0.0 * width , 0.9388 * height);
  curveVertex(0.0 * width , 0.9388 * height);
  endShape();

  // rock bottom
  fill(151,138,130);
  beginShape();
  curveVertex(0.1083 * width , 0.7875 * height);
  curveVertex(0.1083 * width , 0.7875 * height);
  curveVertex(0.245 * width , 0.875 * height);
  curveVertex(0.22 * width , 1 * height);
  curveVertex(0.00 * width , 1 * height);
  curveVertex(0.00 * width , 0.8188 * height);
  curveVertex(0.00 * width , 0.8188 * height);
  endShape();
   
  // rock bottom shaded
  fill(100,89,83);
  beginShape();
  curveVertex(0.2317 * width , 0.8725 * height);
  curveVertex(0.2317 * width , 0.8725 * height);
  curveVertex(0.09 * width , 0.9312 * height);
  curveVertex(0.03 * width , 1 * height);
  curveVertex(0.1817 * width , 1 * height);
  curveVertex(0.2317 * width , 0.875 * height);
  curveVertex(0.2317 * width , 0.875 * height);
  endShape();
  
  // face
  fill(194,144,137);
  beginShape();
  curveVertex(0.275 * width , 0.5525 * height);
  curveVertex(0.29 * width , 0.6 * height);
  curveVertex(0.3233 * width , 0.6375 * height);
  curveVertex(0.3517 * width , 0.6637 * height);
  curveVertex(0.3883 * width , 0.7 * height);
  curveVertex(0.425 * width , 0.7212 * height);
  curveVertex(0.4833 * width , 0.7325 * height);
  curveVertex(0.555 * width , 0.7238 * height);
  curveVertex(0.61 * width , 0.7 * height);
  curveVertex(0.65 * width , 0.6662 * height);
  curveVertex(0.71 * width , 0.5863 * height);
  curveVertex(0.7217 * width , 0.5212 * height);
  curveVertex(0.7 * width , 0.4525 * height);
  curveVertex(0.695 * width , 0.4475 * height);
  curveVertex(0.665 * width , 0.365 * height);
  curveVertex(0.6217 * width , 0.3388 * height);
  curveVertex(0.61 * width , 0.2812 * height);
  curveVertex(0.59 * width , 0.27 * height);
  curveVertex(0.4633 * width , 0.2612 * height);
  curveVertex(0.415 * width , 0.265 * height);
  curveVertex(0.3567 * width , 0.2725 * height);
  curveVertex(0.3133 * width , 0.285 * height);
  curveVertex(0.2883 * width , 0.3075 * height);
  curveVertex(0.2817 * width , 0.3438 * height);
  curveVertex(0.2767 * width , 0.3888 * height);
  curveVertex(0.2683 * width , 0.4162 * height);
  curveVertex(0.2683 * width , 0.4775 * height);
  curveVertex(0.2767 * width , 0.55 * height);
  curveVertex(0.2733 * width , 0.5512 * height);
  endShape();

  // hair
  fill(0);
  beginShape();
  curveVertex(0.68 * width , 0.4475 * height);
  curveVertex(0.68 * width , 0.4138 * height);
  curveVertex(0.69 * width , 0.4475 * height);
  curveVertex(0.68 * width , 0.4138 * height);
  curveVertex(0.67 * width , 0.375 * height);
  curveVertex(0.62 * width , 0.3488 * height);
  curveVertex(0.61 * width , 0.34 * height);
  curveVertex(0.61 * width , 0.3137 * height);
  curveVertex(0.61 * width , 0.2925 * height);
  curveVertex(0.5667 * width , 0.2725 * height);
  curveVertex(0.4967 * width , 0.2688 * height);
  curveVertex(0.4433 * width , 0.2688 * height);
  curveVertex(0.3783 * width , 0.27 * height);
  curveVertex(0.3217 * width , 0.2812 * height);
  curveVertex(0.29 * width , 0.31 * height);
  curveVertex(0.285 * width , 0.3425 * height);
  curveVertex(0.285 * width , 0.375 * height);
  curveVertex(0.28 * width , 0.3888 * height);
  curveVertex(0.27 * width , 0.4112 * height);
  curveVertex(0.2717 * width , 0.4312 * height);
  curveVertex(0.27 * width , 0.4612 * height);
  curveVertex(0.2733 * width , 0.48 * height);
  curveVertex(0.27 * width , 0.4875 * height);
  curveVertex(0.2633 * width , 0.4812 * height);
  curveVertex(0.2633 * width , 0.4562 * height);
  curveVertex(0.255 * width , 0.4338 * height);
  curveVertex(0.2467 * width , 0.415 * height);
  curveVertex(0.2383 * width , 0.3925 * height);
  curveVertex(0.2383 * width , 0.355 * height);
  curveVertex(0.24 * width , 0.3288 * height);
  curveVertex(0.2417 * width , 0.3025 * height);
  curveVertex(0.2533 * width , 0.2725 * height);
  curveVertex(0.2667 * width , 0.2488 * height);
  curveVertex(0.2817 * width , 0.23 * height);
  curveVertex(0.32 * width , 0.2138 * height);
  curveVertex(0.35 * width , 0.1988 * height);
  curveVertex(0.405 * width , 0.1838 * height);
  curveVertex(0.4517 * width , 0.175 * height);
  curveVertex(0.49 * width , 0.1762 * height);
  curveVertex(0.5417 * width , 0.1862 * height);
  curveVertex(0.5883 * width , 0.2013 * height);
  curveVertex(0.6317 * width , 0.2288 * height);
  curveVertex(0.66 * width , 0.25 * height);
  curveVertex(0.685 * width , 0.2775 * height);
  curveVertex(0.7 * width , 0.3362 * height);
  curveVertex(0.71 * width , 0.3675 * height);
  curveVertex(0.7* width , 0.4162 * height);
  curveVertex(0.69 * width , 0.4312 * height);
  curveVertex(0.69 * width , 0.4438 * height);
  endShape();
  
  //left eyebrow
  fill(0);
  beginShape();
  curveVertex(0.2867 * width , 0.42 * height);
  curveVertex(0.3233 * width , 0.41 * height);
  curveVertex(0.3483 * width , 0.4088 * height);
  curveVertex(0.3733 * width , 0.4088 * height);
  curveVertex(0.4133 * width , 0.405 * height);
  curveVertex(0.41 * width , 0.3975 * height);
  curveVertex(0.3817 * width , 0.3925 * height);
  curveVertex(0.335 * width , 0.3975 * height);
  curveVertex(0.3 * width , 0.405 * height);
  curveVertex(0.2883 * width , 0.4175 * height);
  endShape();
  
  // right eyebrow
  fill(0);
  beginShape();
  curveVertex(0.4867 * width , 0.4 * height);
  curveVertex(0.505 * width , 0.4012 * height);
  curveVertex(0.5833 * width , 0.3888 * height);
  curveVertex(0.6167 * width , 0.395 * height);
  curveVertex(0.6067 * width , 0.3787 * height);
  curveVertex(0.57 * width , 0.3738 * height);
  curveVertex(0.5133 * width , 0.3812 * height);
  curveVertex(0.4833 * width , 0.3975 * height);
  endShape();
  
  // left eye 
  fill(255);
  stroke(0);
  beginShape();
  curveVertex(0.3033 * width , 0.445 * height);
  curveVertex(0.3367 * width , 0.455 * height);
  curveVertex(0.3717 * width , 0.455 * height);
  curveVertex(0.3967 * width , 0.4462 * height);
  curveVertex(0.4117 * width , 0.4375 * height);
  curveVertex(0.3883 * width , 0.425 * height);
  curveVertex(0.3433 * width , 0.4238 * height);
  curveVertex(0.31 * width , 0.43 * height);
  curveVertex(0.3 * width , 0.4438 * height);
  curveVertex(0.28 * width , 0.4438 * height);
  endShape(CLOSE);
  
  // right eye
  fill(255);
  stroke(0);
  beginShape();
  curveVertex(0.4967 * width , 0.4288 * height);
  curveVertex(0.5233 * width , 0.44 * height);
  curveVertex(0.5717 * width , 0.4438 * height);
  curveVertex(0.605 * width , 0.435 * height);
  curveVertex(0.6317 * width , 0.42 * height);
  curveVertex(0.5917 * width , 0.4062 * height);
  curveVertex(0.5483 * width , 0.4088 * height);
  curveVertex(0.5183 * width , 0.4125 * height);
  curveVertex(0.4983 * width , 0.4225 * height);
  curveVertex(0.47 * width , 0.44 * height);
  endShape(CLOSE);
  
  //left eyeball
  fill(0);
  ellipse(0.358 * width, 0.44 * height, 0.0333 * width, 0.025 * height);
  
  //right eyeball
  fill(0);
  ellipse(0.57 * width, 0.425 * height, 0.0333 * width,0.025 * height);
  
  // Nose
  fill(176,119,108);
  noStroke();
  beginShape();
  curveVertex(0.425 * width , 0.41 * height);
  curveVertex(0.425 * width , 0.416 * height);
  curveVertex(0.4317 * width , 0.45 * height);
  curveVertex(0.4167 * width , 0.48 * height);
  curveVertex(0.3867 * width , 0.505 * height);
  curveVertex(0.3883 * width , 0.5225 * height);
  curveVertex(0.4133 * width , 0.5238 * height);
  curveVertex(0.4633 * width , 0.545 * height);
  curveVertex(0.5133 * width , 0.515 * height);
  curveVertex(0.5283 * width , 0.515 * height);
  curveVertex(0.545 * width , 0.5112 * height);
  curveVertex(0.5467 * width , 0.495 * height);
  curveVertex(0.5233 * width , 0.4762 * height);
  curveVertex(0.5 * width , 0.4625 * height);
  curveVertex(0.485 * width , 0.4512 * height);
  curveVertex(0.485 * width , 0.4262 * height);
  curveVertex(0.4867 * width , 0.4162 * height);
  curveVertex(0.4867 * width , 0.415 * height);
  endShape();
  
  // teeth
  fill(255);
  beginShape();
  curveVertex(0.3667 * width , 0.5788 * height);
  curveVertex(0.37 * width , 0.5775 * height);
  curveVertex(0.4033 * width , 0.5725 * height);
  curveVertex(0.455 * width , 0.5762 * height);
  curveVertex(0.4917 * width , 0.5738 * height);
  curveVertex(0.5367 * width , 0.5675 * height);
  curveVertex(0.565 * width , 0.5662 * height);
  curveVertex(0.5933 * width , 0.5625 * height);
  curveVertex(0.5667 * width , 0.5925 * height);
  curveVertex(0.54 * width , 0.6125 * height);
  curveVertex(0.5067 * width , 0.6288 * height);
  curveVertex(0.46 * width , 0.6338 * height);
  curveVertex(0.4183 * width , 0.6212 * height);
  curveVertex(0.3883 * width , 0.6012 * height);
  curveVertex(0.3733 * width , 0.58 * height);
  endShape();
  
  // upper lip
  fill(159,81,77);
  beginShape();
  curveVertex(0.37 * width , 0.5775 * height);
  curveVertex(0.37 * width , 0.5775 * height);
  curveVertex(0.4033 * width , 0.5725 * height);
  curveVertex(0.455 * width , 0.5762 * height);
  curveVertex(0.4917 * width , 0.5738 * height);
  curveVertex(0.5367 * width , 0.5675 * height);
  curveVertex(0.565 * width , 0.5662 * height);
  curveVertex(0.5933 * width , 0.5662 * height);
  curveVertex(0.5733 * width , 0.5588 * height);
  curveVertex(0.53 * width , 0.555 * height);
  curveVertex(0.4517 * width , 0.56 * height);
  curveVertex(0.3967 * width , 0.565 * height);
  curveVertex(0.3683 * width , 0.5788 * height);
  curveVertex(0.3683 * width , 0.5788 * height);
  endShape();

  // lower lip
  fill(159,81,77);
  beginShape();
  curveVertex(0.37 * width , 0.5775 * height);
  curveVertex(0.37 * width , 0.5775 * height);
  curveVertex(0.44 * width , 0.6062 * height);
  curveVertex(0.4767 * width , 0.61 * height);
  curveVertex(0.5317 * width , 0.5975 * height);
  curveVertex(0.565 * width , 0.5838 * height);
  curveVertex(0.5933 * width , 0.5625 * height);
  curveVertex(0.5667 * width , 0.5925 * height);
  curveVertex(0.54 * width , 0.6125 * height);
  curveVertex(0.5067 * width , 0.6288 * height);
  curveVertex(0.46 * width , 0.6338 * height);
  curveVertex(0.4183 * width , 0.6212 * height);
  curveVertex(0.3883 * width , 0.6012 * height);
  curveVertex(0.3733 * width , 0.58 * height);
  curveVertex(0.3733 * width , 0.58 * height);
  endShape();

  // right ear
  fill(176,119,108);
  beginShape();
  curveVertex(0.71 * width , 0.38 * height);
  curveVertex(0.71 * width , 0.38 * height);
  curveVertex(0.689 * width , 0.42 * height);
  curveVertex(0.6983 * width , 0.4625 * height);
  curveVertex(0.72 * width , 0.5138 * height);
  curveVertex(0.74 * width , 0.5112 * height);
  curveVertex(0.7483 * width , 0.485 * height);
  curveVertex(0.7383 * width , 0.4438 * height);
  curveVertex(0.7317 * width , 0.4112 * height);
  curveVertex(0.7267 * width , 0.3862 * height);
  curveVertex(0.7117 * width , 0.3775 * height);
  curveVertex(0.7117 * width , 0.3775 * height);
  endShape();
  
  // left ear
  fill(176,119,108);
  beginShape();
  curveVertex(0.2483 * width , 0.4138 * height);
  curveVertex(0.2483 * width , 0.4138 * height);
  curveVertex(0.2667 * width , 0.4512 * height);
  curveVertex(0.2717 * width , 0.51 * height);
  curveVertex(0.2833 * width , 0.5512 * height);
  curveVertex(0.255 * width , 0.5375 * height);
  curveVertex(0.2467 * width , 0.4988 * height);
  curveVertex(0.2483 * width , 0.4462 * height);
  curveVertex(0.2417 * width , 0.4238 * height);
  curveVertex(0.2483 * width , 0.4175 * height);
  curveVertex(0.2483 * width , 0.4175 * height);
  endShape();


  // neck
  fill(176,119,108);
  beginShape();
  curveVertex(0.36 * width , 0.675 * height);
  curveVertex(0.36 * width , 0.675 * height);
  curveVertex(0.4517 * width , 0.8525 * height);
  curveVertex(0.5883 * width , 0.7925 * height);
  curveVertex(0.715 * width , 0.5738 * height);
  curveVertex(0.5233 * width , 0.7163 * height);
  curveVertex(0.365 * width , 0.675 * height);
  curveVertex(0.365 * width , 0.675 * height);
  endShape();

  // Left Shirt
  fill(61,131,97);
  beginShape();
  curveVertex(0.3617 * width , 0.68 * height);
  curveVertex(0.365 * width , 0.6788 * height);
  curveVertex(0.4567 * width , 0.8525 * height);
  curveVertex(0.3733 * width , 0.9962 * height);
  curveVertex(0.1283 * width , 0.9988 * height);
  curveVertex(0.195 * width , 0.7975 * height);
  curveVertex(0.2467 * width , 0.7588 * height);
  curveVertex(0.365 * width , 0.6788 * height);
   endShape();

  // right shirt
  fill(61,131,97);
  beginShape();
  curveVertex(0.7167 * width , 0.5738 * height);
  curveVertex(0.7167 * width , 0.5738 * height);
  curveVertex(0.7167 * width , 0.5788 * height);
  curveVertex(0.67 * width , 0.7038 * height);
  curveVertex(0.5533 * width , 0.8 * height);
  curveVertex(0.4617 * width , 0.8525 * height);
  curveVertex(0.4117 * width , 0.9688 * height);
  curveVertex(0.3667 * width , height);
  curveVertex(width , height);
  curveVertex(width , 0.7388 * height);
  curveVertex(0.845 * width , 0.6875 * height);
  curveVertex(0.72 * width , 0.5788 * height);
  curveVertex(0.72 * width , 0.5788 * height);
  endShape();
  
  // collar right
  fill(41,99,87);
  stroke(0);
  strokeWeight(2);
  beginShape();
  curveVertex(0.7167 * width , 0.5738 * height);
  curveVertex(0.7167 * width , 0.5738 * height);
  curveVertex(0.6583 * width , 0.6962 * height);
  curveVertex(0.5567 * width , 0.8025 * height);
  curveVertex(0.7517 * width , 0.8638 * height);
  curveVertex(0.8117 * width , 0.6762 * height);
  curveVertex(0.7183 * width , 0.575 * height);
  curveVertex(0.7183 * width , 0.575 * height);
  endShape();
  
  // collar left
  fill(41,99,87);
  stroke(0);
  strokeWeight(2);
  beginShape();
  curveVertex(0.365 * width , 0.6812 * height);
  curveVertex(0.365 * width , 0.6812 * height);
  curveVertex(0.3017 * width , 0.7825 * height);
  curveVertex(0.44 * width , 0.8188 * height);
  curveVertex(0.365 * width , 0.68 * height);
  curveVertex(0.365 * width , 0.68 * height);
  endShape();

  // stripe 1
  fill(41,99,87);
  stroke(0);
  strokeWeight(2);
  beginShape();
  curveVertex(0.1633 * width , 0.8638 * height);
  curveVertex(0.1633 * width , 0.8638 * height);
  curveVertex(1 * width , 0.9625 * height);
  curveVertex(1 * width , 0.9688 * height);
  curveVertex(0.1633 * width , 0.8725 * height);
  curveVertex(0.1633 * width , 0.8725 * height);
  endShape();
  
  // stripe 2
  beginShape();
  curveVertex(0.17 * width , 0.9188 * height);
  curveVertex(0.17 * width , 0.9188 * height);
  curveVertex(0.77 * width , 1 * height);
  curveVertex(0.7283 * width , 1 * height);
  curveVertex(0.17 * width , 0.9275 * height);
  curveVertex(0.17 * width , 0.9188 * height);
  curveVertex(0.17 * width , 0.9188 * height);
  endShape();

  // stripe 3
  beginShape();
  curveVertex(0.145 * width , 0.9612 * height);
  curveVertex(0.145 * width , 0.9612 * height);
  curveVertex(0.4 * width , 0.9975 * height);
  curveVertex(0.3633 * width , 0.9988 * height);
  curveVertex(0.1383 * width , 0.9725 * height);
  curveVertex(0.14 * width , 0.9612 * height);
  curveVertex(0.14 * width , 0.9612 * height);
  endShape();

  // button
  fill(82,76,76);
  ellipse(0.4433 * width, 0.915 * height, 0.0333 * width, 0.025 * height);
  fill(46,65,59);
  ellipse(0.4433 * width, 0.915 * height, 0.0167 * width, 0.0125 * height);

}

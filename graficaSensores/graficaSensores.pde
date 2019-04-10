import controlP5.*;
import processing.serial.*;
Serial port;
ControlP5 cp5;
Chart myChart;
String[] valores;

void setup() {
  size(800, 350);
  
  port = new Serial(this, "/dev/ttyUSB0", 9600);
  cp5 = new ControlP5(this);
  myChart = cp5.addChart("Visualizacion de sensores")
               .setPosition(10, 25)
               .setSize(600, 300)
               .setRange(0, 255)
               .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
               .setStrokeWeight(10.5)
               .setColorCaptionLabel(color(255))
               //.setColorBackground(color(0))
               ;

  myChart.addDataSet("sensor1");
  myChart.setData("sensor1", new float[500]);
  myChart.addDataSet("sensor2");
  myChart.setData("sensor2", new float[500]);
  myChart.setColors("sensor2",color(0, 150,0));    
  
  valores = new String[2];
  surface.setTitle("Graficas de Sensores - ESCALABLE");
  
  cp5.addSlider("slidersensor1")
     .setPosition(620,25)
     .setRange(0,255)
     .setHeight(15)
     ;
     
  cp5.addSlider("slidersensor2")
     .setPosition(620,100)
     .setRange(0,255)
     .setHeight(15)
     ;
}


void draw() {
  background(100);
  text("Interfaz desarrollada en:", 640, 230);
  text("ESCALABLE", 670, 250);
  while(port.available() > 0 )
  {    
    String valor = port.readString();
    valores = splitTokens(valor, ", ");    
  }
  println(valores);
  // unshift: add data from left to right (first in)
  //myChart.unshift("incoming", (sin(frameCount*0.1)*20));
  //println(valores[0]);
  //println(valores[1]);
  // push: add data from right to left (last in)
  myChart.push("sensor1", int(valores[0]));
  myChart.push("sensor2", int(valores[1]));
  
  cp5.getController("slidersensor1").setValue(int(valores[0]));
  cp5.getController("slidersensor2").setValue(int(valores[1]));
}

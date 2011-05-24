 /**
 *  Code by Krystof Pesek, licensed under Creative Commons Attribution-Share Alike 3.0 license.
 *  License: http://creativecommons.org/licenses/by-sa/3.0/
 *
 * visit more @ http://vimeo.com/kof
 * if you leave this header, bend, share, spread the code, it is a freedom!
 *
 *   ,dPYb,                  ,dPYb,
 *   IP'`Yb                  IP'`Yb
 *   I8  8I                  I8  8I
 *   I8  8bgg,               I8  8'
 *   I8 dP" "8    ,ggggg,    I8 dP
 *   I8d8bggP"   dP"  "Y8ggg I8dP
 *   I8P' "Yb,  i8'    ,8I   I8P
 *  ,d8    `Yb,,d8,   ,d8'  ,d8b,_
 *  88P      Y8P"Y8888P"    PI8"8888
 *                           I8 `8,
 *                           I8  `8,
 *                           I8   8I
 *                           I8   8I
 *                           I8, ,8'
 *                            "Y8P'
 *
 */

import processing.opengl.*;
import oscP5.*;
import netP5.*;

boolean debug = false;

String render = OPENGL;

int PORT = 10000;

float R = 20;

World world;
DataParser parser;
DataDump dumper;
ArrayList globNodes;

Receiver receiver;


void setup(){
    size(1920*2,1080,render);
    reset();
}

// make setup things here
void reset(){
    if(render == OPENGL) 
    hint(DISABLE_OPENGL_2X_SMOOTH);

    if(render == P2D)
    smooth();

    textFont(createFont("Verdana",7,false));
    
    if(render == P2D)
    textMode(SCREEN);
    

    //initialize world coordinates
    world = new World();

    //load default positions grid
    parser = new DataParser("foundation.2dg");
    
    //get nodes from parser
    globNodes = parser.getNodes();
    
    // init OSC listener class
    receiver = new Receiver(this,PORT);

    // init dump class
    dumper = new DataDump(globNodes,"output/testDump.txt");
}

void draw(){
    background(255);

    // world pre draw routine 
    world.preDraw();

    // draw nodes here

    for(int i = 0 ;i< globNodes.size();i++){
        Node tmp = (Node)globNodes.get(i);
        tmp.draw2D();
    }

    // world post draw routine
    world.postDraw();

}


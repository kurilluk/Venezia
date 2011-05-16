
//////////////// World class 

class World{
    PVector position;
    float scale;

    World(){
        position = new PVector(0,0,0);
        scale = 1.5;

    }

    void preDraw(){
        pushMatrix();
        translate(position.x,position.y);
        scale(scale);
    }

    void postDraw(){
        popMatrix();

    }

}


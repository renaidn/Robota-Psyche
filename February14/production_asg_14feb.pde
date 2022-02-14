Wolf[] wolves = new Wolf[20];
Alpha alpha;


void setup() {
    size(500, 500);

    for (int i = 0; i < wolves.length; i++) {
        //generating the wolves by giving them random location and positioning from alpha
        wolves[i] = new Wolf(random(0.6, 0.9), random(0.6, 0.9), random(width), random(height));
    }
    alpha = new Alpha();
}


class Alpha {
    PVector location;
    PVector velocity;
    int interval; //to change the direction in intervals
    boolean randomChange; //to randomly change the direction of the alpha, so he is not just bouncing off the walls

    Alpha() {
        location = new PVector(width/2, height/2);
        interval = frameCount;
        velocity = new PVector(3,4);
        randomChange = false;
    }

    //function for the wolves to follow the alpha
    void attract(Wolf wolf) {
        //for each wolf we give different rate of change and distacne from the leader/alpha
        wolf.velocity.x = (location.x * wolf.positionX - wolf.location.x) * 0.05 ;
        wolf.velocity.y = (location.y * wolf.positionY - wolf.location.y) * 0.05 ;
    }

    void update() {
        //location.x = mouseX;
        //location.y = mouseY;

        // change the direction of the alpha if the wall is met
         if (location.x < 0 || location.x > width) {
             velocity.x *= -1;
         }
         if (location.y < 0 || location.y > height) {
             velocity.y *= -1;
         }
         
         //allowing to change the direction only if the alpha is inside the boundaries and the interval is met
         //we are checking the interval by substracting the frameCount from the interval that checked the frameCount last time
         //the interval is set to 3 seconds.
         if (location.x > 0 && location.x < width && location.y > 0 && location.y < height && (frameCount -interval) > 180){
             randomChange = true;
         }
         if (randomChange) {
             //we are setting the velocity here, so it will be random between -3 and 3
             velocity.x = random(-3, 3);
             velocity.y = random(-3, 3);
             randomChange = false;
             interval = frameCount;
         }
         location.add(velocity);
    }

    void display() {
        update();
        stroke(0);
        fill(100, 100, 100);
        // Rotate the mover to point in the direction of travel
        // Translate to the center of the move
        pushMatrix();
        translate(location.x, location.y);
        rotate(velocity.heading());
        // It took lots of trial and error
        // and sketching on paper
        // to get the triangle
        // pointing in the right direction
        triangle(0, 5, 0, -5, 30, 0);
        popMatrix();
    }
}

class Wolf {

    PVector location;
    PVector velocity;
    float positionX;
    float positionY;
    //position is needed to make the pack not in one distance from alpha

    Wolf(float posX, float posY, float _x_, float _y_) {
        location = new PVector(_x_, _y_);
        velocity = new PVector(1, 1);
        positionX = posX;
        positionY = posY;
    }


    void update() {
        //updatin the location of the wolf by adding hte velocity
        location.add(velocity);
    }

    void display(Alpha alpha) {
        update();
        checkEdges();
        stroke(0);
        fill (0, 0, 255);

        // Rotate the mover to point in the direction of travel
        // Translate to the center of the move
        pushMatrix();
        translate(location.x, location.y);
        // so the pointer of the triangle is looking at the alpha, not on anything else
        PVector check = new PVector(alpha.location.x - location.x, alpha.location.y - location.y);
        rotate(check.heading());

        triangle(0, 5, 0, -5, 20, 0);
        popMatrix();
    }

    void checkEdges() {
        if (location.x > width) {
            location.x = width;
            velocity.x *= -1; // full change, opposite direction
            velocity.x *= 0.8; // lose a bit of energy in the bounce
          } else if (location.x < 0) {
            location.x = 0;
            velocity.x *= -1; // full change, opposite direction
            velocity.x *= 0.8; // lose a bit of energy in the bounce
          }
     
          if (location.y > height) {
            location.y = height;
            velocity.y *= -1; // full change, opposite direction
            velocity.y *= 0.8; // lose a bit of energy in the bounce
          } else if (location.y < 0) {
            location.y = 0;
            velocity.y *= -1; // full change, opposite direction
            velocity.y *= 0.8; // lose a bit of energy in the bounce
          }
    }
}

void draw() {
    background(255);

    for (int i = 0; i<wolves.length; i++) {
        alpha.attract(wolves[i]);
        wolves[i].display(alpha);
    }
    alpha.display();
}

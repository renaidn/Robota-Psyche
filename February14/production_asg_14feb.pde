Wolf[] wolves = new Wolf[3];
Alpha alpha;


void setup() {
    size(500, 500);

    for (int i = 0; i < wolves.length; i++) {
        //generating the wolves by giving them random location and speed
        wolves[i] = new Wolf(random(0.1, 1), random(width/2), random(height));
    }
    alpha = new Alpha();
}


class Alpha {
    PVector location;
    float gravity;
    float mass;
    PVector change;

    Alpha() {
        location = new PVector(width/2, height/2);

        mass = 50;
        gravity = 0.4;
        change = new PVector(3,4);
    }

    void attract(Wolf wolf) {
        PVector ch = new PVector(0,0);
        wolf.change = ch.add(change.x * random(0.8,1), change.y * random(0.2,1));
    }

    void update() {
        if (location.x < 0 || location.x > width) {
            change.x *= -1;
        }
        if (location.y < 0 || location.y > height) {
            change.y *= -1;
        }
        location.add(change);
    }

    void display() {
        update();
        stroke(0);
        fill(100, 100, 100);
        pushMatrix();
        translate(location.x, location.y);
        rotate(change.heading());
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
    PVector change;
    // float acceleration;
    float mass;
    float gravity;

    Wolf(float speed, float _x_, float _y_) {
        mass = 2;
        gravity = 0.4;
        location = new PVector(_x_, _y_);
        change = new PVector(speed, 1);
        // acceleration = new PVector(0, 0);
    } 

    void update() {
        location.add(change);
    }

    void display() {
        update();
        checkEdges();
        stroke(0);
        fill (0, 0, 255);

        // Rotate the mover to point in the direction of travel
        // Translate to the center of the move
        pushMatrix();
        translate(location.x, location.y);
        rotate(change.heading());
        // It took lots of trial and error
        // and sketching on paper
        // to get the triangle
        // pointing in the right direction
        triangle(0, 5, 0, -5, 20, 0);
        popMatrix();
    }

    void checkEdges() {
        if (location.x > width) {
            location.x = width;
            change.x *= -1; // full change, opposite direction
            change.x *= 0.8; // lose a bit of energy in the bounce
          } else if (location.x < 0) {
            location.x = 0;
            change.x *= -1; // full change, opposite direction
            change.x *= 0.8; // lose a bit of energy in the bounce
          }
      
          if (location.y > height) {
            location.y = height;
            change.y *= -1; // full change, opposite direction
            change.y *= 0.8; // lose a bit of energy in the bounce
          } else if (location.y < 0) {
            location.y = 0;
            change.y *= -1; // full change, opposite direction
            change.y *= 0.8; // lose a bit of energy in the bounce
          }
    }
}

void draw() {
    background(255);

    for (int i = 0; i<wolves.length; i++) {
        alpha.attract(wolves[i]);
        wolves[i].display();
    }
    alpha.display();
}

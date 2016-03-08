class Cell {
  int type = 0;
  int ypos = 0;
  int xpos = 0;
  
  Cell() {
    
  }
  
  Cell(int xpos, int ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
  }
  
  void update(int targetType, ArrayList<ArrayList<Cell>> grid) {
    
  }
  
  void display() {
    strokeWeight(3);
    stroke(255);
    point(xpos, ypos);
    strokeWeight(2);
  }
}

class Tree extends Cell {
  int updateDelay = 0;
  int growChance = 4;
  
  Tree(int xpos, int ypos) {
    super(xpos, ypos);
    type = 1;
  }
  
  Tree(int xpos, int ypos, int delay) {
    super(xpos, ypos);
    type = 1;
    updateDelay = delay;
  }
  
  void update(int targetType, ArrayList<ArrayList<Cell>> grid) {
    if (growChance > 0) {
      if (targetType == 1) {
        if (updateDelay == 0) {
          if (int(random(100)) < 25) {
            grow(xpos-1, ypos, 0, grid);
          }
          if (int(random(100)) < 25) {
            grow(xpos+1, ypos, 1, grid);
          }
          if (int(random(100)) < 25) {
            grow(xpos, ypos-1, 0, grid);
          }
          if (int(random(100)) < 25) {
            grow(xpos, ypos+1, 1, grid);
          }
          growChance--;
          updateDelay = int(random(0, 7));
        } else {
          updateDelay--;
        }
      }
    }
  }
  
  private void grow(int x, int y, int delay, ArrayList<ArrayList<Cell>> grid) {
    try {
      if (grid.get(y).get(x).type == 0) {
        grid.get(y).set(x, new Tree(x, y, delay));
        grid.get(y).get(x).display();
      }
    } catch (IndexOutOfBoundsException  e) {
    }
    
  }
  
  void display() {
    stroke(0, 200, 0);
    point(xpos, ypos);
  }
}

class Fire extends Cell {
  int updateDelay = 0;
  int life = 5;
  
  Fire(int xpos, int ypos) {
    super(xpos, ypos);
    type = 2;
  }
  
  Fire(int xpos, int ypos, int delay) {
    super(xpos, ypos);
    type = 2;
    updateDelay = delay;
  }
  
  void update(int targetType, ArrayList<ArrayList<Cell>> grid) {
    if (targetType == 2) {
      if (updateDelay == 0) {
        if (int(random(100)) < 50) {
          spread(xpos-1, ypos, 0, grid);
        }
        if (int(random(100)) < 50) {
          spread(xpos+1, ypos, 1, grid);
        }
        if (int(random(100)) < 50) {
          spread(xpos, ypos-1, 0, grid);
        }
        if (int(random(100)) < 50) {
          spread(xpos, ypos+1, 1, grid);
        }
        life--;
        if (life == 0) {
          grid.get(ypos).set(xpos, new Cell(xpos, ypos));
          grid.get(ypos).get(xpos).display();
        }
      } else {
        updateDelay--;
      }
    } 
  }
  
  private void spread(int x, int y, int delay, ArrayList<ArrayList<Cell>> grid) {
    try {
      if (grid.get(y).get(x).type == 1) {
        grid.get(y).set(x, new Fire(x, y, delay));
        grid.get(y).get(x).display();
      }
    } catch (IndexOutOfBoundsException  e) {
    }
    
  }
  
  void display() {
    stroke(200, 0, 0);
    point(xpos, ypos);
  }
}
ArrayList<ArrayList<Cell>> grid = new ArrayList<ArrayList<Cell>>(height);

void setup() {
  frameRate(30);
  size(512, 512);
  strokeWeight(2.0);
  background(255);
  
  for (int y = 0; y<height; y++) {
    grid.add(new ArrayList<Cell>(width));
  }
  
  for (int y = 0; y<height; y++) {
    for (int x = 0; x<width; x++) {
      grid.get(y).add(new Cell(x, y));
    }
  }
  
}

void draw() {
  for (ArrayList<Cell> y: grid) {
    for (Cell x: y) {
      x.update(2, grid);
    }
  }
  
  for (ArrayList<Cell> y: grid) {
    for (Cell x: y) {
      x.update(2, grid);
      x.update(1, grid);
    }
  }
  
  if (int(random(0, 100)) <= 2) {
    int x = int(random(0, width));
    int y = int(random(0, height));
    
    grid.get(y).set(x, new Tree(x, y));
  }
  
  if (int(random(0, 100)) <= 1) {
    int x = int(random(0, width));
    int y = int(random(0, height));
    
    grid.get(y).set(x, new Fire(x, y));
  }
}
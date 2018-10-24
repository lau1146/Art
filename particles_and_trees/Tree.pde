class Tree {
  
  ArrayList<Branch> tree;
  ArrayList<Leaf> leaves;
  
  Tree(PVector tposition, PVector tangle, float blength) {
    tree = new ArrayList<Branch>();
    leaves = new ArrayList<Leaf>();
    // A branch has a starting position, a starting "velocity", and a starting "timer" 
    Branch b = new Branch(tposition, tangle, blength);
    // Add to arraylist
    tree.add(b);
  }
  
  
  void display() {
    for (int i = tree.size()-1; i >= 0; i--) {
    // Get the branch, update and draw it
      Branch b = tree.get(i);
      b.update();
      b.render();
    // If it's ready to split
      if (b.timeToBranch()) {
        if (tree.size() < 1024) {
        //tree.remove(i);             // Delete it
          tree.add(b.branch( 30));   // Add one going right
          tree.add(b.branch(-25));   // Add one going left
        } 
        else {
          leaves.add(new Leaf(b.end));
        }
      }
    }
  
    for (Leaf leaf : leaves) {
       leaf.display(); 
    }
  }  
    
}
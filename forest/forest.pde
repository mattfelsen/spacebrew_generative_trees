int numberOfTrees = 6 ;
int depth = 10 ;
int trunkMinimumLength = 160 ;
int trunkMaximumLength = 240 ;
int treeSpacingVariation = 150 ;
int branchAngle = 45 ;
float branchReduction = 0.8;
int branchMinimumLength = 0 ;
int branchMaximumLength = 200 ;
void setup ( ) {
  size ( displayWidth, displayHeight ) ;
}
void draw ( ) {
  createForest ( ) ;
  noLoop ( ) ;
}
void mousePressed ( ) {
  createForest ( ) ;
}
void createForest ( ) {
  background ( 255 ) ;
  for ( int i = 0 ; i < numberOfTrees ; i++ ) {
    tree ( numberOfTrees, i );
  }
  redraw ( ) ;
}
void tree ( int treeCount , int currentTree ) {
  pushMatrix ( ) ;
  float trunkLength = random ( trunkMinimumLength, trunkMaximumLength ) ;
  translate ( width / ( treeCount + 1 ) * ( currentTree + 1 ) + random ( treeSpacingVariation ), height - trunkLength ) ;
  strokeWeight ( depth * 1.25 ) ;
  stroke ( 0 ) ;
  line ( 0, trunkLength, 0, 0 ) ;
  createBranch ( depth ) ;
  popMatrix ( ) ;
}
void createBranch ( int depth ) {
  pushMatrix ( ) ;
  rotate ( radians ( random ( 0, branchAngle ) ) ) ;
  extendBranch ( depth ) ;
  popMatrix ( ) ;
  rotate ( radians ( random ( -branchAngle , 0 ) ) );
  extendBranch ( depth ) ;
}
void extendBranch ( int depth ) {
  scale ( branchReduction ) ;
  int branchLength = ( int ) random ( branchMinimumLength , branchMaximumLength ) ;
  translate ( 0, -branchLength ) ;
  strokeWeight ( depth * 1.5 ) ;
  line ( 0, branchLength, 0, 0 );
  if ( depth > 0 ) createBranch ( depth - 1 ) ;
}
boolean sketchFullScreen ( ) {
  return true ;
}

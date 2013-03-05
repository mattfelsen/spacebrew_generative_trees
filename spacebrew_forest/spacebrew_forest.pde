import spacebrew.*;

String server="sandbox.spacebrew.cc";
String name="mattfelsen";
String description ="This is an example client which .... It also listens to...";

Spacebrew spacebrewConnection;

void clickRouteCallback( boolean value ){
  println("hey this is happening "+value);
  //createForest();
  tree ( 1, 1 );
}

void mousePressed() {
  spacebrewConnection.send( "mouseClick", true);
}

void onRangeMessage( String name, int value ){
  println("got int message "+name +" : "+ value);
}

void onBooleanMessage( String name, boolean value ){
  println("got bool message "+name +" : "+ value);  
}

void onStringMessage( String name, String value ){
  println("got string message "+name +" : "+ value);  
}


int numberOfTrees = 1 ;
int depth = 10 ;
int trunkMinimumLength = 160 ;
int trunkMaximumLength = 240 ;
int treeSpacingVariation = 800 ;
int branchAngle = 45 ;
float branchReduction = 0.8;
int branchMinimumLength = 0 ;
int branchMaximumLength = 200 ;
void setup ( ) {
  size ( displayWidth, displayHeight ) ;
  
  spacebrewConnection = new Spacebrew( this );
  
  // add each thing you publish to
  spacebrewConnection.addPublish( "mouseClick", false ); 

  // add each thing you subscribe to
  // pass in a name to a function you want to use as a callback
  spacebrewConnection.addSubscribe( "wasClicked", "clickRouteCallback", "boolean" );
  spacebrewConnection.addSubscribe( "wasClicked", "clickRouteCallback", "boolean" );
  
  // add a subscriber w/o a callback
  spacebrewConnection.addSubscribe( "anotherBoolean", "boolean" );
  
  // connect!
  spacebrewConnection.connect("ws://"+server+":9000", name, description );
  
}
void draw ( ) {
  createForest ( ) ;
  noLoop ( ) ;
}
//void mousePressed ( ) {
//  createForest ( ) ;
//}
void createForest ( ) {
  //background ( 255 ) ;
  for ( int i = 0 ; i < numberOfTrees ; i++ ) {
    tree ( numberOfTrees, i );
  }
  redraw ( ) ;
}
void tree ( int treeCount , int currentTree ) {
  pushMatrix ( ) ;
  float trunkLength = random ( trunkMinimumLength, trunkMaximumLength ) ;
  translate (  random ( treeSpacingVariation ), height - trunkLength ) ;
  strokeWeight ( depth * 1.25 ) ;
  stroke ( 0 ) ;
  line ( 0, trunkLength, 0, 0 ) ;
  createBranch ( depth ) ;
  popMatrix ( ) ;
  redraw();
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

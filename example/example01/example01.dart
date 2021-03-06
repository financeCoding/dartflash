library example01;

import 'dart:html' as html;
import 'package:dartflash/dartflash.dart';

void main() {

  // The Stage is the root of the display list.
  var canvas = html.query('#stage');
  var stage = new Stage('myStage', canvas);

  // The RenderLoop controls the flow of the program
  var renderLoop = new RenderLoop();
  renderLoop.addStage(stage);

  // Add a modern art painting to the Stage. Afterwards the painting
  // is a child of the stage and part of the display list.
  var painting = new Painting();
  painting.x = 40;
  painting.y = 40;
  stage.addChild(painting);
}

class Painting extends DisplayObjectContainer {

  final List<int> colors = [Color.Red, Color.Green, Color.Blue, Color.Brown];

  Painting() {

    // The background of the painting is 400x300 pixels in size and  
    // filled wit the color 'BlanchedAlmond'.
    var background = new BitmapData(400, 300, false, Color.BlanchedAlmond);
    var backgroundBitmap = new Bitmap(background);
    addChild(backgroundBitmap);

    // Draw 4 boxes. Each box is a little bit shifted to the 
    // bottom right relative to it's predecessor.
    for(var i = 0; i < colors.length; i++) {
      var box = new BitmapData(100, 100, false, colors[i]);
      var boxBitmap = new Bitmap(box);
      boxBitmap.x = 80 + i * 50;
      boxBitmap.y = 60 + i * 30;
      addChild(boxBitmap);
    }
  }
}



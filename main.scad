include <config.scad>
use <modules/explode.scad>
use <leg.scad>

show_exploded = false;

explode([10,6,4], false, show_exploded) {
  // top
  color("red") {
    echo("<PART> top width=", top_width, " depth=", top_depth, " thickness=", top_thickness);
    translate([0,0,top_height - top_thickness]) {
      cube([top_width, top_depth, top_thickness]);
    }
  }
  // subtop
  color("orange") {
    echo("<PART> sub-top width=", subtop_width, " depth=", subtop_depth, " thickness=", top_thickness);
    translate([leg_setback,leg_setback,top_height - ((top_thickness * 2) + subtop_opening)]) {
      cube([subtop_width, subtop_depth, top_thickness]);
    }
  }
  // lower shelf
  color("yellow") {
    echo("<PART> shelf width=", subtop_width, " depth=", subtop_depth, " thickness=", top_thickness);
    translate([leg_setback,leg_setback,shelf_height]) {
      cube([subtop_width, subtop_depth, top_thickness]);
    }
  }
  // left front leg
  color("blue") {
    translate([leg_setback,leg_setback,0]) {
      leg();
    }
    // right front leg
    translate([top_width - (leg_setback + leg_width),leg_setback,0]) {
      leg();
    }
    // left rear leg
    translate([leg_setback,top_depth - (leg_setback + leg_depth),0]) {
      leg();
    }
    // right rear leg
    translate([top_width - (leg_setback + leg_width),top_depth - (leg_setback + leg_depth),0]) {
      leg();
    }
  }
}

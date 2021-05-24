include <config.scad>
use <modules/explode.scad>
use <leg.scad>
use <panel.scad>

show_exploded = false;
show_panels = true;

explode([10,6,4], false, show_exploded) {
  // top
  color("red") {
    echo("<PART> top width=", top_width, " depth=", top_depth, " thickness=", top_thickness);
    translate([0,0,top_height - top_thickness]) {
      cube([top_width, top_depth, top_thickness]);
    }
  }
  // subtop
  subtop_height = top_height - ((top_thickness * 2) + subtop_opening);
  color("orange") {
    echo("<PART> sub-top width=", subtop_width, " depth=", subtop_depth, " thickness=", top_thickness);
    translate([leg_setback + rail_stile_thickness,leg_setback,subtop_height]) {
      cube([subtop_width, subtop_depth, top_thickness]);
    }
  }
  // lower shelf
  color("yellow") {
    echo("<PART> shelf width=", subtop_width, " depth=", subtop_depth, " thickness=", top_thickness);
    translate([leg_setback + rail_stile_thickness,leg_setback,shelf_height]) {
      cube([subtop_width, subtop_depth, top_thickness]);
    }
  }
  // legs
  color("blue") {
    // left front leg
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
  if(show_panels == true) {
    // left panel
    side_panel_width = top_depth - (leg_setback * 2) - (leg_depth * 2);
    panel_height = subtop_height - shelf_height + top_thickness;
    translate([leg_setback,leg_setback + leg_depth + side_panel_width,shelf_height]){
      rotate([0,0,-90]){
        panel("leftPanel", panel_height, side_panel_width);
      }
    }
    // right panel
    translate([top_width - leg_setback,leg_setback + leg_depth,shelf_height]){
      rotate([0,0,90]){
        panel("rightPanel", panel_height, side_panel_width);
      }
    }
    // back panel
    back_panel_width = top_width - (leg_setback * 2) - (leg_depth * 2);
    translate([leg_setback + leg_width + back_panel_width,top_depth - leg_setback,shelf_height]){
      rotate([0,0,180]){
        panel("backPanel", panel_height, back_panel_width);
      }
    }
  }
}

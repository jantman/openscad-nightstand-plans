use <railstile.scad>

module panel(name, height, width)
{
  include <config.scad>
  rail_length = width - (rail_stile_width * 2);
  echo(str("PART ", name, " panel width=", width, " height=", height));
  // left stile
  railstile(str(name, " left stile"), height);
  // right stile
  translate([rail_length + rail_stile_width,0,0]) {
    railstile(str(name, " right stile"), height, right_dado = false);
  }
  // bottom rail
  translate([rail_stile_width + rail_length,0,0]){
    rotate([0,-90,0]){
      railstile(str(name, " bottom rail"), rail_length);
    }
  }
  // top rail
  translate([rail_stile_width + rail_length,0,height - rail_stile_width]){
    rotate([0,-90,0]){
      railstile(str(name, " bottom rail"), rail_length, right_dado = false);
    }
  }
  // plywood
  ply_undersize = (rail_stile_width * 2) + (panel_dado_depth * 1.5);
  ply_height = height - ((rail_stile_width - panel_dado_depth) * 2);
  ply_width = width - ((rail_stile_width - panel_dado_depth) * 2);
  echo(str("PART ", name, " plywood height=", ply_height, " width=", ply_width));
  color("brown"){
    translate([rail_stile_width - panel_dado_depth, panel_dado_setback, rail_stile_width - panel_dado_depth]) {
      cube([ply_width,panel_plywood_thickness,ply_height]);
    }
  }
}

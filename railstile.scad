module railstile(name, length, right_dado = true) {
  include <config.scad>
  dado_x = right_dado ? rail_stile_width - panel_dado_depth : 0;
  dado_side = right_dado ? "right" : "left";
  echo(str("PART ", name, " width=", rail_stile_width, " thickness=", rail_stile_thickness, " length=", length, " dado side=", dado_side));
  difference() {
    cube([rail_stile_width, rail_stile_thickness, length]);
    // dado
    translate([dado_x,panel_dado_setback,0]) {
      cube([panel_dado_depth, panel_plywood_thickness, length]);
    }
  }
}

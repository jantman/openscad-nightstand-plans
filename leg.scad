module leg()
{
  include <config.scad>

  echo("<PART> leg length=", leg_length, " depth=", leg_depth, " width=", leg_width);
  cube([leg_width, leg_depth, leg_length]);
}

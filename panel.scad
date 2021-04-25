module panel(name, height, width)
{
  include <config.scad>

  echo("<PART> ", name, " panel width=", width, " height=", height);
  // left
  cube([leg_width, leg_depth, leg_length]);
}

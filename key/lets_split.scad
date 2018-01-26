/*use <key.scad>*/
// NEED to include, not use this, even with the default variables set. don't know why
include <keys.scad>

lets_split = [
  [1,1,1,1,1,1],
  [1,1,1,1,1,1],
  [1,1,1,1,1,1],
  [1,1,1,1,1,1],
];

function sum(list, x=0) =
  len(list) <= 1 ?
    x + list[0] :
    sum([for (x = [1: len(list) - 1]) list[x]], x+list[0]);

for (row = [0:len(lets_split)-1]) {
  for(column = [0:len(lets_split[row])-1]) {
    columnDist = sum([for (x = [0 : column]) lets_split[row][x]]);
    a = lets_split[row][column];
    translate_u(columnDist - (a/2), -row) sa_row(row+2) u(a) cherry() key();
  }
}

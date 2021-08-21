w = 2000;
h = 0.1*w;

Point(1) = {0, 0,    0, 0.1};
Point(2) = {w, 0,    0, 0.1};
Point(3) = {0, w, 0, 0.1};
Point(4) = {w, w, 0, 0.1};

Line(1) = {1, 2};
Line(2) = {2, 4};
Line(3) = {4, 3};
Line(4) = {3, 1};
Line Loop(5) = {1, 2, 3, 4};
Plane Surface(6) = {5};
Extrude {0, 0, h} {
  Surface{6};
  Layers{1};
  Recombine;
}
Line Loop(29) = {10, 11, 8, 9};
Plane Surface(30) = {29};
Plane Surface(31) = {5};
Line Loop(32) = {22, 11, -13, -4};
Plane Surface(33) = {32};
Line Loop(34) = {10, -22, -3, 18};
Plane Surface(35) = {34};
Line Loop(36) = {8, -14, -1, 13};
Plane Surface(37) = {36};
Line Loop(38) = {2, 18, -9, -14};
Plane Surface(39) = {38};
Surface Loop(40) = {23, 27, 15, 28, 6, 19};
Volume(41) = {40};
Physical Surface("walls") = {27, 15, 19};
Physical Surface("moving-wall") = {23};
Physical Surface("front-n-bottom") = {28, 6};
Physical Volume("cavity") = {1};

Transfinite Line {1, 2, 3, 4, 8, 9, 10, 11} = 10*w;
Transfinite Surface "*";
Recombine Surface "*";
Transfinite Volume "*";
Recombine Volume "*";

// Mesh 3;
// Save "cavity.msh";

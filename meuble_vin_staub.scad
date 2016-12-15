height = 880;
widht = 450;
lenght = 400;

thickness = 18;

angle = 30;

shelf_widht = widht / cos(angle);

nb_of_shelf = shelf_widht / 95;

sperator_height = 25;

difference(){
    cube([widht, lenght, height], true);
    cube([widht - thickness*2, 500, height - thickness*2], true);
}


difference(){
for ( i = [0:1:6])
 translate([0, 0, i*95/cos(angle)])shelf();

translate([0, 0, 327])cube([widht - thickness*2, 500, 250], true);
}



 module shelf(){
translate([0, 0, -height/2])
rotate ([0,angle,0])
    union(){
        cube([shelf_widht, lenght, thickness], true);
     
     for (i = [0 : 1 : nb_of_shelf])
        translate([-95 * i, 0, 0])
        translate([shelf_widht / 2, 0, thickness])
            cube([thickness, lenght, sperator_height ], true);
    }    
    
}

translate([0, 0, height / 2 -250])cube([widht, lenght, thickness], true);

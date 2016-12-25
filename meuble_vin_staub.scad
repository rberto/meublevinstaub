height = 880;
widht = 450;
lenght = 400;

thickness = 22;

angle = 30;

shelf_widht = widht / cos(angle);
echo("Longueur total sans separateur : ", shelf_widht * 6 + widht + height *2 + widht * 2, "mm");
echo("Nb d'étagere : ", 6);

nb_of_shelf = shelf_widht / 95;

sperator_height = 25;

// Outside frame.
difference(){
    cube([widht, lenght, height], true);
    inside_of_cabinet();
}

// Intersection that will delete all part of the shalfs that are outside the cabnet.
intersection(){

    // difference that will delete shelfs in the glass compartment.
    difference(){
        shelfs(6);
        translate([0, 0, 327])cube([widht - thickness*2, 500, 250], true);
    };
    inside_of_cabinet();
}

module inside_of_cabinet(){
    cube([widht - thickness*2, 500, height - thickness*2], true);
    }

module shelfs(nb) {
    for (i = [0:1:nb])
            translate([0, 0, i*95/cos(angle)])shelf();
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

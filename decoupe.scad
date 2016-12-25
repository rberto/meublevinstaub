slab_widht = 1100;
slab_lenght = 4500;
module slab(){
cube([slab_widht, slab_lenght / 2, 22]);
    translate([slab_widht + 20, 0, 0])cube([slab_widht, slab_lenght / 2, 22]);
}
module portant(){
    cube([400, 880, 24]);
    }
    
module horizontaux(){
    cube([450, 400, 24]);
    }
    
 module shelf(){
     angle = 30;
     shelf_widht = 450 / cos(angle);
    cube([shelf_widht, 400, 24]); 
     }
     
 difference(){
     slab();
     // les deux porant 
     portant();
     translate([420, 0,0])portant();
     // le haut et bas
     translate([0, 900,0])horizontaux();
     translate([470, 900,0])horizontaux();
     // separation pour verrres
     translate([0, 1320,0])horizontaux();
     // etagere
     translate([470, 1320,0])shelf();
     translate([slab_widht + 20 +0, 0, 0])shelf();
     translate([slab_widht + 20 + 540, 0,0])shelf();
     translate([slab_widht + 20 + 0, 420,0])shelf();
     translate([slab_widht + 20 + 540, 420,0])shelf();
     translate([slab_widht + 20 + 0, 420*2,0])shelf();
     translate([slab_widht + 20 + 540, 420*2,0])shelf();
     }
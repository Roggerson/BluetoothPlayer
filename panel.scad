use <boxes.scad>

l=247.5;

difference(){
    echo(l+28);
    union(){
        hull(){
            translate([(l/2),30,0.5]) cube([272,6,1],center=true);
            translate([(l/2),30,0.5]) cube([272,6,1],center=true);
            translate([(l/2),30,0.5]) cube([271.5,6,1],center=true);
            translate([(l/2),45,0.5]) cube([269,6,1],center=true);
            translate([(l/2),50,0.5]) cube([268,6,1],center=true);
            translate([(l/2),60,0.5]) cube([265,6,1],center=true);
            translate([(l/2),70,0.5]) cube([262,6,1],center=true);
            translate([(l/2),90,0.5]) cube([254,6,1],center=true);
            translate([(l/2),93,0.5]) cube([252,6,1],center=true);
            translate([(l/2),96,0.5]) cube([249,6,1],center=true);
          
            #translate([0,0,0]) cylinder(r=14,h=1,$fn=100);
          
            //oben li
            translate([l,0,0]) cylinder(r=14,h=1,$fn=100);

            //unten re
            translate([15,93+4,0]) cylinder(r=14,h=1,$fn=100);

            //unten li
            translate([15+217.5,93+4,0]) cylinder(r=14,h=1,$fn=100);
           
            difference(){
                translate([l/2,41.5+8,0.5]) cube([10,130,1],center=true);
                translate([l/2,130+41.5-2+8,0]) cube([10,130,3],center=true);
            }
        }
    }
    //Raspi Display cutout
translate([l/2,93/2+1,0.5]) rotate([0,0,90]) roundedBox([112,194,4],8, true); 
    /*hull(){
        translate([0,0,0]) cube([3,3,3],center=true);
        translate([l,0,0])cube([3,3,3],center=true);
        translate([15,93+4,0])cube([3,3,3],center=true);
        translate([15+217.5,93+4,0])cube([3,3,3],center=true);
    }*/
}

//color("blue") translate([l/2,0,0]) cube([l,20,3],center = true);
/*
//oben re
translate([0,0,0]) cylinder(r=14,h=1,$fn=100);

//oben li
translate([l,0,0]) cylinder(r=14,h=1,$fn=100);

//unten re
translate([15,93,0]) cylinder(r=14,h=1,$fn=100);

//unten li
translate([15+217.5,93,0]) cylinder(r=14,h=1,$fn=100);


*/
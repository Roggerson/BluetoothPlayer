use <boxes.scad>


module rounded_cylinder(r,h,n) {
  rotate_extrude(convexity=1) {
    offset(r=n) offset(delta=-n) square([r,h]);
    square([n,h]);
  }
}

l=247.5; hf=8; h=1;
r=2;
g = 0.8;


translate([-2,+0.625,-0.5-2.5]) union(){
        *color("red") translate([194/4+12+194/2-(11.89+20)+0.15,93/2+1-(112/2-21.58)+2,h+3]) cube([194,5,h],center=true);
        *color("red") translate([194/4+12+194/2-(11.89+20)+0.15,93/2+1-(112/2-21.58)+65.65/2+1,h+3]) cube([5,112,h],center=true);

        //mark left
        //color("red") translate([l/2+194/2-(11.89+20)+10,93/2+1-(112/2-21.58),2]) cube([1,1,h],center=true);

        //holes
       difference(){

        //Balken und Verbindung zu rahmen links
            union(){
            translate([188.86,46.08,0.5]) cube([10,115,4],center=true); 
            difference(){
                translate([188.86, -8.4, 3]) rotate([-45,0,0])cube([10,10,11.2],center=true);
                translate([188.86, -8.4, 10]) cube([12,10,10],center=true);
                translate([188.86, -17.4, 2]) cube([12,10,10],center=true);
                translate([188.86, -10.4, -6.5]) cube([12,10,10],center=true);
                //Raspi Display cutout
                translate([l/2,93/2+1-0.625,hf/2+2.5]) rotate([0,0,90]) roundedBox([112,193.5,hf],8, true); //gesamte platz fürs display  
            }
            
            mirror([0,1,0])translate([0,-93.76,0]) difference(){
                translate([188.86, -8.4, 3]) rotate([-45,0,0])cube([10,10,11.2],center=true);
                translate([188.86, -8.4, 10]) cube([12,10,10],center=true);
                translate([188.86, -17.4, 2]) cube([12,10,10],center=true);
                translate([188.86, -10.4, -6.5]) cube([12,10,10],center=true);
                //Raspi Display cutout
                translate([l/2,93/2+1-0.625,hf/2+2.5]) rotate([0,0,90]) roundedBox([112,193.5,hf],8, true); //gesamte platz fürs display  
                }
            
        
        //Balken und Verbindung zu rahmen rechts
            
            mirror([0,1,0])translate([-126.2,-93.76,0]) difference(){
                translate([188.86, -8.4, 3]) rotate([-45,0,0])cube([10,10,11.2],center=true);
                translate([188.86, -8.4, 10]) cube([12,10,10],center=true);
                translate([188.86, -17.4, 2]) cube([12,10,10],center=true);
                translate([188.86, -10.4, -6.5]) cube([12,10,10],center=true);
                //Raspi Display cutout
                translate([l/2,93/2+1-0.625,hf/2+2.5]) rotate([0,0,90]) roundedBox([112,193.5,hf],8, true); //gesamte platz fürs display  
            }
            
            translate([62.66,46.08,0.5]) cube([10,115.5,4],center=true);
            translate([-126.2,0,0])difference(){
                translate([188.86, -8.4, 3]) rotate([-45,0,0])cube([10,10,11.2],center=true);
                translate([188.86, -8.4, 10]) cube([12,10,10],center=true);
                translate([188.86, -17.4, 2]) cube([12,10,10],center=true);
                translate([188.86, -10.4, -6.5]) cube([12,10,10],center=true);
                //Raspi Display cutout
                translate([l/2,93/2+1-0.625,hf/2+2.5]) rotate([0,0,90]) roundedBox([112,193.5,hf],8, true); //gesamte platz fürs display  
                }
            }
            d1=3.2;
            translate([l/2+65.11,93/2-33.42,h/2-5]) cylinder(d=d1,h=10,$fn=100);
            translate([l/2+65.11-126.2,93/2-33.42,h/2-5]) cylinder(d=d1,h=10,$fn=100);
            translate([l/2+65.11-126.2,93/2+1-(112/2-21.58)+65.65,h/2-5]) cylinder(d=d1,h=10,$fn=100);
            translate([l/2+65.11,93/2+1-(112/2-21.58)+65.65,h/2-5]) cylinder(d=d1,h=10,$fn=100);
        }
        
        
        
        //?*translate([l/2-126.2+194/2-(11.89+20),93/2+1-(112/2-21.58)+1+32,h+hf+1.5-8.5]) cube([5,115.5,h],center=true);
        
        
//        //11.9+20  nach innen
//        //21.58 nach unten
//
//        translate([194/4+12+194/2-(11.89+20)+0.15,93/2+1-(112/2-21.58)+65.65,h]) cube([126.2+5,5,h],center=true);
//        translate([194/4+12+194/2-(11.89+20)+0.15,93/2+1-(112/2-21.58),h]) cube([126.2+5,5,h],center=true);
//
//      
//
//        //li oben
//        color("blue") translate([l/2+194/2-(11.89+20),93/2+1-(112/2-21.58)-2.5-21.58-g,h+6.5/2+2.5/2]) cube([5,5,h+6.5+2.5],center=true);
//        translate([l/2+194/2-(11.89+20),93/2+1-(112/2-21.58)+32+1-25,h]) cube([5,65.5,h],center=true);
//
//        translate([l/2+194/2-(11.89+20)+2.5+20-15,93/2+1-(112/2-21.58),h]) cube([55,5,h],center=true);
//        color("blue") translate([g+l/2+194/2-(11.89+20)+2.5+20,93/2+1-(112/2-21.58),h+4.56/2+2.5/2]) cube([5,5,h+4.56+2.5],center=true);
//        color("blue") translate([g+l/2+194/2-(11.89+20)+2.5+20+12.5,93/2+1-(112/2-21.58),h+6.5/2+2.5/2]) cube([5,5,h+6.5+2.5],center=true);
//        //+2.5+20+11.9
//
//        //re oben
//        color("blue") translate([l/2+194/2-(11.89+20)-126.2,93/2+1-(112/2-21.58)-2.5-21.58-g,h+6.5/2+2.5/2]) cube([5,5,h+6.5+2.5],center=true);
//        translate([l/2+194/2-(11.89+20)-126.2,93/2+1-(112/2-21.58)+32+1-25,h]) cube([5,65.5,h],center=true);
//
//        translate([-140+l/2+194/2-(11.89+20)+2.5+20-15,93/2+1-(112/2-21.58),h]) cube([55,5,h],center=true);
//        color("blue") translate([-g+l/2+194/2-(11.89+20)-126.2-2.5-20,93/2+1-(112/2-21.58),h+5.16/2+2.5/2]) cube([5,5,h+5.16+2.5],center=true);
//        color("blue") translate([-g+l/2+194/2-(11.89+20)-126.2-35,93/2+1-(112/2-21.58),h+6.5/2+2.5/2]) cube([5,5,h+6.5+2.5],center=true);
//
//        //re unten
//        //3.5 schwarz schmal unten
//        //20vom loch bis grau ende
//
//        color("blue") translate([l/2+194/2-(11.89+20)-126.2,93/2+1-(112/2-21.58)+2.5+65.65+20+3.5+g,h+6.5/2+2.5/2]) cube([5,5,h+6.5+2.5],center=true);
//        translate([l/2+194/2-(11.89+20)-126.2,50+93/2+1-(112/2-21.58)+32+1-25,h]) cube([5,65.5,h],center=true);
//
//        translate([-140+l/2+194/2-(11.89+20)+2.5+20-15,93/2+1-(112/2-21.58)+65.65,h]) cube([55,5,h],center=true);
//        color("blue") translate([-g+l/2+194/2-(11.89+20)-126.2-2.5-20,93/2+1-(112/2-21.58)+65.65,h+5.16/2+2.5/2]) cube([5,5,h+5.16+2.5],center=true);
//        //color("blue") translate([-g+l/2+194/2-(11.89+20)-126.2-2.5-20-11.9,93/2+1-(112/2-21.58)+65.65,h+6.5/2+2.5/2]) cube([5,5,h+6.5+2.5],center=true);
//        color("blue") translate([-g+l/2+194/2-(11.89+20)-126.2-35,93/2+1-(112/2-21.58)+65.65,h+6.5/2+2.5/2]) cube([5,5,h+6.5+2.5],center=true);
//
//
//        //li unten
//        color("blue") translate([126.2+l/2+194/2-(11.89+20)-126.2,93/2+1-(112/2-21.58)+2.5+65.65+20+3.5+g,h+6.5/2+2.5/2]) cube([5,5,h+6.5+2.5],center=true);
//        translate([126.2+l/2+194/2-(11.89+20)-126.2,50+93/2+1-(112/2-21.58)+32+1-25,h]) cube([5,65.5,h],center=true);
//
//        translate([l/2+194/2-(11.89+20)+2.5+20-15,93/2+1-(112/2-21.58)+65.65,h]) cube([55,5,h],center=true);
//        color("blue") translate([g+l/2+194/2-(11.89+20)+2.5+20,93/2+1-(112/2-21.58)+65.65,h+4.56/2+2.5/2]) cube([5,5,h+4.56+2.5],center=true);
//        //color("blue") translate([g+l/2+194/2-(11.89+20)+2.5+20+11.9,93/2+1-(112/2-21.58)+65.65,h+6.5/2+2.5/2]) cube([5,5,h+6.5+2.5],center=true);
//        color("blue") translate([g+l/2+194/2-(11.89+20)+2.5+20+12.5,93/2+1-(112/2-21.58)+65.65,h+6.5/2+2.5/2]) cube([5,5,h+6.5+2.5],center=true);
}

//
//
//translate([-2,+0.625,-3]) union(){
//    //holes
//    
//    color("blue") translate([l/2+194/2-(11.89+20),47.5-(112/2-21.58),h/2])cylinder(d=2,h=h+r,$fn=100);
//    color("blue") translate([l/2+194/2-(11.89+20)-126.2,47.5-(112/2-21.58),h/2])cylinder(d=2,h=h+r,$fn=100);
//    color("blue") translate([l/2+194/2-(11.89+20),47.5-(112/2-21.58)+65.65,h/2])cylinder(d=2,h=h+r,$fn=100);
//    color("blue") translate([l/2+194/2-(11.89+20)-126.2,47.5-(112/2-21.58)+65.65,h/2]) cylinder(d=2,h=h+r,$fn=100);
//
//    *translate([0,0,hf-h]) union(){
//        color("red") translate([l/2+65.11,13.08+65.65/2,h/2+3-8.5+2.5])cube([5,115,h],center=true);
//        color("red") translate([l/2+65.11-126.2,13.08+65.65/2,h/2+3-8.5+2.5])cube([5,115,h],center=true);
//    }
//}


difference(){
    union(){
        hull(){    
            translate([l-2,30,0])rounded_cylinder(r=14,h=hf,n=2,$fn=100);
            translate([l-3.3,45,0])rounded_cylinder(r=14,h=hf,n=2,$fn=100);
            translate([l-3.8,50,0])rounded_cylinder(r=14,h=hf,n=2,$fn=100);
            translate([l-5.4,60,0])rounded_cylinder(r=14,h=hf,n=2,$fn=100);
            translate([l-6.8,70,0])rounded_cylinder(r=14,h=hf,n=2,$fn=100);
            translate([l-8,80,0])rounded_cylinder(r=14,h=hf,n=2,$fn=100);
            translate([l-9.2,85,0])rounded_cylinder(r=14,h=hf,n=2,$fn=100);
            translate([l-11,90,0])rounded_cylinder(r=14,h=hf,n=2,$fn=100);
            
            translate([2,30,0])rounded_cylinder(r=14,h=hf,n=2,$fn=100);
            translate([3.3,45,0])rounded_cylinder(r=14,h=hf,n=2,$fn=100);
            translate([3.8,50,0])rounded_cylinder(r=14,h=hf,n=2,$fn=100);
            translate([5.4,60,0])rounded_cylinder(r=14,h=hf,n=2,$fn=100);
            translate([6.8,70,0])rounded_cylinder(r=14,h=hf,n=2,$fn=100);
            translate([8,80,0])rounded_cylinder(r=14,h=hf,n=2,$fn=100);
            translate([9.2,85,0])rounded_cylinder(r=14,h=hf,n=2,$fn=100);
            translate([11,90,0])rounded_cylinder(r=14,h=hf,n=2,$fn=100);
           
          
            //oben re
            translate([0,0,0]) rounded_cylinder(r=14,h=hf,n=2,$fn=100);
          
            //oben li
            translate([l,0,0]) rounded_cylinder(r=14,h=hf,n=2,$fn=100);

            //unten re
            translate([15,93+4,0]) rounded_cylinder(r=14,h=hf,n=2,$fn=100);

            //unten li
            translate([15+217.5,93+4,0]) rounded_cylinder(r=14,h=hf,n=2,$fn=100);
           
            translate([l/2,41.5+8-60.5,0]) rounded_cylinder(r=5,h=hf,n=2,$fn=100);
            translate([l/2,41.5+8+60,0]) rounded_cylinder(r=5,h=hf,n=2,$fn=100);

        }
    }
    //Raspi Display cutout
    translate([l/2,93/2+1,hf/2]) rotate([0,0,90]) roundedBox([112,193.5,hf+5],8, true); //gesamte platz fürs display
    //smaller = 5;
    //translate([l/2,93/2+1,h/2]) rotate([0,0,90]) roundedBox([112-smaller,194-smaller,h+5],8, true);    //erstellt rahmen damit display nicht nach vor fällt
    translate([l/2,93/2+1,-hf/2+2]) rotate([0,0,90]) cube([150,300,hf],center=true);
    
    translate([15,16.25,-8.6-0.5]) rotate([90,0,90]) cube([26,33,8.5],true); //SD Slot
    translate([15,16.25-4.25+3.5,0]) rotate([90,0,90]) cube([15,33,2.5],true); //SD Slot Front
    
    difference(){
        union(){
            translate([-11,0,0]) difference(){
                translate([15,16.25-4.25+3.5,0]) cylinder(d=30,h=10,$fn=100);
                translate([15-3,16.25-4.25+3.5,0]) cube([30,30,30],center=true);
            }
            mirror([1,0,0]) translate([-41,0,0]) difference(){
                translate([15,16.25-4.25+3.5,0]) cylinder(d=30,h=10,$fn=100);
                translate([15-3,16.25-4.25+3.5,0]) cube([30,30,30],center=true);
            }
        }
        
        translate([15+3,16.25-23.25,-8.9-1+0.3+15]) cube([30,30,10],center=true);
        translate([15+3,16.25+21.75,-8.9-1+0.3+15]) cube([30,30,10],center=true);
    }
}


//color("lime") translate([0,0,7.5+1]) cube([5,5,15],true);



w = 37.5;
d = 24;
h = 1.6;
r = 1;
$fn = $preview ? 32 : 64;


t = 3 * .45; // thickness of walls
c = .2; // clearance
case =  t*2 + c*2;
ch = 6 + h + t; // - (r+t+c);


cube_w = 9;
cube_d = 3.7;
cube_h = 3.7;

button_w = 11;
button_d = 8.5;
button_h = 2;
button_r = button_d/2;
button_s = 2;
button_c = 1.8;
	

if($preview) {

	// PCB
	color("green")
	difference() {		
		rounded_box(w,d,h,r);
		
		translate([-w/2 + (w-35), -d/2 + 2.5, -1])
		cylinder(h+2, 1.1, 1.1);
		
		translate([-w/2 + (w-35) + 19, -d/2 + 2.5 + 19, -1])
		cylinder(h+2, 1.1, 1.1);
	}
	
	jack();
	
	// switch cutout
	translate([-cube_w/2 + w/2 -29.25,-cube_d/2 -d/2 +7.75, h]) 
	cube([cube_w,cube_d,cube_h]);
}

if(1) {

	color ([1,1,1,.3])
	// button
	translate([ button_s/2 + w/2 -29.25,-d/2 +7.75, h + cube_h]) {

		difference() {
			union() {
				rounded_box(button_w,button_d,button_h,button_r);
				
				translate([0,0,button_h])
				sphere(button_s);
			}
			
			
			translate([-button_c/2,-button_c/2,-1])
			cube([button_c, button_c, button_h + button_s/2 + 1]);
		}
	}
	 
}

// case
if (1)
color ([.1,.1,.1,.5]) {
	union () {

		difference() {

			union() {
				rounded_box(w + case, d + case, ch, r+ case/2);
				
				if (0) {
				// cylinder();
				translate([-w/2 + r, -d/2 + r, ch])
				sphere(r+case/2);
				
				translate([-w/2 + r, d/2 - r, ch])
				sphere(r+case/2);
				
				translate([-w/2  + r, d/2 - r, ch])
				rotate([0,90,0])
				cylinder(w, r+case/2, r+case/2);

				translate([-w/2  + r, -d/2 + r, ch])
				rotate([0,90,0])
				cylinder(w, r+case/2, r+case/2);

				translate([
					-(w + case)/2 +(r+t+c), 
					+(d + case)/2 -(r+t+c),
					ch
					])
				rotate([90,0,0])
				cylinder((d + case) - 2* (r+t+c) , r+case/2, r+case/2);

				}			
			}
			
			pill_w = 12;
			pill_r = 4;
			translate([pill_w/2 + w/2 -29.25, -d/2 +7.75, ch])
						scale([1,1,.4])
			rotate([0,-90,0])
				pill(pill_w, pill_r);


			
			translate([0, 0, -1]) 
			rounded_box(w + c*2, d + c*2, ch - t + 1, r + c);
			
			

			translate([ - w/2 + 24, -d, -1]) 	
			cube([2*w, 2*d, 2*ch +1]);
			
			jack();
		}
		
		// wall
		translate([1*.45 - t - w/2 + 24, -(d+case)/2,h])
		cube([t- 1*.45, d + case, ch-h]);

		// screw terminals
		difference() {
			translate([-w/2 + (w-35), -d/2 + 2.5, h])
			cylinder(ch-h, 2.5, 2.5);

			translate([-w/2 + (w-35), -d/2 + 2.5, h-1])
			cylinder(ch-h+2, .8, .8);
		}

		difference() {
			translate([-w/2 + (w-35) + 19, -d/2 + 2.5 + 19, h])
			cylinder(ch-h, 2.5, 2.5);

			translate([-w/2 + (w-35) + 19, -d/2 + 2.5 + 19, h-1])
			cylinder(ch-h+2, .8, .8);
		}
		
	}
}




// jack
module jack() {
	color("gray")
	translate([+w/2 -6 -29.25,0,h]) {
		cube([12,12,5]);
		
		translate([6, 12 + 3.3, 2.5])
		rotate([90,0,0])
		cylinder(3.3, 3.1, 3.1);
	}
}

module pill(h, r){
	translate([0,0,r]) {
		sphere(r);
		cylinder(h-r-r,r,r);
		translate([0,0,h-r-r])
		sphere(r);
	}
}

module rounded_box(w,d,h,r)
{
	union(){
		translate([-w/2+r, -d/2+r, 0]) cylinder(h, r, r);
		translate([-w/2+r, d/2-r, 0]) cylinder(h, r, r);
		translate([w/2-r, -d/2+r, 0]) cylinder(h, r, r);
		translate([w/2-r, d/2-r, 0]) cylinder(h, r, r);
		
		translate([-w/2+r, -d/2, 0]) cube([w-r*2,d,h]);
		translate([-w/2, -d/2+r, 0]) cube([w,d-r*2,h]);
	}
}
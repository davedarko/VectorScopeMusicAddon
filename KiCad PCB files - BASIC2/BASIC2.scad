w = 37.5;
d = 24;
h = 1.6;
r = 1;
$fn=50;
t = 3 * .45; // thickness of walls
c = .2; // clearance
case =  t*2 + c*2;
ch = 7 + h + t; // - (r+t+c);

// case
if (1) {
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
		
		translate([0, 0, -1]) 
		rounded_box(w + c*2, d + c*2, ch - t + 1, r + c);

		translate([-w + w/2 + 24, -d, -1]) 	
		cube([2*w, 2*d, 2*ch +1]);
		
		jack();
	}
}

// PCB
if(1)
color("green")
difference() {
	
	rounded_box(w,d,h,r);
	
	translate([-w/2 + (w-35), -d/2 + 2.5, -1])
	cylinder(h+2, 1.1, 1.1);
	
	translate([-w/2 + (w-35) + 19, -d/2 + 2.5 + 19, -1])
	cylinder(h+2, 1.1, 1.1);
}

if (1) jack();
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
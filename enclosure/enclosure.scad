
render_front = true;
render_back = true;
render_enclosure = true;

$fn = 30;

translate([67.3/2, 64.5/2, -8]) rotate([0, 0, 90]) {


    if (render_enclosure) {
        %render(convexity=0) import("models/bopla-u85-top.stl");

        // modify enclosure
        color("lightgray") render(convexity=0) difference() {
            import("models/bopla-u85-bot.stl");
            // this removes the lids
            translate([0, 0, 15]) cube([20, 100, 20], center=true);
        }
    }

    if (render_back) {
        translate([0, 35.5, 20.15]) rotate([-90, 180, 0])
        difference() {
            color("white") render(convexity=2) linear_extrude(2) 
                import("backpanel.dxf", layer="0");
            translate([0, 0, 2.0001-0.2]) 
            color("black") linear_extrude(0.2) 
                import("backpanel.dxf", layer="1");
        }
    }

    if (render_front) {
        translate([0, -35.5, 20.15]) rotate([90, 0, 0])
        difference() {
            color("white") render(convexity=2) linear_extrude(2) 
                import("frontpanel.dxf", layer="0");
            translate([0, 0, 2.01-0.2]) 
            color("black") linear_extrude(0.2) 
                import("frontpanel.dxf", layer="1");
        }
    }
}

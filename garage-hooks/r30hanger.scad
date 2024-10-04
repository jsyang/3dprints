
module sector(radius, angles, fn = 64) {
    r = radius / cos(180 / fn);
    step = -360 / fn;

    points = concat([[0, 0]],
        [for(a = [angles[0] : step : angles[1] - 360]) 
            [r * cos(a), r * sin(a)]
        ],
        [[r * cos(angles[1]), r * sin(angles[1])]]
    );

    difference() {
        circle(radius, $fn = fn);
        polygon(points);
    }
}

module arc(radius, angles, width = 1, fn = 6me4) {
    difference() {
        sector(radius + width, angles, fn);
        sector(radius, angles, fn);
    }
} 


translate([20,38,0])
    scale([-1,1,1])
    linear_extrude(8) arc(radius=20, angles=[70, 360-60], width=8, fn=64);
    
    linear_extrude(8) arc(radius=15, angles=[60, 290], width=8, fn=64);

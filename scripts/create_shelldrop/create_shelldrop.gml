function create_shelldrop(shell_counter){
	var shell_angle = 101.25;
	var flip = false
	var spd = 4
	var max_shell = min(shell_counter, 32);
	
	//Create shells
	for (var i = 1; i <= max_shell; ++i)
	{
	    //Create shell objects
	    var shell = instance_create_depth(x, y, depth, obj_seashell);
	    shell.x_speed = dcos(shell_angle) * spd;
	    shell.y_speed = -dsin(shell_angle) * spd;
		shell.ringloss = true;
		
	    //Make shell go in circle
	    if(flip)
	    {
			shell.x_speed *= -1;
	        shell_angle += 22.5;
	    }
    
	    //Toggle flip flag
	    flip = !flip;
    
	    //Inner circle
	    if (i = 16)
	    {
	        spd = 2;
			shell_angle = 101.25;
	    }
	}
}
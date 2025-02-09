// smooth opening
function outback(arg0, arg1, arg2, arg3)
{
	var _s = 1;

	argument0 = argument0/argument3 - 1;
	return argument2 * (argument0 * argument0 * ((_s + 1) * argument0 + _s) + 1) + argument1;
}
function incubic(arg0, arg1, arg2, arg3) {
	return arg2 * power(arg0/arg3, 3) + arg1;
}

// animation
if con == -1
{
	if playsound
		scr_soundeffect(sfx_diagopen);
	con = 0;
}
if con == 0
{
	t += 0.1;
	size = outback(t, 0, 1, 1);
	
	if t >= 1
	{
		t = 0;
		con = 1;
	}
}
if con == 2
{
	t = min(t + 0.15, 1)
	size = 1 - incubic(t, 0, 1, 1);
	
	if t >= 1
		instance_destroy();
}

// start writing
if con == 1
{
	scr_getinput(true);
	
	// newline
	if writer < string_length(dialogue[curdiag])
	{
		if alarm[0] == -1 && !instant
			alarm[0] = rate;
		
		if (key_slap2 && canskip) or instant
		{
			alarm[0] = -1;
			writer = string_length(dialogue[curdiag]);
		}
	}
	else
	{
		// next dialogue
		if key_jump && cancon
		{
			writer = 0;
			curdiag++;
			
			// done!
			if curdiag >= array_length(dialogue)
			{
				if playsound
					scr_soundeffect(sfx_diagclose);
				con = 2;
			}
		}
	}
	
	// close
	if key_taunt && canskip
	{
		if playsound
			scr_soundeffect(sfx_diagcancel);
		con = 2;
	}
}

// restart
if keyboard_check_pressed(ord("R")) && debug
{
	if playsound
		scr_soundeffect(sfx_diagopen);
	t = 0;
	con = 0;
	alarm[0] = -1;
	writer = 0;
	curdiag = 0;
}
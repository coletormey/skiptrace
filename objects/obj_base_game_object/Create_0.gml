event_inherited();

component_list = [];
collides_with_player = false;
is_breakable = false;

add_component = function(component) 
{
	var component_name = component.name;
	for (var i = 0; i < array_length(component_list); i++) 
	{
		if (component_list[i].name == component_name) 
		{
			return; // avoids adding duplicates	
		}
	}
	array_push(component_list, component);
};
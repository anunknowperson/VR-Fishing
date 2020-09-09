extends StaticBody

signal CATCH()

var last_pos :Vector3

func _ready():
	last_pos = $"..".translation

func _process(delta):
	if $"..".translation.distance_to(last_pos) > 0.1:
		emit_signal("CATCH")
	
	last_pos = $"..".translation

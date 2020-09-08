extends Position3D

onready var fish = preload("res://Scenes/Fish.tscn")

export (float) var MinTime = 5
export (float) var MaxTime = 15

func _on_SpawnTimer_timeout():
	var node = fish.instance()
	get_parent().add_child(node)
	node.translation = translation
	$SpawnTimer.wait_time = rand_range(MinTime, MaxTime)

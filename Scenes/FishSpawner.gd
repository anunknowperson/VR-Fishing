extends Position3D

onready var fish = preload("res://Scenes/Fish.tscn")

export (float) var MinTime = 1
export (float) var MaxTime = 10

func _on_SpawnTimer_timeout():
	add_child(fish.instance())
	$SpawnTimer.wait_time = rand_range(MinTime, MaxTime)

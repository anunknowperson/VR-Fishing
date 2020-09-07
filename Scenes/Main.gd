extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var Level1 = preload("res://Scenes/Level1.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(Level1.instance())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

extends Node


func _ready():
	var random : = RandomNumberGenerator.new()
	var alert = load("res://Bomb.tscn")
	var screen_size = get_viewport().get_visible_rect().size
	
	
	var e = alert.instance()
	random.randomize()
	var x = random.randf_range(0, screen_size.x)
	random.randomize()
	var y = random.randf_range(0, screen_size.y)
	e.position.y = y
	e.position.x = x
	add_child(e)

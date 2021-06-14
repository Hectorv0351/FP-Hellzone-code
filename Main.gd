extends Node2D

export (PackedScene) var bombs

var phase2: = false
var screen_size = get_viewport_rect().size
var score : = 0

var random : = RandomNumberGenerator.new()
var alert = load("res://Bomb.tscn")
var alert2 = load("res://Bomb_2.tscn")

func _ready():
	randomize()


func _on_Bombs_timeout():
	var screen_size = get_viewport().get_visible_rect().size
	var e = alert.instance()
	random.randomize()
	var x = random.randf_range(0, screen_size.x)
	random.randomize()
	var y = random.randf_range(0, screen_size.y)
	e.position.y = y
	e.position.x = x
	add_child(e)
	

func _on_switch_timeout():
	if phase2:
		var screen_size = get_viewport().get_visible_rect().size
		var d = alert2.instance()
		random.randomize()
		var x = random.randf_range(0, screen_size.x)
		d.position.y = screen_size.y/2
		d.position.x = x
		add_child(d)


func _on_phasetwo_timeout():
	phase2 = true


func _on_Player_hit():
	$Bombs.stop()
	$switch.stop()
	$hud.gameover()
	$Scores.stop()
	
	
	


func _on_Scores_timeout():
	score += 1
	$hud.higher_score(score)


func _on_hud_start_game():
	score = 0
	$hud.higher_score(score)
	$Bombs.start()
	$switch.start()
	$Scores.start()
	$phasetwo.start()
	$Player.start($startpos.position)
	

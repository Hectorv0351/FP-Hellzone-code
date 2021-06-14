extends Node2D

func _ready():
	$KinematicBody2D/boom.hide()
	
	

func _on_Timer_timeout():
	$KinematicBody2D/boom.show()
	$KinematicBody2D/alert.hide()
	get_node("KinematicBody2D/CollisionShape2D").disabled = false
	yield(get_tree().create_timer(1.0), "timeout")
	queue_free()


func _on_Player_hit():
	queue_free()

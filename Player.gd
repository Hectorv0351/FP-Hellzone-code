extends Area2D

signal hit

export var speed : = 400.0
var screen_size = Vector2.ZERO
func _ready():
	screen_size = get_viewport_rect().size
	


# every frame this code continues to play
func _process(delta): 
	var direction : = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	# Movement through WASD and ArrowKeys
	if direction.length() > 0:
		direction = direction.normalized()
	
	
	position += direction * speed * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	# Clamp returns a value that doesn't pass the max or min.
	# the max being the end of the screen and the min being the start of a screen.
	
	if direction.y != 0:
		if direction.y <= 0:
			$Sprite.texture = load("res://Sprites/Fces-up.png")
		elif direction.y >= 0:
			$Sprite.texture = load("res://Sprites/Fces-down.png")
	else:
		$Sprite.texture = load("res://Sprites/Fces.png")


func start(new_position):
	position = new_position
	show()
	$CollisionShape2D.disabled = false


func _on_Player_body_entered(body):
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	emit_signal("hit")

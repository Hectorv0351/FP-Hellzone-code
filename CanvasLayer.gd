extends CanvasLayer

signal start_game

func higher_score(score):
	$Score.text = str(score)
	

func show(text):
	$Start.text = text
	$Start.show()
	$Timer.start()

func gameover():
	show("Game Over")
	yield($Timer, "timeout")
	$Start.text = "Hellzone Grenades"
	$Start.show()
	$Button.show()

func _on_Button_pressed():
	$Button.hide()
	$Start.hide()
	emit_signal("start_game")


func _on_Timer_timeout():
	$Start.hide()

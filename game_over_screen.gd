extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	show_score()

func show_score():
	$HighScoreLabel.text = "HIGHEST FUNDS RAISED $ " + str(GameVariables.high_score / 10)
	$ScoreLabel.text = "FUNDS RAISED $ " + str(GameVariables.score / 10)


func _on_try_again_pressed():
	get_tree().change_scene_to_file("res://game_scene.tscn")
	
func _on_quit_pressed():
	get_tree().quit()

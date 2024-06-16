extends Node2D

@onready var timer = $Timer

var pete = preload("res://pete_power.tscn")
var stopSign = preload("res://stop_sign.tscn")
var orange = preload("res://debuff_orange.tscn")

func _ready():
	randomize()

func _on_Timer_timeout():
	spawn_obstacle()
	
func spawn_obstacle():
	var obstacle = pete.instance()
	add_child(obstacle)
	obstacle.position.y = randi()%400 + 150

extends Node2D

var pete = preload("res://pete_power.tscn")
var stopSign = preload("res://stop_sign.tscn")
var orange = preload("res://debuff_orange.tscn")
var obstacle_type :=[pete,stopSign,orange]
var obstacles : Array
@onready var spawn_pos = $SpawnPos


func _on_timer_timeout():
	var obstacleInstance = pete.instantiate()
	obstacleInstance.position = spawn_pos.position + Vector2(randf_range(400,600),randf_range(400,600))
	add_child(obstacleInstance)

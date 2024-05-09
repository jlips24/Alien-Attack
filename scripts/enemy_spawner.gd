extends Node2D

signal enemy_spawned(enemy_instance)

var enemy_scene = preload("res://scenes/enemy.tscn")

@onready var spawn_positions = $SpawnPositions
@onready var timeout_notifier = $Timer

func _ready():
	timeout_notifier.connect("timeout", _timer_timeout)

func _timer_timeout():
	spawn_enemy()

func spawn_enemy():
	var spawn_positions_array = spawn_positions.get_children()
	var random_spawn_position = spawn_positions_array.pick_random()
	
	var enemy_instantce = enemy_scene.instantiate()
	enemy_instantce.global_position = random_spawn_position.global_position
	emit_signal("enemy_spawned", enemy_instantce)
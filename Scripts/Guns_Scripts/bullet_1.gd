extends CharacterBody2D

@export var speed : float = 400.0

var target_position
var despawn_time = 0.8

func _ready() -> void:
	despawn()
	
func _physics_process(delta: float) -> void:
	velocity = target_position * speed
	move_and_slide()
	
func despawn():
	await get_tree().create_timer(despawn_time).timeout
	queue_free()
	
	
	

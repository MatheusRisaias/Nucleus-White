extends Node2D


const BULLET_SCENE = preload("res://Scenes/Guns/bullet_1.tscn")

@onready var pos_Shoot : Marker2D = $PosShoot

@export var distancia: float = 18.0


func _process(delta: float) -> void:
	angle_gun()


func shoot() -> void:
	var new_bullet = BULLET_SCENE.instantiate()
	new_bullet.position = pos_Shoot.global_position
	new_bullet.rotation = pos_Shoot.global_rotation
	new_bullet.target_position = (get_global_mouse_position() - pos_Shoot.global_position).normalized()

	GlobalData.arena.add_child(new_bullet)
	
func angle_gun():
	var mouse_position = get_global_mouse_position()
	# Direção entre o jogador e o mouse
	var direcao = (mouse_position - get_parent().global_position).normalized()

	# faz rotacionar a mão em direção ao mouse
	global_rotation = direcao.angle()

	# Posiciona a arma ao redor do jogador
	global_position = get_parent().global_position + direcao * distancia
	
	if mouse_position.x > global_position.x:
		$Sprite2D.flip_v = false
	else:
		$Sprite2D.flip_v = true

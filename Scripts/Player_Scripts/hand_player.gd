extends Node2D
@export var distancia: float = 18.0

func _process(delta: float) -> void:
	var mouse_position = get_global_mouse_position()

	# Direção entre o jogador e o mouse
	var direcao = (mouse_position - get_parent().global_position).normalized()

	# faz rotacionar a mão em direção ao mouse
	global_rotation = direcao.angle()

	# Posiciona a mão ao redor do jogador
	global_position = get_parent().global_position + direcao * distancia

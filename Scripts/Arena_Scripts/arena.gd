extends Node2D

@export_category("armas")
@export var armas : Array[PackedScene]

func _ready() -> void:
	var arma_random = armas.pick_random()
	print(arma_random)

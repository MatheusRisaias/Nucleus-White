extends CharacterBody2D

var _move_speed : float = 200.0
var _can_dash : bool = true
var _dash : float = 550.0

func _ready() -> void:
	pass # Replace with function body.
	
func _process(delta: float) -> void:
	if global_position.x > 915 or global_position.x < 235:
		get_tree().reload_current_scene()
	elif global_position.y < 165 or global_position.y > 550:
		get_tree().reload_current_scene()
	else: return
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	move_player()
	move_and_slide()
	print(_move_speed)
	
func move_player():
	var direction = Input.get_vector("left_move","right_move","up_move","down_move")
	velocity = direction * _move_speed
	
	#essa variavel pega a posição global do mouse
	var mouse_position = get_global_mouse_position()
	#condição responsável para fazer o player virar
	#com base de onde ele estiver olhando(posição do mouse
	if mouse_position.x > global_position.x:
		$Animacao.flip_h = true
	else:
		$Animacao.flip_h = false
	
	#dash
	if Input.is_action_just_pressed("dash_move") and _can_dash:
		_move_speed += _dash
		$TimerDash.start()


func _on_timer_dash_timeout() -> void:
	_move_speed -= _dash
	_can_dash = false
	$TimerNotDash.start()

func _on_timer_not_dash_timeout() -> void:
	_can_dash = true

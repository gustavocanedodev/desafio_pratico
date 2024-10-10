extends Area2D

const FALL_SPEED = 100.0
var panel: Node
var player: Node

func _ready() -> void:
	panel = $"../Panel"
	player = $"../Player"
	
	# Verifica se os nós referenciados existem
	assert(panel != null, "Panel não encontrado!")
	assert(player != null, "Player não encontrado!")

func _on_body_entered(body: Node2D) -> void:
	# Verifica se o corpo colidido é o player antes de adicionar combustível
	if body == player:
		panel.add_fuel(7)
		print("+7 fuel")
		queue_free()  # Remove o item de combustível após a coleta

func _physics_process(delta: float) -> void:
	# O item de combustível só cai se o controle do jogador estiver ativado
	if not player.is_control_disabled:
		position.y += FALL_SPEED * delta

	# Remove o item de combustível se sair da tela
	if position.y > 720:
		queue_free()

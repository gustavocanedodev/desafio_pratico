extends Panel

var fuel: int = 100

func _ready() -> void:
	$FuelCounter.text = "Fuel: " + str(fuel)
	$Timer.start()

func _on_timer_timeout() -> void:
	fuel -= 1
	if fuel < 0:
		fuel = 0
	$FuelCounter.text = "Fuel: " + str(fuel)

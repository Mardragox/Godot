extends Node2D

@export var click = 0
@export var modifier = 1

func _ready():
	$"../Nie stać cię na to".visible = false
	$"../Modyfikator CPS".text = "Modyfikator CPS: " + str(modifier)


func kliknięcie():
		click += 1 * modifier
		$"../Kliknięcia".text = "Kliknięcia: " + str(click)
		return click


func _on_button_pressed():
	kliknięcie()
	$AnimationPlayer.play("Click")
	await get_tree().create_timer(0.5).timeout
	$AnimationPlayer.stop()


func _on_upgrade_pressed():
	if click >=50:
		click -= 50
		modifier += 1
		$"../Kliknięcia".text = "Kliknięcia: " +str(click)
		$"../Modyfikator CPS".text = "Modyfikator CPS: " + str(modifier)
		return modifier
	else:
		$"../Nie stać cię na to".visible = true
		$"../Nie stać cię na to".text = "Nie stać cię na to"
		await get_tree().create_timer(1.0).timeout
		$"../Nie stać cię na to".visible = false

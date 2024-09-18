extends Node2D
var i = 0
@export var click = 0
@export var modifier = 1
@export var AC = 0
@export var upgrade1_mnoznik = 1
@export var upgrade2_mnoznik = 1

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
	if click >=(50 * upgrade1_mnoznik):
		click -= (50 * upgrade1_mnoznik)
		modifier += 1
		upgrade1_mnoznik += 1.2
		$"../Upgrade1/Label".text = "Upgrade +1 click
 " + str(50 * upgrade1_mnoznik)
		$"../Kliknięcia".text = "Kliknięcia: " +str(click)
		$"../Modyfikator CPS".text = "Modyfikator CPS: " + str(modifier)
		return modifier
	else:
		$"../Nie stać cię na to".visible = true
		$"../Nie stać cię na to".text = "Nie stać cię na to"
		await get_tree().create_timer(1.0).timeout
		$"../Nie stać cię na to".visible = false



func _on_upgrade_2_pressed():
	if click >=(100 * upgrade2_mnoznik):
		click -= (100 * upgrade2_mnoznik)
		AC +=1
		upgrade2_mnoznik += 0.75
		$"../Kliknięcia".text = "Kliknięcia: " +str(click)
		$"../AutoClick".text = "Automatyczne kliknięcia na sekundę: " + str(AC)
		$"../Upgrade2/Label".text = "Upgrade +1 click
 " + str(100 * upgrade2_mnoznik)
		return AC
	else:
		$"../Nie stać cię na to".visible = true
		$"../Nie stać cię na to".text = "Nie stać cię na to"
		await get_tree().create_timer(1.0).timeout
		$"../Nie stać cię na to".visible = false
		


func Autoklikacz():
	if AC >0:
		$AutoClickTimer.autostart = true
		click += AC
		$"../Kliknięcia".text = "Kliknięcia: " +str(click)
		return click
	else:
		pass
		
func _on_timer_timeout():
	Autoklikacz()


func _on_go_to_settings_button_pressed():
	get_tree().change_scene_to_file("res://../SettingsMenu/settings_menu.tscn")

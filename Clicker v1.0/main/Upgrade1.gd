extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_upgrade_pressed():
	
	$AnimationPlayer.play("ClickUpgrade1")
	await get_tree().create_timer(0.5).timeout
	$AnimationPlayer.stop()

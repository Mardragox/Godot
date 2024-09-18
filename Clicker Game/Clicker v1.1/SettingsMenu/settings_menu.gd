extends Node2D


# Called when the node enters the scene tree for the first time.


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://../MainMenu/main_menu.tscn")


func _on_credits_menu_button_pressed():
	get_tree().change_scene_to_file("res://../CreditsMenu/credits_menu.tscn")


func _on_go_back_button_pressed():
	get_tree().change_scene_to_file("res://../main/main.tscn")

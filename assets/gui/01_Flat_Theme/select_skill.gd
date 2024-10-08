extends Control
func _ready():
	# Connecting signals in Godot 4
	$NinePatchRect/VBoxContainer/AttackButton.pressed.connect(_on_attack_pressed)
	$NinePatchRect/VBoxContainer/SkillButton.pressed.connect(_on_skill_pressed)
	$NinePatchRect/VBoxContainer/SummonButton.pressed.connect(_on_summon_pressed)
	$NinePatchRect/VBoxContainer/ItemButton.pressed.connect(_on_item_pressed)

func _on_attack_pressed():
	var attack_index = 0  # Assuming the basic attack is at index 0
	var active_turn_queue = get_node("../Battlers")
	for battler in active_turn_queue.indicators.keys():
		if !battler.is_player:  # Ensure it's an enemy battler
			active_turn_queue.indicators[battler].visible = true
	active_turn_queue.emit_signal("skill_selected", attack_index)
func _on_skill_pressed():
	print("Skill Pressed")
	# Show the skill selection menu
	$SkillMenu.show()

func _on_summon_pressed():
	print("Summon Pressed")
	# Handle summon logic here

func _on_item_pressed():
	print("Item Pressed")
	# Handle item logic here

extends Node

var upgrade_list_item_scn = preload("res://components/ui/upgrade_list_item.tscn")

func _ready() -> void:
	var stat_names = PlayerData.stat_data.get_stat_names()
	for stat_name in stat_names:
		var node = upgrade_list_item_scn.instantiate() as stat_view
		node.stat_name = stat_name
		add_child(node)
			

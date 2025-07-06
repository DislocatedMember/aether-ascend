extends Node

func get_stat(stat_name: String):
	return PlayerData.get_stat(stat_name)
			
		
func modify_stat(stat_name:String, value: Variant, operation: PlayerData.Operation = PlayerData.Operation.SET):
	PlayerData.modify_stat(stat_name,value,operation)

func modify_current_stat(stat_name:String, value: Variant, operation: PlayerData.Operation = PlayerData.Operation.SET):
	PlayerData.modify_current_stat(stat_name,value,operation)

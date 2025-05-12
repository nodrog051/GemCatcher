@tool
extends EditorScript

func _run() -> void:
	var prizes: Array[float] = [0.01,0.1,0.5,1.0,100.0,500.0]
	while !prizes.is_empty():
		var prize_amount: float = prizes.pick_random()
		print(prize_amount)
		print("Removed", prize_amount)
		prizes.erase(prize_amount)
		prizes.shuffle()

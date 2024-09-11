extends Control

func _process(_delta: float) -> void:
	$Version.text = "Project-Altitude v0.0.1a"
	$FPS.text = "FPS: " + str(Engine.get_frames_per_second())
	$Process_Frames.text = "Process Frames: " + str(Engine.get_process_frames())

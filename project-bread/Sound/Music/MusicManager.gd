class_name MusicManager
extends AudioStreamPlayer

enum enum_Tracks{Plains, Swamp, Desert, Aquatic}
@export var tracks:enum_Tracks:
	set(newValue):
		tracks = newValue
		
		match tracks:
			enum_Tracks.Plains:
				print("Now at Plains")
				transition("Plains",0)
				transition("Swamp",-60)
				transition("Desert",-60)
				transition("Aquatic",-60)
			enum_Tracks.Swamp:
				print("Now at Swamp")
				transition("Plains",-60)
				transition("Swamp",0)
				transition("Desert",-60)
				transition("Aquatic",-60)
			enum_Tracks.Desert:
				print("Now at Desert")
				transition("Plains",-60)
				transition("Swamp",-60)
				transition("Desert",0)
				transition("Aquatic",-60)
			enum_Tracks.Aquatic:
				print("Now at Aquatic")
				transition("Plains",-60)
				transition("Swamp",-60)
				transition("Desert",-60)
				transition("Aquatic",0)

var Plains:float = -60:
	set(newValue):
		stream.set_sync_stream_volume(1,newValue)
		Plains = newValue
		
var Swamp:float = -60:
	set(newValue):
		stream.set_sync_stream_volume(2,newValue)
		Swamp = newValue
		
var Desert:float = -60:
	set(newValue):
		stream.set_sync_stream_volume(3,newValue)
		Desert = newValue
		
var Aquatic:float = -60:
	set(newValue):
		stream.set_sync_stream_volume(4,newValue)
		Aquatic = newValue

func transition(variable:String, newValue:float):
	var tween = create_tween()
	tween.tween_property(self,variable,newValue, 2).set_trans(Tween.TRANS_LINEAR)

func _ready() -> void:
	tracks = enum_Tracks.Plains
	
	var audStream:AudioStream = stream.get_sync_stream(1)
	#audStream.set_sync_stream_volume(1,-60)

extends Node2D

var arr = ["",0,"",""]
var userInput = []
var prompt = ["a name","a number","a meal","an emotion"]

func _ready():
	promptPlayer()

func _on_LineEdit_text_entered(new_text):
	$TextureRect/LineEdit.text = ""
	userInput.append(new_text)
	if userInput.size() == prompt.size():
		 tellStory()
	else:
		promptPlayer()

func _on_TextureButton_pressed():
	_on_LineEdit_text_entered($TextureRect/LineEdit.get_text())
	
func promptPlayer():
	if userInput.size() <= 4:
		$TextureRect/StoryText.text = ("Can I have " + prompt[userInput.size()] + ", please?")
	
func tellStory():
	$TextureRect/StoryText.text = "once upon a time %s ate %s %s and felt very %s." % userInput

func _on_LineEdit_mouse_entered():
	$TextureRect/LineEdit.text = ""

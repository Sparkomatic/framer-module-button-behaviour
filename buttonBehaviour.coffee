# adds radio button behaviour to an array/group of buttons
# rename function to make buttons radio button or equivalent
# is it worth doing in a constructor - probably not becasue it's just adding behasviour to layer object already created


exports.createRadioButtonBehaviour = (arrayOfButtons) ->
	for button in arrayOfButtons
		button.isOn = false
		
		button.turnOn = -> @isOn = true
		button.turnOff = -> @isOn = false
		
		button.showOn = -> @backgroundColor = 'black'
		button.showOff = -> @backgroundColor = 'grey'
		
		button.flipSwitch = ->
			if @isOn is false then @turnOn()
			else if @isOn is true then @turnOff()
			arrayOfButtons.forEach (layer) ->
				if layer isnt button and layer.isOn is true
					layer.turnOff()
					
		button.onClick (event, button) ->
			@flipSwitch()
			updateLayers(button)
			
	updateLayers = (clickedButton) ->
			arrayOfButtons.forEach (button) ->
				if button is clickedButton
					button.showOn()
				else
					button.showOff()

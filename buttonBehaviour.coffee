# adds radio button behaviour to an array/group of buttons
# rename function to make buttons radio button or equivalent
# is it worth doing in a constructor - probably not becasue it's just adding behasviour to layer object already created

#refactor code reuse DRY


exports.createRadioButtonBehaviour = (arrayOfButtons, selectedStyle, unselectedStyle) ->
	for button in arrayOfButtons

		createButtonActions(button)
		createButtonAppearance(button, selectedStyle, unselectedStyle)

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

exports.createCheckButtonBehaviour = (arrayOfButtons, selectedStyle, unselectedStyle) ->
	for button in arrayOfButtons
		createButtonActions(button)
		createButtonAppearance(button, selectedStyle, unselectedStyle)


		button.flipSwitch = (button) ->
			if button.isOn is false then button.turnOn()
			else if button.isOn is true then button.turnOff()

		button.onClick (event, button) ->
			@flipSwitch(button)
			updateLayer(button)

		updateLayer = (button) ->
			if button.isOn
				button.showOn()
			else
				button.showOff()

createButtonActions = (button) ->
	button.isOn = false
	button.turnOn = -> @isOn = true
	button.turnOff = -> @isOn = false
	return button

createButtonAppearance = (button, selectedStyle, unselectedStyle) ->
		button.showOn = -> @style = selectedStyle
		button.showOff = -> @style = unselectedStyle
		return button

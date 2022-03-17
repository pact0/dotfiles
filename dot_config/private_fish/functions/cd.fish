function cd --description "automatically do an ls after cd"
	# Try a normal cd
  set a builtin cd $argv[1]
  builtin cd $argv[1]
	if [ a != 0 ]
		# If we get here cd was successful so do a ls
		ls
  else
		# If we get here, cd was not successful
		if [ -f "$1" ]
			# If there is a file there, try and open it in vim
			# ToDo: smarter open so it will open in zathura if it's a pdf for
			# example
			$EDITOR "$1"
		else
			# Otherwise fail clearly
			printf "Can't cd"
		end

	end
	#updatePath
end

function mkcd --description "automatically create a directory if it doesn't exist"
	mkdir -p $argv[1]
	cd $argv[1]
end

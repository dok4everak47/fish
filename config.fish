if status is-interactive
    # Commands to run in interactive sessions can go here
    function y
			set tmp (mktemp -t "yazi-cwd.XXXXXX")
			yazi $argv --cwd-file="$tmp"
			if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
				builtin cd -- "$cwd"
			end
			rm -f -- "$tmp"
    end

    set -gx EDITOR nvim
	set -gx VISUAL nvim

	# >>> mamba initialize >>>
	# !! Contents within this block are managed by 'mamba shell init' !!
	set -gx MAMBA_EXE "/home/dok4ever/miniforge3/bin/mamba"
	set -gx MAMBA_ROOT_PREFIX "/home/dok4ever/miniforge3"
	$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
	# <<< mamba initialize <<<

	abbr -a vi nvim


	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	if test -f /home/dok4ever/miniforge3/bin/conda
    	eval /home/dok4ever/miniforge3/bin/conda "shell.fish" "hook" $argv | source
	else
    	if test -f "/home/dok4ever/miniforge3/etc/fish/conf.d/conda.fish"
        	. "/home/dok4ever/miniforge3/etc/fish/conf.d/conda.fish"
    	else
        	set -x PATH "/home/dok4ever/miniforge3/bin" $PATH
    	end
	end
	# <<< conda initialize <<<

	function y
		set tmp (mktemp -t "yazi-cwd.XXXXXX")
		yazi $argv --cwd-file="$tmp"
		if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
			builtin cd -- "$cwd"
		end
		rm -f -- "$tmp"
	end

end



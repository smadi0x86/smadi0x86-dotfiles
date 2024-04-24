if status is-interactive
    # Initialize Starship prompt
    starship init fish | source

    # Initialize nvm with bass and use the default Node version silently
    function nvm
        bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
    end

    # Automatically use the default node version, suppress output
    nvm use default > /dev/null

    # Set the Go and other paths
    set -gx PATH /usr/bin /bin $PATH /usr/local/go/bin
end


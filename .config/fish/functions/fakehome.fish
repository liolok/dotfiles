function fakehome --description "Use dedicated home to run app"
    set app (basename $argv[1]) # expect absolute path to app
    set home (fallback $XDG_DATA_HOME ~/.local/share)/$app # dedicated home
    mkdir --parents $home
    HOME=$home $argv # passthrough all arguments
end

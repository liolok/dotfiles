# (/usr/share/fish/functions/export.fish)
# (https://www.freedesktop.org/software/systemd/man/systemd-environment-d-generator.html)

if status is-login
    export (/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)
end

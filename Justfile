delete-fleet fleet:
    rm -rf bootstrap/fleets/{{fleet}}
    git add .
    git commit -m "Deleting fleet {{fleet}}"
    git pull --rebase
    git push
delete-fleet fleet:
    git pull
    rm -rf bootstrap/fleets/{{fleet}}
    git add .
    git commit -m "Deleting fleet {{fleet}}"
    git push
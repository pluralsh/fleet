delete-fleet fleet:
    rm -rf bootstrap/fleets/{{fleet}}
    git pull
    git add .
    git commit -m "Deleting fleet {{fleet}}"
    git push
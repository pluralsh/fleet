delete-fleet fleet:
    git pull
    rm -rf bootstrap/fleets/{{fleet}}
    rm -rf fleets/clusters/dev/{{fleet}}
    rm -rf fleets/clusters/prod/{{fleet}}
    rm -rf fleets/clusters/{{fleet}}
    rm -rf fleets/{{fleet}}
    git add .
    git commit -m "Deleting fleet {{fleet}}"
    git push
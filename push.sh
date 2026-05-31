BRANCH=$(git rev-parse --abbrev-ref HEAD)

COMMITS=$(git log --reverse --pretty=format:"%H")

COUNT=0
for COMMIT in $COMMITS; do
    COUNT=$((COUNT + 1))
    if [ $((COUNT % 100)) -eq 0 ]; then
        echo "--> Pushing chunk up to commit $COUNT..."
        git push origin $COMMIT:refs/heads/$BRANCH
    fi
done

echo "--> Pushing final state..."
git push origin $BRANCH

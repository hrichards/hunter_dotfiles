LAPTOP_MUSIC=$HOME/Music/*
TIMEOUT=5
REMOTE_PATH="/home/hunter/laptop_music_backup/"
REMOTE_ADDY_URL="carl.twilightparadox.com:$REMOTE_PATH"
REMOTE_ADDY_IP="192.168.1.71:$REMOTE_PATH"
RSYNC_COMMAND="rsync -av --ignore-existing --timeout=$TIMEOUT --delete"


# Try by IP first.  If I'm home at midnight, chances are this is correct.
$RSYNC_COMMAND $LAPTOP_MUSIC $REMOTE_ADDY_IP

# Then try this.  Will fail with no problem if in subnet; will succeed where
# the other will fail if not.
# If they both succeed, no problem!
$RSYNC_COMMAND $LAPTOP_MUSIC $REMOTE_ADDY_URL

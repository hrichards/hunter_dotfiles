alias gitgone='git branch -vv | grep ": gone]"|  grep -v "\*" | awk "{ print $0; }" | xargs -r git branch -D'

# copy-github-labels

Docker image for copying the GitHub issue labels from one repo to another.

You'll need to [generate an access token](https://help.github.com/articles/creating-an-access-token-for-command-line-use/) to authenticate with. This token needs to have one or both of the "repo" and "public_repo" permissions, depending on whether the repos you're using are public or not.

After you have a token, run:

`docker run -it --rm -e "ACCESS_TOKEN=letmein" hexedpackets/copy-github-labels repo/from repo/to`

The script is slightly modified from the original gist at https://gist.github.com/tylerpearson/fda868b17ca0d4e4c7e8.

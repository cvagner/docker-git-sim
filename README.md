# git-sim docker image

[`git-sim`](https://github.com/initialcommit-com/git-sim) visually simulates Git operations in your own repos.


## Running

Get help with:
```sh
docker run --rm cvagner/git-sim
```

Example to get a video for a merge:
```sh
# Change dir to the root dir of your repo
cd my-git-repo

# Create git-sim_media with current user (once)
mkdir -p git-sim_media

# Here it creates a video for a merge
docker run --rm \
  -u $(id -u):$(id -g) \
  -v $(pwd):/app:ro \
  -v $(pwd)/git-sim_media/:/app/git-sim_media/ \
  cvagner/git-sim \
  \
  --animate merge <my-branch-name>
```

Open file shown in termial (remove `/app/` which is path in docker). Example:
```sh
xdg-open ./git-sim_media/videos/1080p60/GitSimMerge.mp4
```

## Building

```bash
docker build --tag=cvagner/git-sim .
```

## Publishing

```sh
docker login
docker push cvagner/git-sim
```


# Gitlab runner docker-compose

Run a gitlab runner instance using docker-compose. This repo has all you need to 
create and register a single instance gitlab runner using docker-compose. 

# Usage

- Copy `sample.env` to `env.env`
- Create a runner with a shared runner auth token: [link](https://docs.gitlab.com/ee/ci/runners/runners_scope.html#create-a-shared-runner-with-a-runner-authentication-token)
- Fill out values in `env.env`
- Source `env.env` to load variables into environment variables: `source env.env`
- Run `register.sh` to create config
- You can now start the runner using `docker-compose up`, or create and start
the systemd service using `create-systemd-service.sh`.

My config looks like this:

```
concurrent = 1
check_interval = 0
shutdown_timeout = 0

[session_server]
  session_timeout = 1800

[[runners]]
  name = "<snip>"
  url = "<snip - It is the http url to access your gitlab>"
  clone_url = "<snip - It is the http url to access your gitlab>"
  id = 1
  token = "<snip>"
  token_obtained_at = 2023-09-14T03:00:48Z
  token_expires_at = 0001-01-01T00:00:00Z
  executor = "docker"
  [runners.cache]
    MaxUploadedArchiveSize = 0
  [runners.docker]
    tls_verify = false
    image = "alpine:latest"
    privileged = true
    disable_entrypoint_overwrite = false
    oom_kill_disable = false
    disable_cache = false
    volumes = ["/var/run/docker.sock:/var/run/docker.sock", "/cache"]
    shm_size = 0
```

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



if [[ -z "${CI_SERVER_URL}" ]]; then
	echo "CI_SERVER_URL not set; exiting"
	exit 1
fi

if [[ -z "${AUTH_TOKEN}" ]]; then
	echo "AUTH_TOKEN not set; exiting"
	exit 1
fi

docker run --rm -t -i -v $(pwd)/config:/etc/gitlab-runner/ gitlab/gitlab-runner:alpine register --url "${CI_SERVER_URL}" --token "${AUTH_TOKEN}"

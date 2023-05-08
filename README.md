# py-cli-builder

Base image for building standalone CLI applications written in Python.

1. Ensure you have a file named `setup.py` that points to your application's actual entrypoint.
2. Define the environment variable `NAME` to be your application's name.
3. Mount your application directory to `/build`.

Example:

```shell
docker run \
  -v "$(pwd)":/build \
  --rm \
  --env NAME={{.NAME}} \
  --name {{.NAME}} \
  --workdir /build \
  kvdomingo/py-cli-builder:latest
```

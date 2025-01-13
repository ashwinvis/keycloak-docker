# Keycloak Docker Image based on `eclipse-temurin` alpine base image

If you want to use this docker image, you should use `ghcr.io/ashwinvis/keycloak:<VERSION>-alpine` as the base image.

For further more information, please see the [Running Keycloak in a container guide](https://www.keycloak.org/server/containers).

### Baking the cake 🍰

#### Github actions

Go to <https://github.com/ashwinvis/keycloak-docker/actions/workflows/docker-image.yml> and press on *Run workflow* or alternatively use Github CLI:

```console
gh workflow run -f version="<VERSION>" .github/workflows/docker-image.yml
```

#### Locally

If you need to build it yourself, you can do it like this

```shell
VERSION=<VERSION> TAG="<YOUR_TAG>:${VERSION}" docker buildx bake  
```

## Thanks

For the build file: [Daniel Marynicz](https://github.com/Daniel-Marynicz/keycloak) ✨

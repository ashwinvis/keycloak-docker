group "default" {
    targets = ["keycloak-alpine"]
}

variable "VERSION" {
  default = "999.0.0-SNAPSHOT"
}

variable "TAG" {
  default = "keycloak:${VERSION}"
}

target "keycloak-alpine" {
    args = {
        DIST = "alpine"
        KEYCLOAK_VERSION = "${VERSION}"
    }
    tags = ["${TAG}-alpine"]
}

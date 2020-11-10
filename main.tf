terraform {
  backend "remote" {
    organization = "little-core-labs"

    workspaces {
      name = "tf-cloud"
    }
  }
}

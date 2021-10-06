terraform {
  backend "remote" {
    organization = "exzample"

    workspaces {
      name = "courses" 

    }
  }
}
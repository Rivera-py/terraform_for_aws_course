terraform {
    backend "s3" {
        key = "terraform/tfstate.tfstate"
        bucket = "tf-rb-poc-2021-02"
        region = "eu-west-2"
        access_key = ""
        secret_key = ""
    }
}

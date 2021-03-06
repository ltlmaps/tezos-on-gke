terraform {
  required_version = ">= 0.12"
}

variable "org_id" {
  type        = string
  description = "Organization ID."
  default = ""
}

variable "billing_account" {
  type        = string
  description = "Billing account ID."
  default = ""
}

variable "project" {
  type        = string
  default     = ""
  description = "Project ID where Terraform is authenticated to run to create additional projects. If provided, Terraform will great the GKE and Tezos cluster inside this project. If not given, Terraform will generate a new project."
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "Region in which to create the cluster, or region where the cluster exists."
}

variable "kubernetes_config_context" {
  type = string
  description = "name of the kubernetes context where to create the deployment. Only set when you already have an existing cluster"
  default = ""
}

variable "terraform_service_account_credentials" {
  type = string
  description = "path to terraform service account file, created following the instructions in https://cloud.google.com/community/tutorials/managing-gcp-projects-with-terraform"
  default = "~/.config/gcloud/application_default_credentials.json"
}

#
# Tezos node and baker options
# ------------------------------

variable "public_baking_key" {
  type  = string
  description = "The public baker tz1 address that delegators delegate to."
}

variable "insecure_private_baking_key" {
  type  = string
  description = "The private key associated with the public_baking_key. Setting this variable will override the hardware security module configuration. ATTENTION! Do not do that on mainnet. Keep your private key in a HSM instead."
}

variable "authorized_signer_key_a" {
  type = string
  description = "Public key of the first remote signer."
  default = ""
}

variable "authorized_signer_key_b" {
  type = string
  description = "Public key of the first remote signer."
  default = ""
}

variable "tezos_network" {
  type =string
  description = "The tezos network i.e. mainnet, carthagenet..."
  default = "mainnet"
}

variable "tezos_sentry_version" {
  type =string
  description = "The tezos container version for sentry (public) nodes. Should be hard-coded to a version from https://hub.docker.com/r/tezos/tezos/tags. Not recommended to set to a rolling tag like 'mainnet', because it may break unexpectedly. Example: mainnet_06398944_20200211142914"
  default = "latest-release"
}

variable "tezos_private_version" {
  type =string
  description = "The tezos container version for private node. Should be hard-coded to a version from https://hub.docker.com/r/tezos/tezos/tags. Not recommended to set to a rolling tag like 'mainnet', because it may break unexpectedly. Example: mainnet_06398944_20200211142914"
  default = "latest-release"
}

variable "signer_target_random_hostname" {
  type = string
  description = "Random string such as 128fecf31d for the fqdn of the ssh endpoint the remote signer connects to (for example 128fec31d.mybaker.com)."
  default = "signer"
}

variable "protocol" {
  type = string
  description = "The Tezos protocol currently in use, for example 006-PsCARTHA."
  default = "006-PsCARTHA"
}

variable "protocol_short" {
  type = string
  description = "The short string describing the protocol, for example PsCARTHA."
  default = "PsCARTHA"
}

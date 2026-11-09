variable "project" {
    default = "roboshop"
} # If the default is mentioned then it is optional. It will use the mentioned value by default or you can override it

variable "environment" {
# As ther is no default so terraform requires an value. If you don't supply then it will ask in the prompt
}

variable "instance_type" {

}
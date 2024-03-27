variable "queue_name" {
    type = string
    nullable = false
    description = "What you want this queue to be called"
}

variable "max_receive_count" {
    type = number
    description = "Number of times a message can go back on the queue before being DLQ'd"
    default = 5
}

variable "receive_wait_time_seconds" {
    type = number
    description = "How long a connection should linger if there are no messages. Max 20."
    default = 20
}

variable "visbility_timeout_seconds" {
    type = number
    description = "How long before a message is visible again on the queue if it's not deleted after receiving"
    default = 30
}

variable "queue_message_retention_seconds" {
    type = number
    description = "How long a message can live on the queue before being automatically deleted"
    default = 345600  // 4 days
}

variable "dlq_message_retention_seconds" {
    type = number
    description = "How long a message can live on the dlq before being automatically deleted"
    default = 1209600  // 14 days
}

variable "encrypt_at_rest" {
    type = bool
    description = "Whether messages should be encrypted on the queue"
    default = true
}

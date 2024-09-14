output "queue_id" {
  value = aws_sqs_queue.queue.id
}

output "queue_arn" {
  value = aws_sqs_queue.queue.arn
}

output "queue_url" {
  value = aws_sqs_queue.queue.url
}

output "dlq_id" {
  value = aws_sqs_queue.dlq.id
}

output "dlq_arn" {
  value = aws_sqs_queue.dlq.arn
}

output "dlq_url" {
  value = aws_sqs_queue.dlq.url
}

output "queue_access_policy_arn" {
  value = aws_iam_policy.queue_access_policy.arn
}

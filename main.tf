resource "aws_sqs_queue" "queue" {
  name                       = var.queue_name
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  visibility_timeout_seconds = var.visbility_timeout_seconds
  message_retention_seconds  = var.queue_message_retention_seconds
  sqs_managed_sse_enabled    = var.encrypt_at_rest

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = var.max_receive_count
  })
}

resource "aws_sqs_queue" "dlq" {
  name                       = "${var.queue_name}-dlq"
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  visibility_timeout_seconds = var.visbility_timeout_seconds
  message_retention_seconds  = var.dlq_message_retention_seconds
  sqs_managed_sse_enabled    = var.encrypt_at_rest
}

resource "aws_sqs_queue_redrive_allow_policy" "dlq_redrive_allow_policy" {
  queue_url = aws_sqs_queue.dlq.id

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.queue.arn]
  })
}

data "aws_iam_policy_document" "queue_access_policy_doc" {
  statement {
    effect = "Allow"

    actions = [
      "sqs:ChangeMessageVisibility",
      "sqs:DeleteMessage",
      "sqs:GetQueueUrl",
      "sqs:ReceiveMessage",
      "sqs:SendMessage",
    ]

    resources = [
      aws_sqs_queue.queue.arn,
      aws_sqs_queue.dlq.arn,
    ]
  }
}

resource "aws_iam_policy" "queue_access_policy" {
  name        = "${var.queue_name}-queue-access"
  description = "allow access to the ${var.queue_name} queue and dlq"
  policy      = data.aws_iam_policy_document.queue_access_policy_doc.json
}

# terraform-aws-sqs
Simple TF module for provisioning an SQS queue, a DLQ, a redrive policy, and attaches basic permissions to a provided IAM role.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sqs_queue.dlq](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue.queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue_redrive_allow_policy.dlq_redrive_allow_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_redrive_allow_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dlq_message_retention_seconds"></a> [dlq\_message\_retention\_seconds](#input\_dlq\_message\_retention\_seconds) | How long a message can live on the dlq before being automatically deleted | `number` | `1209600` | no |
| <a name="input_encrypt_at_rest"></a> [encrypt\_at\_rest](#input\_encrypt\_at\_rest) | Whether messages should be encrypted on the queue | `bool` | `true` | no |
| <a name="input_max_receive_count"></a> [max\_receive\_count](#input\_max\_receive\_count) | Number of times a message can go back on the queue before being DLQ'd | `number` | `5` | no |
| <a name="input_queue_message_retention_seconds"></a> [queue\_message\_retention\_seconds](#input\_queue\_message\_retention\_seconds) | How long a message can live on the queue before being automatically deleted | `number` | `345600` | no |
| <a name="input_queue_name"></a> [queue\_name](#input\_queue\_name) | What you want this queue to be called | `string` | n/a | yes |
| <a name="input_receive_wait_time_seconds"></a> [receive\_wait\_time\_seconds](#input\_receive\_wait\_time\_seconds) | How long a connection should linger if there are no messages. Max 20. | `number` | `20` | no |
| <a name="input_visbility_timeout_seconds"></a> [visbility\_timeout\_seconds](#input\_visbility\_timeout\_seconds) | How long before a message is visible again on the queue if it's not deleted after receiving | `number` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dlq_arn"></a> [dlq\_arn](#output\_dlq\_arn) | n/a |
| <a name="output_dlq_id"></a> [dlq\_id](#output\_dlq\_id) | n/a |
| <a name="output_dlq_url"></a> [dlq\_url](#output\_dlq\_url) | n/a |
| <a name="output_queue_arn"></a> [queue\_arn](#output\_queue\_arn) | n/a |
| <a name="output_queue_id"></a> [queue\_id](#output\_queue\_id) | n/a |
| <a name="output_queue_url"></a> [queue\_url](#output\_queue\_url) | n/a |
<!-- END_TF_DOCS -->
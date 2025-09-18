# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

data "aws_route53_zone" "selected" {
  name = "nick-philbrook.sbx.hashidemos.io"
}

resource "aws_route53_record" "dns_records" {
  for_each = toset(var.public_dns_names)
  zone_id  = data.aws_route53_zone.selected.zone_id
  name     = "alias-${each.value}"
  type     = "CNAME"
  ttl      = 300
  records  = [each.value]
}

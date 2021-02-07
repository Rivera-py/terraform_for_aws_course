provider "aws" {
    region = "eu-west-2"
}

resource "aws_iam_user" "myUser" {
    name = "TFCreatedUser"
}

resource "aws_iam_policy" "customPolicy" {
    name = "GlacierEFSEC2"

    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "elasticfilesystem:DescribeBackupPolicy",
                "glacier:AbortMultipartUpload",
                "elasticfilesystem:ListTagsForResource",
                "glacier:CreateVault",
                "glacier:ListParts",
                "glacier:DeleteVaultNotifications",
                "glacier:ListJobs",
                "elasticfilesystem:DescribeLifecycleConfiguration",
                "elasticfilesystem:ClientMount",
                "glacier:InitiateMultipartUpload",
                "elasticfilesystem:DescribeFileSystemPolicy",
                "glacier:PurchaseProvisionedCapacity",
                "glacier:UploadArchive",
                "elasticfilesystem:DescribeFileSystems",
                "elasticfilesystem:DescribeMountTargets",
                "glacier:InitiateJob",
                "glacier:ListTagsForVault",
                "glacier:DeleteVault",
                "glacier:DeleteArchive",
                "elasticfilesystem:DescribeAccessPoints",
                "elasticfilesystem:DescribeTags",
                "glacier:ListMultipartUploads",
                "glacier:SetVaultNotifications",
                "glacier:CompleteMultipartUpload",
                "glacier:UploadMultipartPart",
                "glacier:ListVaults",
                "glacier:ListProvisionedCapacity",
                "elasticfilesystem:DescribeMountTargetSecurityGroups"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "policyBind" {
    name = "attachment"
    users = [aws_iam_user.myUser.name]
    policy_arn = aws_iam_policy.customPolicy.arn
}
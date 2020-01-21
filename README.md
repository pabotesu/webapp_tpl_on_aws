# READ ME

### webapp_tpl_on_aws

- 動作環境
  - 動作OS : Linux laptop 5.4.12-arch1-1
  - Terraform バージョン：Terraform v0.12.5
  - IaaSプロバイダ：AWS
    - リージョン：ap-northeast-1（東京リージョン）
    - AZ : ap-northeast-1a, ap-northeast-1c, ap-northeast-1d
    - 採用リソース：EC2, RDS, ALB, S3, VPC
- 動作手法
  1. terraform をインストールしてください.
  2. /staging： このディレクトリの内容がベースなので適当にコピペして使ってください.
  3. /terraform.tfvarsにアカウント情報を記録してください.
  4. /staging/variables.tfの中身を適当に設定してください.
  5. [$ terraform plan]でドライランしてください.このとき,リソースの内容を確認してください.
  6. [$ terraform apply]でリソースの適用を行ってください.

- 適用イメージ

  - こんな感じのリソースを展開できます.

  - AZ分インスタンスとサブネットを増やせます.

![webapp_tpl_on_aws](https://user-images.githubusercontent.com/35569302/72770639-d27a6980-3c41-11ea-8232-8d08f0ada0e3.png)



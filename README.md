<div align="center">

# Tech Challenge - API Gateway

![GitHub Release Date](https://img.shields.io/badge/Release%20Date-Dezembro%202024-yellowgreen)
![](https://img.shields.io/badge/Status-Em%20Desenvolvimento-yellowgreen)
<br>
![](https://img.shields.io/badge/Version-%20v1.0.0-brightgreen)
</div>

## 💻 Descrição

Este repositório é responsável criar a API Gateway.

## 🛠 Tecnologias Utilizadas

<div align="center">

![AWSAPIGateway](https://img.shields.io/badge/Amazon%20API%20Gateway-FF4F8B.svg?style=for-the-badge&logo=Amazon-API-Gateway&logoColor=white)
![GithubActions](https://img.shields.io/badge/GitHub%20Actions-2088FF.svg?style=for-the-badge&logo=GitHub-Actions&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)

</div>

## ⚙️ Configuração

### Pré-requisitos

1. É necessário executar a pipeline para criar o VPC no repositório: https://github.com/fiap-soat-12/fiap-soat-tech-challenge-vpc
2. É necessário executar a pipeline para criar o RDS no repositório: https://github.com/fiap-soat-12/fiap-soat-tech-challenge-db
3. É necessário executar a pipeline para criar a imagem no ECR no repositório: https://github.com/fiap-soat-12/fiap-soat-tech-challenge-api
4. É necessário executar a pipeline para criar o Cluster e a Infraestrutura no repositório: https://github.com/fiap-soat-12/fiap-soat-tech-challenge-k8s
5. É necessário executar a pipeline para criar a Lambda Authorize no repositório: https://github.com/fiap-soat-12/fiap-soat-tech-challenge-lambda-auth

### Desenvolvimento

- **[Terraform](https://www.terraform.io/)**: Site oficial do Terraform.
- **[AWS](https://aws.amazon.com/pt/)**: Site oficial da AWS.

## 🚀 Execução

### Subindo a API Gateway

  Caso deseje subir a API gateway, basta seguir os seguintes passos:
  
  1. Certificar que o Terraform esteja instalado executando o comando `terraform --version`;
  ![terraform-version](./assets/terraform-version.png)

  2. Certificar que o `aws cli` está instalado e configurado com as credenciais da sua conta AWS;
  ![aws-cli-version](./assets/aws-cli-version.png)

  3. Acessar a pasta `terraform` que contém os arquivos que irão criar a API gateway;
  4. Inicializar o Terraform no projeto `terraform init`;
  5. Verificar que o script do Terraform é valido rodando o comando `terraform validate`;
  6. Executar o comando `terraform plan` para executar o planejamento da execução/implementação;
  7. Executar o comando `terraform apply` para criar a API gateway;
  8. Após a execução do Terraform finalizar, verificar se a API gateway subiu corretamente na AWS;
  ![api-gateway-aws-image](./assets/api-gateway-aws-image.png)

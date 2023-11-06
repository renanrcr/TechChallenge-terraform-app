# TechChallenge-terraform-infra
FIAP - Software Architecture FASE 3 Tech Challenge

![GitHub](https://img.shields.io/github/license/dropbox/dropbox-sdk-java)

## :memo: Descrição
Este projeto foi criado como parte do Tech Challenge do curso da Pós Tech - Software Architecture (FIAP) e tem como objetivo implementar a infraestrutura na AWS para um sistema de autoatendimento de fast food.

Desta forma, foram criados módulos para gerenciar a parte da API Gateway e Lambda.

## :wrench: Tecnologias utilizadas
* Terraform;

## :rocket: Rodando o projeto
Para rodar o repositório é necessário clonar ou fazer o download, dar o seguinte comando para iniciar o projeto:

```
terraform init
terraform validate
```

Se o resultado da validação for sucesso, execute o comando abaixo preenchendo com os dados da AWS:
```
terraform plan
```

E, por último, execute o comando responsável por aplicar as alterações na AWS.
```
terraform apply
```

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.5.0)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (>= 5.0.0)

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws) (>= 5.0.0)

## :handshake: Colaboradores
<table>
  <tr>
    <td align="center">
      <a href="https://github.com/renanrcr">
        <img src="https://avatars.githubusercontent.com/u/83503490?v=4" width="100px;" alt="Foto de Renan Rinaldi no GitHub"/><br>
        <sub>
          <b>Renan Rinaldi</b>
        </sub>
      </a>
    </td>
  </tr>
</table>

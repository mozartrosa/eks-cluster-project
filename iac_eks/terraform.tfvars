# variables.tf define variáveis e tipos
# *.tfvars, inicializa as variáveis com valores durante a execução

cidr_block   = "10.0.0.0/16"
project_name = "ekspp"
region = "us-east-1"
tags = {
    "Time": "SRE"
}

# Com ci_cd as variáveis não estavam sendo efetivas, porque arquivo estava incluso no .gitignore


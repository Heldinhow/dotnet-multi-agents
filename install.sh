#!/bin/bash
# install.sh - Script de instalação do projeto dotnet-multi-agents
# Uso: ./install.sh /caminho/para/repositorio

set -e

if [ -z "$1" ]; then
  echo "Uso: $0 /caminho/para/repositorio"
  exit 1
fi

REPO_PATH="$1"

# Cria as pastas padrão se não existirem
echo "Criando diretórios em $REPO_PATH..."
mkdir -p "$REPO_PATH/.github"
mkdir -p "$REPO_PATH/prompts"

# Copia conteúdo da pasta .github
if [ -d ".github" ]; then
  echo "Copiando arquivos de .github..."
  cp -R .github/* "$REPO_PATH/.github/"
fi

# Copia arquivos essenciais se não existirem
for file in LICENSE README.md; do
  if [ ! -f "$REPO_PATH/$file" ] && [ -f "$file" ]; then
    cp "$file" "$REPO_PATH/"
  fi
done

# Copia prompts se não existirem
if [ -d "prompts" ]; then
  echo "Copiando prompts..."
  for prompt in prompts/*; do
    base=$(basename "$prompt")
    if [ ! -f "$REPO_PATH/prompts/$base" ]; then
      cp "$prompt" "$REPO_PATH/prompts/"
    fi
  done
fi

echo "Instalação concluída em $REPO_PATH."

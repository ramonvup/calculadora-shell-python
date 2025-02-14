# 📌 Calculadora Shell + Python  

Este repositório contém um script Shell (`calculadora.sh`) que verifica a instalação do Python3 e executa uma calculadora interativa, permitindo operações matemáticas e conversões.  

---

## 🚀 Como Executar  

### 🔹 Linux ou WSL (Windows Subsystem for Linux):  
1. **Dê permissão de execução ao script:**  
   ```bash
   chmod +x calculadora.sh```

Execute o script:

./calculadora.sh

O script verificará se o Python3 está instalado e, caso não esteja, tentará instalá-lo automaticamente.

##🖥️ Sobre o Código
O script Shell (calculadora.sh) executa as seguintes ações:

Verifica se o Python3 está instalado. Caso contrário, tenta instalá-lo.
Cria um arquivo Python temporário (calculadora.py) contendo a lógica da calculadora.
Executa o código Python, permitindo que o usuário interaja com a calculadora.
Após a execução, o script remove o arquivo calculadora.py, garantindo que o ambiente fique limpo.

🐍 Explicação do Código Python
O código Python (calculadora.py) implementa um menu interativo com as seguintes opções:

📌 Operações Matemáticas: Soma, subtração, multiplicação e divisão.
🌡️ Conversão de Temperatura: Celsius para Fahrenheit.
📏 Conversão de Medidas: Centímetros para metros.
📜 Histórico de Operações: Exibe todas as operações realizadas.
❌ Sair: Encerra a calculadora.
O usuário pode realizar cálculos em sequência, pois o resultado da última operação é salvo e pode ser reutilizado sem precisar digitá-lo novamente.

📜 Licença
Este projeto foi desenvolvido para fins educacionais no curso de Análise de Dados.
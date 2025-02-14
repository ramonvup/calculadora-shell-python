#!/bin/bash

# Verificar se o Python3 está instalado
if ! command -v python3 &> /dev/null; then
    echo "Python3 não está instalado. Instalando Python3..."
    
    # Detectar o sistema operacional e instalar o Python3
    if [ -f /etc/debian_version ]; then
        sudo apt update && sudo apt install -y python3 python3-pip
    elif [ -f /etc/redhat-release ]; then
        sudo yum install -y python3
    else
        echo "Sistema operacional não suportado para instalação automática."
        exit 1
    fi
fi

# Criar um script Python temporário para a calculadora
cat << EOF > calculadora.py
def main():
    historico = []  # Para armazenar o histórico de operações
    resultado = None  # Para armazenar o último resultado

    while True:
        print("\nMenu:")
        print("1. Soma")
        print("2. Subtração")
        print("3. Multiplicação")
        print("4. Divisão")
        print("5. Converter Celsius para Fahrenheit")
        print("6. Converter centímetros para metros")
        print("7. Mostrar Histórico")
        print("8. Sair")

        opcao = input("Escolha uma opção: ")

        if opcao == '8':
            print("Encerrando a calculadora...")
            break

        if opcao in ['1', '2', '3', '4']:
            try:
                a = resultado if resultado is not None else float(input("Digite o primeiro número: "))
                b = float(input("Digite o segundo número: "))
                
                if opcao == '1':
                    resultado = a + b
                    operacao = f"{a} + {b} = {resultado}"
                elif opcao == '2':
                    resultado = a - b
                    operacao = f"{a} - {b} = {resultado}"
                elif opcao == '3':
                    resultado = a * b
                    operacao = f"{a} * {b} = {resultado}"
                elif opcao == '4':
                    if b == 0:
                        print("Erro: divisão por zero.")
                        continue
                    resultado = a / b
                    operacao = f"{a} / {b} = {resultado}"
                
                print(f"Resultado: {resultado}")
                historico.append(operacao)
            except ValueError:
                print("Erro: entrada inválida. Tente novamente.")
        
        elif opcao == '5':
            try:
                celsius = float(input("Digite a temperatura em Celsius: "))
                fahrenheit = (celsius * 9/5) + 32
                print(f"{celsius}°C é igual a {fahrenheit}°F")
                historico.append(f"Conversão: {celsius}°C -> {fahrenheit}°F")
            except ValueError:
                print("Erro: entrada inválida. Tente novamente.")
        
        elif opcao == '6':
            try:
                cm = float(input("Digite o valor em centímetros: "))
                metros = cm / 100
                print(f"{cm} cm é igual a {metros} m")
                historico.append(f"Conversão: {cm} cm -> {metros} m")
            except ValueError:
                print("Erro: entrada inválida. Tente novamente.")
        
        elif opcao == '7':
            if historico:
                print("\nHistórico de Operações:")
                for operacao in historico:
                    print(operacao)
            else:
                print("Nenhuma operação realizada até o momento.")
        else:
            print("Opção inválida! Tente novamente.")

if __name__ == "__main__":
    main()
EOF

# Executar o script Python
python3 calculadora.py

# Remover o script Python após execução
rm calculadora.py

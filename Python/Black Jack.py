#!/usr/bin/env python
# coding: utf-8

# In[ ]:


#BlackJack
pontos = {}
ativo = {}
fim=''

def principal():
    jogadores = []
    InputCorreto = False
    nJogadores = 0
    while nJogadores == 0:
        try:
            nJogadores = int(input('Insira o número de jogadores: '))
        except:
            nJogadores = 0
    i = 1
    while i <= nJogadores:
        jogador = input(f'Insira o nome do jogador nº {i} :')
        jogadores.append(jogador)
        i = i + 1
        ativo[jogador] = 1
        pontos[jogador] = 0
    criaBaralho()
    while nJogadores != 0 :
        for jogador in jogadores:
            if ativo[jogador] == 1:
                jogada(jogador)
            nJogadores = sum(ativo.values())
    verificacao()
    
def criaBaralho():
    baralho = []
    baralho.append('Às')
    i = 2
    while i <= 10:
        baralho.append(str(i))
        i = i + 1
    baralho.append('Valete')
    baralho.append('Dama')
    baralho.append('Rei')
    return baralho
    
def jogada(jogador):
    resposta = ' '
    while resposta[0] not in ('s', 'S', 'n', 'N'):
        resposta = input(f'{jogador} deseja sortear uma carta? ') + ' '
    if resposta[0] in ('s', 'S'):
        pontos[jogador] = pontos[jogador] + sorteio()
        print(f'Pontuação do jogador {jogador}: {pontos[jogador]}')
        if pontos[jogador] > 21:
            ativo[jogador] = 0
            print(f'{jogador}, sua pontuação ultrapassou 21')
    else:
        ativo[jogador] = 0

def sorteio():
    import random
    baralho = criaBaralho()
    carta = random.randint(0, 12)
    carta = baralho[carta]
    print(f'Carta sorteada: {carta}')
    try:
        pontos = int(carta)
    except:
        if carta == 'Às':
            pontos = 1
        else:
            pontos = 10
    return pontos
    
def verificacao():
    maiorPonto = 0
    for jogador in pontos:
        if pontos[jogador] > 21:
            pontos[jogador] = 0
        elif maiorPonto < pontos[jogador]:
            maiorPonto = pontos[jogador]
    for jogador in pontos:
        if maiorPonto == pontos[jogador]:
            print(f'Vencedor: {jogador}, com {pontos[jogador]} pontos!')
            fim = input('')
    
principal()     


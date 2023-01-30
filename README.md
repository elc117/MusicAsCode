# MAC - Music as Code
![mac](https://user-images.githubusercontent.com/74078237/215487202-c8a76e6a-d008-4003-a618-a9fd9db374b8.png)

# Descrição

Este trabalho busca realizar a produção de um segmento de música utilizando código. Para isso, utilizou-se do Software Sonic Pi, que é uma ferramenta para programação ao vivo baseado em ruby. O código define vários loops de amostra de som, como o "live_loop :kick", que toca o som do kick de uma bateria, o "live_loop :snarez", que toca o som de um snare, e o "live_loop :open_hats", que toca o som de um prato de bateria. Cada loop define as propriedades de volume, tempo e efeitos de som para cada som de instrumento. Os alguns "hits" são feitos utilizando Drum Kits, que são batidas únicas de uma bateria.

## Quer saber mais sobre como esses sons funcionam? Segue o fio:

> What Is a Drum Kit?
A drum kit is a multi-piece musical instrument comprised of various percussion instruments, primarily drums and cymbals. Traditionally, a drummer plays a drum kit with drumsticks, rods, brushes, and occasionally mallets (collectively known as beaters). <br>
Drums fit in the category of membranophones—instruments that make sounds by striking a membrane (called a drum head) stretched across a solid frame called a drum shell.<br> Snare drums, kick drums (or bass drums), floor toms, rack toms, bongos, timbales, and congas are all membranophone drums. <br><br>
Fonte: [Drum Kit Guide: Basic parts pf a 5-piece Drum Kit](https://www.masterclass.com/articles/drum-kit-guide)

Para aprender mais sobre cada pedacinho do drum você pode acessar a página [Parts of a Drum Kit - Beginner Drum](https://beginnerdrums.uk/parts-of-a-drum-kit/)

# O Código
## Header
``` ruby
use_debug false
use_bpm 150 # BPM Def
```
O primeiro passo é definir o BPM (Batidas por minuto), é oq dita do ritimo da musica vamos testar com 150, mas 130 Padrão pra esse estilo de música, esta velocidade também é utilizada no [Trap e Rap](https://blog.beatstars.com/posts/trap-bpm-guide), #eletronicas mais pesadas, como [psytrance utilizam um BPM mais elevado](https://psytranceguide.com/)(145-158 bpm).

## Pattern
```Ruby
define :pattern do |pattern|
  return pattern.ring.tick ==  "x"
end
```
Esta função é usada pra definir o ritmo de alguns instrumentos, ex: "x--x---x-xx-x---x--x" forma uma sequencia de batidas, que quando estão em um loop formam um padrao para o instrumento, toda vez que a string apresentar um X, toca o  hit do instrumento.
## Nossa Mix Rack
```Ruby
master_vol = (ramp *range(0, 1, 0.01))
kickv = 1
bassv = 1
revbassv = 1
snarev = 0.5
hh = 0.5
oh_vol = 1
sint_vol = 1
pads = 1
beeep = 0.5
fadein = (ramp *range(0, 1, 0.01))
cutoff_kicks = range(50, 80, 0.5).mirror
```
É utilizada para realizar o controle do volume da bateria e sintetizadores.
## Loops
```ruby
live_loop :kick do
  #stop
  kick = "C:/Users/gleis/Desktop/Sonic Pi/drum/Major/Kicks/[MS] Kick - Moody.wav"
  if (spread 1, 4).tick then
    sample kick, amp: master_vol.look * 1, cutoff: cutoff_kicks.look
  end
  sleep 0.25
end
```
Criamos um laço de repetição infinito utilizando live_loop, dessa forma o nosso kick extraido de 3 drum kits ([drake¹](https://www.youtube.com/watch?v=yf-lMrfqtU8), [major²](https://www.youtube.com/watch?v=hZfUIEg61X4) e [house³](https://www.youtube.com/watch?v=XhDzcMZlies)), para utilizar um .wav como referência de hit para o instrumento precisamos definir o path em uma variavel. Tocamos nosso hit utilizando a função sample. Utilizamos sleep como um delay entre cada batida, poderiamos chamar nossa função "pattern", porém sleep nos dá uma precisão maior. Caso você queira para o Kick em algum ponto da sua música, basta descomentar o "stop". Aplicamos também alguns filtros ao longo do nosso código, como: 

- Amp: É um amplificador, aplica uma multiplicação recorrente em nosso mixer do volume principal, fazendo com que o volume do Kick aumente gradualmente.
 
- Cutoff
Frequência de Corte, o filtro "abre e fecha" onde o filtro começa e acaba.

- Envelope: Dispositivo que altera um ajuste básico por uma quantidade desejada em intervalos de tempo regulares.
Geradores de envelope são geralmente utilizados para alterar a forma de onda em termos de afinação, filtro e volume.

- Release: Num gerador de envelope, "Release" ajusta a velocidade com a qual um envelope retorna ao valor zero. Num processador dinâmico, ajusta a velocidade com a qual o processador pára de operar.

- Resonance (ressonância): Controle de ganho que eleva a frequência de corte. Este controle pode ser manipulado, através de técnicas de performance, como velocity, ou automaticamente, através de geradores de Envelope ou de LFOs.

Ao longo do nosso código temos diversos Live_Loops, a união de todos eles é o que define a alma da nossa música. 

# Curiosidades 

[Dj Dave tocou no GitHub Universe 2021](https://www.youtube.com/watch?v=JDxhkdm_t1U) fazendo uma música do 0 AO VIVO!

Sonic Pi foi desenvolvido por Sam Aaron com propósitos educacionais na universidade de Cambridge, porém tem ganhado cada vez mais espaço entre os BeatMakers, DJs e Produtores musicais. O projeto teve colaboração da Raspberry Pi Fundation, então a origem do "Pi" em seu nome.

Quer aprender mais e explorar o mundo de Sonic Pi? Dá uma olhada na comunidade [In Thread](https://in-thread.sonic-pi.net/).

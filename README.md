# MAC - Music as Code
![mac](https://user-images.githubusercontent.com/74078237/215487202-c8a76e6a-d008-4003-a618-a9fd9db374b8.png)

# Descrição

Este trabalho busca realizar a produção de um segmento de música utilizando código. Para isso, utilizou-se do Software Sonic Pi, que é uma ferramenta para programação ao vivo baseado em ruby. O código define vários loops de amostra de som, como o "live_loop :kick", que toca o som do kick de uma bateria, o "live_loop :snarez", que toca o som de um snare, e o "live_loop :open_hats", que toca o som de um prato de bateria. Cada loop define as propriedades de volume, tempo e efeitos de som para cada som de instrumento. Os alguns "hits" são feitos utilizando Drum Kits, que são batidas únicas de uma bateria.

# Quer saber mais sobre como esses sons funcionam? Segue o fio:

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
O primeiro passo é definir o BPM (Batidas por minuto), é oq dita do ritimo da musica vamos testar com 150, mas 130 Padrão pra esse estilo de música, esta velocidade também é utilizada no [Trap e Rap](https://blog.beatstars.com/posts/trap-bpm-guide), #eletronicas mais pesadas, como psytrance utilizam um BPM mais elevado,
#A exemplo, BoomBap utiliza de 60 a 110

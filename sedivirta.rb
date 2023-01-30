# Welcome to Sonic Pi
use_debug false
use_bpm 90 # BPM Def

# Adicione SEU PROPRIO SAMPLE PACK, SUBSTITUA OS PATHS PELO PATH DOS RITIMOS QUE VOCÊ DESEJAR!!!

#Função usada pra definir o ritmo de alguns instrumentos, ex: "x--x---x-xx-x---x--x" forma uma
#sequencia de batidas, em um loop, forma um padrao para o instrumento, toda vez q for X, toca o
#hit do instrumento
define :pattern do |pattern|
  return pattern.ring.tick ==  "x"
end

#Mixer - Controla volumes da bateria e sintetizadores
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
#fadein = (ring 0.5)
live_loop :kick do
  kick = "/project/packs/kick/[MS] Kick - Moody.wav"
  if (spread 1, 4).tick then
    sample kick, amp: master_vol.look * 1, cutoff: cutoff_kicks.look
    #fade cria uma transicao de volume no Kick (grave)
  end
  sleep 0.25
end

define :snare do |amp|
  snare = "/project/packs/snare/09_PH_Snare.wav"
  sample snare, amp: amp, start: 0.15, finish: 0.35, rate: 0.7
end

live_loop :snarez do
  sleep 1
  snare 1 * master_vol.tick * snarev
  sleep 1
end

live_loop :snare_stop do
  sync :snarez
  sleep 15.75
  with_fx :reverb, mix: 0.3, room: 0.8 do
    with_fx :echo, mix: 0.4, decay: 12, phase: 0.75 do
      snare 0.5 * master_vol.tick * snarev
    end
  end
  sleep 0.25
end

oh_cutoffs = range(120, 130, 0.5).mirror
live_loop :open_hats do
  oh = "/project/packs/openhat/openhihat 66.wav"
  sync :kick
  with_fx :echo, amp: oh_vol * master_vol.look,
  mix: 0.4, decay: 4, phase: 0.75 do
    with_fx :hpf, cutoff: oh_cutoffs.tick do
      with_fx :reverb, mix: 0.4, room: 0.8 do
        sleep 0.5
        sample oh, start: 0.2, finish: 0.3, amp: 0.5
        sleep 0.5
      end
    end
  end
end

live_loop :hh, sync: :kick, attack: 0.05, decay: 0.08, release: 0.1 do
  hh = "project/packs/hithat/Migos_HiHat.wav"
  #if(spread 3, 8).tick then
  with_fx :rhpf, cutoff: 125, res: 0.8 do
    sample hh if pattern "x--x--x-"
    sleep 0.25
  end
end
live_loop :hats2 do
  #modo de fazer um hi-hat sem .Wav (pegando um continuo e aplicando interrupcoes)
  sync :kick
  with_fx :slicer, mix: 1, phase: 0.25, pulse_width: 0.1 do
    with_fx :rhpf, cutoff: 130 do
      with_synth :noise do
        play :d1, decay: 1.15
      end
    end
  end
  sleep 1
end
ritimo_bass = (ring 1, 0, 0, 0, 1, 0, 0, 0,
               1, 0, 0.5, 0, 1, 0, 0.5, 0)
notas_grave = (stretch [:d1] * 12 + [:f1, :f1, :a1, :f1], 8)
live_loop :bass do
  sync :kick
  with_synth :fm do
    play notas_grave.look, amp: master_vol.look * ritimo_bass.tick,
      attack: 0.04, divisor: 1, depth: 2.6
  end
  sleep 0.25
end

live_loop :reverbforbass do
  sync :snare
  sleep 7.5
  with_fx :pan, pan: -0.5 do
    with_synth :fm do
      play :d1, attack: 0.5,divisor: 0.5, depth: 5
    end
    sleep 0.5
  end
end

dchord = chord(:d2, :minor, num_octaves: 3)
sintetizador_pulse = (ring 1.5, 1.5, 1)
cutoff_sintetizador = range(60, 100, 0.5).mirror
transposicao = (stretch 0, 36) + (stretch -12, 6) + (stretch 12, 6)
phase = (stretch 0.75, 15) + [0.25]
pan = (ring -0.5, 0.5)
live_loop :synth do
  sync :kick
  ch = invert_chord(dchord, rand_i(3))
  sleep sintetizador_pulse.tick
  with_fx :echo, amp: sint_vol * master_vol.look, mix: 0.4,
  decay: 7.6, phase: phase.look do
    with_fx :pan, pan: pan.look do
      with_fx :reverb, room: 0.65, damp: 0.8 do
        with_synth_defaults attack: 0.05, release: 0.3 do
          with_transpose transposicao.look do
            with_synth :sine do
              play_chord ch
            end
            cutoff = cutoff_sintetizador.look
            with_fx :ixi_techno, cutoff_min: cutoff,
            cutoff_max: cutoff - 30, phase: 1, res: 0.4 do
              with_synth :dsaw do
                play_chord ch, attack: 0.1
              end
            end
          end
        end
      end
    end
  end
end
live_loop :pad do
  sync :snares
  dubpad dchord, master.tick * pad_volume
  sleep 16
end

#Em sincronia com o kick o beep é tocado em uma determinada sequência de notas com volume progressivo
beep_notes = (ring :d2, :d2, :f2, :e2, :d3, :g2)
live_loop :beeps do
  sync :kick
  sleep 0.5
  with_fx :distortion do
    with_synth :beep do
      play beep_notes.tick, amp: beeep * master_vol.look,
        decay: 0.2, release: 0.1
    end
  end
  sleep 0.5
end
